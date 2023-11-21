import 'package:flutter/material.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';

class ListTask extends StatefulWidget {
  final Function(Task) onChanged;
  final List<Task>? tasks;
  const ListTask({super.key, required this.tasks , required this.onChanged});

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final task = widget.tasks![index];
        return ListTile(
          leading: Checkbox(
            onChanged :(value) => widget.onChanged(task.copyWith(status: value)),
            value: task.status,
          ),
          title: Text(task.tarefa),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: widget.tasks?.length ?? 0,
    );
  }
}
