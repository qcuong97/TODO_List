import 'package:flutter/material.dart';
import 'package:manabei_todo_app/app/home/home_controller.dart';
import 'package:manabei_todo_app/app/todo_complete/todo_complete_widget.dart';
import 'package:manabei_todo_app/app/todo_create/create_todo_widget.dart';
import 'package:manabei_todo_app/app/todo_incomplete/todo_incomplete_widget.dart';
import 'package:manabei_todo_app/data/entities/task_model.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';
import 'package:manabei_todo_app/device/state_management/base_view.dart';

import '../../device/constants/color_constant.dart';
import '../../device/widget/base_scaffold.dart';
import '../../device/widget/task_text.dart';
import '../../locator.dart';

class HomeWidget extends BaseView<HomeController> {
  const HomeWidget({Key? key})
      : super(builder: _builder, onModelReady: _onModelReady, key: key);

  static const routeName = "/home";
}

_onModelReady(HomeController model) async {
  await model.getData();
}

Widget _builder(context, HomeController model, child) {
  final PageController pageController = PageController();
  return TaskScaffold(
      title: TaskText(
          "TODO List - ${model.index == 1 ? "Complete" : "Incomplete"}"),
      isBack: false,
      body: PageView(
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          model.index = index;
          model.onRefresh();
        },
        controller: pageController,
        children: [
          TODOInCompleteWidget(
            model.taskIncomplete,
            onChangeStatus: (taskModel) => _onChangeStatus(taskModel, model),
          ),
          TODOCompleteWidget(model.taskComplete,
              onChangeStatus: (taskModel) => _onChangeStatus(taskModel, model))
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            const Spacer(),
            TaskText(
              "Incomplete",
              style: TextStyle(
                  color: model.index == 0
                      ? ColorConstant.blue
                      : ColorConstant.grey),
              onTap: () {
                model.index = 0;
                pageController.jumpToPage(0);
                model.onRefresh();
              },
            ),
            const Spacer(flex: 3),
            TaskText(
              "Complete",
              style: TextStyle(
                  color: model.index == 1
                      ? ColorConstant.blue
                      : ColorConstant.grey),
              onTap: () {
                model.index = 1;
                pageController.jumpToPage(1);
                model.onRefresh();
              },
              key: const Key("complete"),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => locator<NavigationService>()
            .pushNamed(CreateTODOWidget.routeName)
            ?.then((value) =>
                value != null && value == true ? model.getData() : null),
        child: const Icon(Icons.add),
      ));
}

_onChangeStatus(TaskModel task, HomeController model) {
  model.updateTask(task, () {
    if (task.isComplete == true) {
      model.taskComplete.add(task);
      model.taskIncomplete.removeWhere((element) => element.id == task.id);
    } else {
      model.taskIncomplete.add(task);
      model.taskComplete.removeWhere((element) => element.id == task.id);
    }
    model.onRefresh();
  });
}
