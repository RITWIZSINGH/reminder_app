class Reminder {
  String id;
  String text;
  bool isCompleted;

  Reminder({required this.id, required this.text, this.isCompleted = false});
}