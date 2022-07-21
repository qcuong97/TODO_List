import 'package:drift/drift.dart';

class TaskDB extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  BoolColumn get isComplete => boolean()();
}