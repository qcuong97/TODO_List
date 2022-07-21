import 'package:manabei_todo_app/device/state_management/controller.dart';

import '../../data/repositories/data_task_repository.dart';

class TODOCompleteController extends BaseController {
  final DataTaskRepository repo;

  TODOCompleteController(this.repo);
}