import 'package:flutter/material.dart';

class TopBar {
  static AppBar build(String title, Color color) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
