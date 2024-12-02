import 'package:flutter/material.dart';

class Reminder {
  String id;
  String text;
  bool isCompleted;

  Reminder({required this.id, required this.text, this.isCompleted = false});
}

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
            text: _reminderController.text));
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
      backgroundColor: Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text(
          'My Reminders',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "NexaBold"),
        ),
        backgroundColor: Color(0xFF4A6CF7),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final reminder = _reminders[index];
          return Dismissible(
            key: Key(reminder.id),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => _deleteReminder(reminder.id),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: reminder.isCompleted ? 0.5 : 1.0,
              child: Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Text(
                    reminder.text,
                    style: TextStyle(
                      fontFamily: "NexaRegular",
                      decoration: reminder.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color:
                          reminder.isCompleted ? Colors.grey : Colors.black87,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: Color(0xFF4A6CF7),
                    value: reminder.isCompleted,
                    onChanged: (_) => _toggleReminderStatus(reminder.id),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A6CF7),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
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
                    controller: _reminderController,
                    decoration: InputDecoration(
                      hintText: 'Enter new reminder',
                      hintStyle: TextStyle(fontFamily: "NexaRegular"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A6CF7),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      _addReminder();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add Reminder'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontFamily: "NexaBold"),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
