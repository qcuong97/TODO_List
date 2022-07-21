import 'package:flutter/material.dart';
import 'package:manabei_todo_app/data/entities/task_model.dart';
import 'package:manabei_todo_app/device/widget/task_text.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget(this.task, {required this.onChangeStatus, Key? key})
      : super(key: key);

  final TaskModel task;
  final Function(TaskModel) onChangeStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TaskText(task.title ?? ""),
                    TaskText(task.content ?? "")
                  ],
                ),
              ),
              Checkbox(
                key: const Key("ckb"),
                  value: task.isComplete == true,
                  onChanged: (status) {
                    task.isComplete = !task.isComplete!;
                    onChangeStatus.call(task);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
