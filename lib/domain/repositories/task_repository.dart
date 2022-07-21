import '../../data/entities/task_model.dart';

abstract class TaskRepository {

  Future<TaskModel> getTask(String id);

  Future<int> updateTask(String id, bool isComplete);

  Future<List<TaskModel>> getTasksByStatus(bool isComplete);

  Future<int> insert(String title, String content, bool isComplete);
}