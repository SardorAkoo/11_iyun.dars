import 'package:flutter/material.dart';
import 'package:uyishi_11dars/utils/routnames.dart';
import 'package:uyishi_11dars/views/screens/course_screen.dart';
import 'package:uyishi_11dars/views/screens/favorite_screens.dart';
import 'package:uyishi_11dars/views/screens/home_screen.dart';
import 'package:uyishi_11dars/views/screens/lesson_screen.dart';
import 'package:uyishi_11dars/views/screens/login_screen.dart';
import 'package:uyishi_11dars/views/screens/note_screen.dart';
import 'package:uyishi_11dars/views/screens/quiz_screen.dart';
import 'package:uyishi_11dars/views/screens/settings_screen.dart';
import 'package:uyishi_11dars/views/screens/todo_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.homeRoute: (ctx) => const HomeScreens(),
    RouteNames.settingsRoute: (ctx) => const SettingsScreen(),
    RouteNames.todoRoute: (ctx) => const TodoAppScreens(),
    RouteNames.noteRoute: (ctx) => const NotesScreens(),
    RouteNames.courseRoute: (ctx) => const CourseListScreen(),
    RouteNames.lessonRoute: (ctx) => const LessonListScreen(),
    RouteNames.quizRoute: (ctx) => const QuizScreen(),
    RouteNames.loginRoute: (ctx) => const LoginScreen(),
    RouteNames.favoriteRoute: (ctx) =>  FavoriteScreen(),
  };
}
