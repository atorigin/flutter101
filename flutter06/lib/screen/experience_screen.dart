import 'package:flutter/material.dart';
import 'package:flutter06/component/app_bar.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: menuTopBar(context),
      body: const Center(
        child: Text("This is Experience"),
      )
    );
  }
}