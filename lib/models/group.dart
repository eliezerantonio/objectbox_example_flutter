import 'package:objectbox/objectbox.dart';

import 'task.dart';

class Group {
  int id = 0;
  String name;
  int color;

  @Backlink()
  final tasks = ToMany<Task>();

  Group({required this.name, required this.color});

  String taskDescription() {
    final taskCompleted = tasks.where((task) => task.completed).length;

    if (tasks.isEmpty) {
      return '';
    }

    return '$taskCompleted of ${tasks.length}';
  }
}
