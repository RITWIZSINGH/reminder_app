import 'package:flutter/material.dart';

class AddReminderBottomSheet extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const AddReminderBottomSheet({
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new reminder',
              hintStyle: TextStyle(fontFamily: "NexaRegular"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4A6CF7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              onAdd();
              Navigator.of(context).pop();
            },
            child: Text(
              'Add Reminder'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: "NexaBold",
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}