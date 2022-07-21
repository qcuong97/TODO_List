import 'package:flutter/material.dart';
import 'package:manabei_todo_app/app/home/components/task_item_widget.dart';
import 'package:manabei_todo_app/app/todo_complete/todo_complete_controller.dart';
import 'package:manabei_todo_app/device/constants/color_constant.dart';
import 'package:manabei_todo_app/device/state_management/base_view.dart';

import '../../data/entities/task_model.dart';
import '../../device/widget/base_scaffold.dart';
import '../../device/widget/task_text.dart';

class TODOInCompleteWidget extends BaseView<TODOCompleteController> {
  TODOInCompleteWidget(this.taskModel, {required this.onChangeStatus, Key? key})
      : super(
            key: key,
            builder: (context, model, child) =>
                _builder(context, model, child, taskModel, onChangeStatus));
  final List<TaskModel> taskModel;
  final Function(TaskModel) onChangeStatus;
}

Widget _builder(context, model, child, List<TaskModel> taskModel,
    Function(TaskModel) onChangeStatus) {
  return TaskScaffold(
    isNoAppBar: true,
    isBack: false,
    body: Container(
      color: ColorConstant.greyAlpha10,
      child: ListView.builder(
          itemCount: taskModel.length,
          itemBuilder: (context, index) =>
              TaskItemWidget(taskModel[index], onChangeStatus: onChangeStatus)),
    ),
  );
}
