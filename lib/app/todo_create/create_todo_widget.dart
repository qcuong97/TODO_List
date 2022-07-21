import 'package:flutter/material.dart';
import 'package:manabei_todo_app/device/navigation/navigation_service.dart';
import 'package:manabei_todo_app/device/state_management/base_view.dart';
import 'package:manabei_todo_app/device/widget/button_widget.dart';

import '../../device/widget/base_scaffold.dart';
import '../../device/widget/task_text.dart';
import '../../locator.dart';
import 'create_todo_controller.dart';

class CreateTODOWidget extends BaseView<CreateTODOController> {
  const CreateTODOWidget({Key? key}) : super(key: key, builder: _builder, onModelReady: _onModelReady);
  static const routeName = "/create-todo";
}

_onModelReady(CreateTODOController model) {
  model.title = "";
  model.content = "";
  model.typeTODO = TypeTODO.complete;
  model.onRefresh();
}

Widget _builder(context,CreateTODOController model, child) {
  return WillPopScope(
      child: TaskScaffold(
          title: const TaskText("Create"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: model.typeTODO == TypeTODO.complete,
                            onChanged: (status) {
                              status == true
                                  ? model.typeTODO = TypeTODO.complete
                                  : TypeTODO.incomplete;
                              model.onRefresh();
                            }),
                        const TaskText("Complete")
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            key: const Key("incomplete"),
                            value: model.typeTODO == TypeTODO.incomplete,
                            onChanged: (status) {
                              status == true
                                  ? model.typeTODO = TypeTODO.incomplete
                                  : TypeTODO.complete;
                              model.onRefresh();
                            }),
                        const TaskText("Incomplete")
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TaskText("Title"),
                    TextFormField(
                      key: const Key("title"),
                      onChanged: (text) => model.title = text,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const TaskText("Content"),
                    TextFormField(
                      key: const Key("content"),
                      onChanged: (text) => model.title = text,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TaskButton(
                    text: "Save",
                    onPressed: () => model.onSaveTODO(),
                  ),
                )
              ],
            ),
          )),
      onWillPop: () async {
        locator<NavigationService>().pop(value: model.isPreviousReload);
        return false;
      });
}
