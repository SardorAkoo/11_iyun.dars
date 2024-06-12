// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_11dars/controllers/course_controller.dart';
import 'package:uyishi_11dars/models/course.dart';
import 'package:uyishi_11dars/utils/app_contants.dart';
import 'package:uyishi_11dars/utils/card_provider.dart';
import 'package:uyishi_11dars/views/screens/card_sceen.dart';
import 'package:uyishi_11dars/views/screens/favorite_screens.dart';
import 'package:uyishi_11dars/views/widgets/add_course.dart';
import 'package:uyishi_11dars/views/widgets/custom_drawer.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final CourseController _courseController = CourseController();
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        centerTitle: true,
        title: Text(
          'Courses',
          style: TextStyle(
            fontSize: AppConstants.appBarTextSize,
            color: AppConstants.appBarTextColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FavoriteScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => CartScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.teal,
              size: 25,
            ),
          ),
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<List<Course>>(
        future: _courseController.fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No courses available'));
          } else {
            return _isGridView
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _buildCourseItem(snapshot.data![index]);
                    },
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _buildCourseItem(snapshot.data![index]);
                    },
                  );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(builder: (context) => const AddCourseScreen()),
          )
              .then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCourseItem(Course course) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                course.imageUrl,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_outline_sharp,
                          color: Colors.red,
                          size: 18,
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToFavorites(course);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        course.description,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: \$${course.price}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.teal,
                          size: 15,
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(course);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 15,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddCourseScreen(course: course),
                            ),
                          )
                              .then((value) {
                            setState(() {});
                          });
                        },
                      ),
                      // ? SERTSE
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 15,
                        ),
                        onPressed: () async {
                          await _courseController.deleteCourse(course.id);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
