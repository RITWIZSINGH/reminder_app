import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4A6CF7), Color.fromARGB(255, 21, 53, 234)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            'My Reminders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "NexaBold",
            ),
          ),
        ),
      ),
    );
  }
}