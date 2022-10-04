import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                  context.go('/profile');
                },
              child: const Text('Go to Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go("/experience");
              },
              child: const Text("Go to Experience"),
            )
          ]
        )
      ),
    );
  }
}