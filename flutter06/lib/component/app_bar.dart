import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

PreferredSizeWidget menuTopBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: AppBar(
      leading: IconButton(
        onPressed: () {
          context.go("/");
        },
        icon: const Icon(Icons.menu)
      ) ,
      backgroundColor: Colors.cyanAccent[100],
    ), 
  );
}