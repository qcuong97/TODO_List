import 'package:manabei_todo_app/app/todo_complete/todo_complete_controller.dart';
import 'package:manabei_todo_app/data/repositories/data_task_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../app/home/home_controller.dart';
import '../../app/todo_create/create_todo_controller.dart';
import '../../app/todo_incomplete/todo_incomplete_controller.dart';
import '../../locator.dart';

class Providers {
  static List<SingleChildWidget> data = [
    ChangeNotifierProvider(
      create: (_) => HomeController(locator<DataTaskRepository>()),
    ),
    ChangeNotifierProvider(
      create: (_) => TODOCompleteController(locator<DataTaskRepository>()),
    ),
    ChangeNotifierProvider(
      create: (_) => TODOInCompleteController(locator<DataTaskRepository>()),
    ),
    ChangeNotifierProvider(
      create: (_) => CreateTODOController(locator<DataTaskRepository>()),
    )
  ];
}
