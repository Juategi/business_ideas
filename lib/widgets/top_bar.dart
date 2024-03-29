import 'package:flutter/material.dart';

class TopBar {
  static AppBar build(String title, Color color, {Widget? endWidget}) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          endWidget ?? const SizedBox(),
        ],
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
