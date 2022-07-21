import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:manabei_todo_app/domain/entities/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'task_database_manager.g.dart';

@DriftDatabase(tables: [TaskDB])
class TaskDBManager extends _$TaskDBManager {
  TaskDBManager() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'taskDB.sqlite'));
    return NativeDatabase(file);
  });
}
