import 'package:flutter/widgets.dart';

class Activity {
  final String title;
  final String description;
  final bool isCompleted;
  final String time;

  Activity({
  required this.title,
  required this.description,
  this.isCompleted = false,
  this.time = ''
});
}

