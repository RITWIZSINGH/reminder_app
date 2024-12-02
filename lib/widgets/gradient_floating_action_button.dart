import 'package:flutter/material.dart';
import 'add_reminder_bottom_sheet.dart';

class GradientFloatingActionButton extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const GradientFloatingActionButton({
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => AddReminderBottomSheet(
            controller: controller,
            onAdd: onAdd,
          ),
        );
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A6CF7), Color.fromARGB(255, 41, 67, 215)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}