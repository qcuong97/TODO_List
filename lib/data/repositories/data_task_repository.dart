import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:manabei_todo_app/data/entities/task_model.dart';
import 'package:manabei_todo_app/data/task_database_manager.dart';
import 'package:manabei_todo_app/domain/repositories/task_repository.dart';

import '../../locator.dart';

class DataTaskRepository extends TaskRepository {
  final TaskDBManager _db = locator<TaskDBManager>();

  @override
  Future<TaskModel> getTask(String id) async {
    var task = await (_db.select(_db.taskDB)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    return TaskModel(
        id: task.id,
        title: task.title,
        content: task.content,
        isComplete: task.isComplete);
  }

  @override
  Future<List<TaskModel>> getTasksByStatus(bool isComplete) async {
    List<TaskModel> tasks = [];
    var tasksTemp = await (_db.select(_db.taskDB)
          ..where((tbl) => tbl.isComplete.equals(isComplete)))
        .get();
    for (var element in tasksTemp) {
      tasks.add(TaskModel(
          id: element.id,
          title: element.title,
          content: element.content,
          isComplete: element.isComplete));
    }
    return tasks;
  }

  @override
  Future<int> updateTask(String id, bool isComplete) {
    return (_db.update(_db.taskDB)..where((tbl) => tbl.id.contains(id)))
        .write(TaskDBCompanion(isComplete: Value(isComplete)));
  }

  @override
  Future<int> insert(String title, String content, bool isComplete) {
    return _db.into(_db.taskDB).insert(TaskDBCompanion.insert(
        id: UniqueKey().toString(), title: title, content: content, isComplete: isComplete));
  }
}
