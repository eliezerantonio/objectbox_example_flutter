import 'package:objectbox/objectbox.dart';

import 'group.dart';

@Entity()
class Task {
  int id = 0;
  String description;
  bool completed = false;

  final group = ToOne<Group>();

  Task({required this.description});
}
