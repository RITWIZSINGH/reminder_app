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
      // Gradient background for the entire app
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
            // Modern AppBar with gradient
            Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4A6CF7), Color.fromARGB(255, 21, 53, 234)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: _reminders.length,
                  itemBuilder: (context, index) {
                    final reminder = _reminders[index];
                    return Dismissible(
                      key: Key(reminder.id),
                      background: Container(
                        color: Colors.red.withAlpha(175),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => _deleteReminder(reminder.id),
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
                              color: reminder.isCompleted
                                  ? Colors.grey
                                  : Colors.black87,
                            ),
                          ),
                          trailing: Checkbox(
                            activeColor: Color(0xFF4A6CF7),
                            value: reminder.isCompleted,
                            onChanged: (_) =>
                                _toggleReminderStatus(reminder.id),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Gradient Floating Action Button
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
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
                      // padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      _addReminder();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add Reminder'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "NexaBold",
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  )
                ],
              ),
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
      ),
    );
  }
}
