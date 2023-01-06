import 'package:flutter/material.dart';
import 'package:objectboxexample/models/group.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  final _groups = <Group>[];

  void _gotToTasks(Group group) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: _groups.isEmpty
          ? const Center(
              child: Text('There are no Groups'),
            )
          : GridView.builder(
              itemCount: _groups.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                final group = _groups[index];

                return GroupItem(
                  onTap: () => _gotToTasks(group),
                  group: group,
                );
              }),
            ),
    );
  }
}

class GroupItem extends StatelessWidget {
  GroupItem({super.key, required this.onTap, required this.group});
  void Function()? onTap;
  Group group;
  @override
  Widget build(BuildContext context) {
    final description = group.taskDescription();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(group.color),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                group.name,
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
              if (description.isNotEmpty) ...[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
