import 'package:manabei_todo_app/data/entities/task_model.dart';
import 'package:manabei_todo_app/device/state_management/controller.dart';
import 'package:manabei_todo_app/device/utils/context_utils.dart';

import '../../data/repositories/data_task_repository.dart';

class HomeController extends BaseController {
  final DataTaskRepository repo;

  HomeController(this.repo);

  int index = 0;
  List<TaskModel> taskComplete = [];
  List<TaskModel> taskIncomplete = [];

  Future getData() async {
    showLoading();
    await Future.wait<void>([
      getResponse(repo.getTasksByStatus(true),
          onRes: (res) => taskComplete.addAll(res)),
      getResponse(repo.getTasksByStatus(false),
          onRes: (res) => taskIncomplete.addAll(res))
    ]);
    hideLoading();
  }

  Future updateTask(TaskModel task, Function onSuccess) async {
    await getResponse(repo.updateTask(task.id ?? "", task.isComplete ?? false),
        onRes: (res) {
      if (res > 0) {
        onSuccess.call();
      } else {
        ContextUtils.ins.showMessage("Cập nhật trạng thái thất bại");
      }
    });
  }
}
