import 'package:manabei_todo_app/device/state_management/controller.dart';

import '../../data/repositories/data_task_repository.dart';

class TODOInCompleteController extends BaseController {
  final DataTaskRepository repo;

  TODOInCompleteController(this.repo);
}