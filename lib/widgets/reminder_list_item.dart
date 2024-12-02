import 'package:flutter/material.dart';
import '../models/reminder.dart';

class ReminderListItem extends StatelessWidget {
  final Reminder reminder;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const ReminderListItem({
    required this.reminder,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(reminder.id),
      background: Container(
        color: Colors.red.withAlpha(175),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(reminder.id),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            reminder.text,
            style: TextStyle(
              fontFamily: "NexaRegular",
              fontSize: 16,
              decoration: reminder.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: reminder.isCompleted ? Colors.grey : Colors.black87,
            ),
          ),
          trailing: Checkbox(
            activeColor: Color(0xFF4A6CF7),
            value: reminder.isCompleted,
            onChanged: (_) => onToggle(reminder.id),
          ),
        ),
      ),
    );
  }
}