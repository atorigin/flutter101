import 'package:flutter/material.dart';
import 'package:flutter06/component/app_bar.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: menuTopBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset("assets/sonans01.jpg",width: 580, height: 326)
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  context.go('/profile');
                },
                child: const Text('Go to Profile'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Colors.purple,
              //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              //   textStyle: const TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold
              //   )
              // ),
              onPressed: () {
                context.go("/experience");
              },
              child: const Text("Go to Experience"),
              ),
            ),
          ]
        )
      ),
    );
  }
}