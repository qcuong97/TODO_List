import 'package:get_it/get_it.dart';
import 'package:manabei_todo_app/data/task_database_manager.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';

import 'data/repositories/data_task_repository.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton(() => DataTaskRepository());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => TaskDBManager());
}