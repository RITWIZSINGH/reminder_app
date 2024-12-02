import 'package:flutter/material.dart';
import 'package:reminder_app/models/reminder.dart';
import '../widgets/gradient_app_bar.dart';
import '../widgets/reminder_list_item.dart';
import '../widgets/gradient_floating_action_button.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<Reminder> _reminders = [
    Reminder(id: '1', text: 'Buy groceries'),
    Reminder(id: '2', text: 'Call mom'),
    Reminder(id: '3', text: 'Finish project report'),
  ];

  final TextEditingController _reminderController = TextEditingController();

  void _addReminder() {
    if (_reminderController.text.isNotEmpty) {
      setState(() {
        _reminders.add(Reminder(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: _reminderController.text,
        ));
        _reminderController.clear();
      });
    }
  }

  void _deleteReminder(String id) {
    setState(() {
      _reminders.removeWhere((reminder) => reminder.id == id);
    });
  }

  void _toggleReminderStatus(String id) {
    setState(() {
      final index = _reminders.indexWhere((r) => r.id == id);
      if (index != -1) {
        _reminders[index].isCompleted = !_reminders[index].isCompleted;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0F4F8), Color(0xFFE0E7EF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            GradientAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: _reminders.length,
                  itemBuilder: (context, index) {
                    return ReminderListItem(
                      reminder: _reminders[index],
                      onToggle: _toggleReminderStatus,
                      onDelete: _deleteReminder,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GradientFloatingActionButton(
        controller: _reminderController,
        onAdd: _addReminder,
      ),
    );
  }
}