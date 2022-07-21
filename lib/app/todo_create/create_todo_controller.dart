import 'package:manabei_todo_app/device/state_management/controller.dart';
import 'package:manabei_todo_app/device/utils/context_utils.dart';

import '../../data/repositories/data_task_repository.dart';

enum TypeTODO { complete, incomplete }

class CreateTODOController extends BaseController {
  final DataTaskRepository repo;

  CreateTODOController(this.repo);

  TypeTODO typeTODO = TypeTODO.complete;

  String title = "";
  String content = "";
  bool isPreviousReload = false;

  Future onSaveTODO() async {
    if (_validate()) {
      showLoading();
      await getResponse(repo.insert(title, content, typeTODO == TypeTODO.complete),
          onRes: (res) {
        hideLoading();
        var message = "Have a error\nPlease try again";
        if (res > 0) {
          message = "Create TODO success";
          isPreviousReload = true;
        }
        ContextUtils.ins.showMessage(message);
      });
    }
  }

  bool _validate() {
    if (title.isEmpty) {
      ContextUtils.ins.showMessage("Please input 'Title'");
      return false;
    }
    return true;
  }
}
