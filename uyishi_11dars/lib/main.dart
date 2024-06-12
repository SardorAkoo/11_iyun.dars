// import 'package:flutter/material.dart';
// import 'package:main/utils/routes.dart';
// import 'package:main/views/screens/login_screen.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: AppRoutes.routes,
//       debugShowCheckedModeBanner: false,
//       home: const LoginScreen(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:main/utils/card_provider.dart';
// import 'package:main/views/screens/course_screen.dart';
// import 'package:main/views/screens/favorite_screens.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => CartProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Course App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: CourseListScreen(),
//       routes: {
//         '/favorites': (context) => FavoriteScreen(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uyishi_11dars/utils/card_provider.dart';
import 'package:uyishi_11dars/views/screens/card_sceen.dart';
import 'package:uyishi_11dars/views/screens/course_screen.dart';
import 'package:uyishi_11dars/views/screens/favorite_screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseListScreen(),
      routes: {
        '/favorites': (context) => FavoriteScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
