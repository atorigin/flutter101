import 'package:flutter/material.dart';
import 'package:flutter06/screen/experience_screen.dart';
import 'package:flutter06/screen/home_screen.dart';
import 'package:flutter06/screen/profile_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      );
    }
    
    final GoRouter _router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: "/",
          builder: (BuildContext context , GoRouterState state) {
            return const HomeScreen();
          }
        ),

        GoRoute(
          path: "/profile",
          builder: (BuildContext context , GoRouterState state) {
            return const ProfileScreen();
          }
        ),

        GoRoute(
          path: "/experience",
          builder: (BuildContext context , GoRouterState state) {
            return const ExperienceScreen();
          }
        )
      ]
    );
}