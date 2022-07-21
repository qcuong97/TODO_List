class TaskModel {
  String? id;
  String? title;
  String? content;
  bool? isComplete;

  TaskModel({this.id, this.title, this.content, this.isComplete});

  addTitle(String title) {
    this.title = title;
  }

  addContent(String content) {
    this.content = content;
  }

  setComplete(bool isComplete) {
    this.isComplete = isComplete;
  }
}
