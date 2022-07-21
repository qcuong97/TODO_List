import 'package:manabei_todo_app/data/entities/task_model.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Provider', () {

    test('A new TODO complete should be added', () {
      var favorites = TaskModel();

      favorites.addTitle("Test Title");
      favorites.addContent("Text Content");
      favorites.setComplete(true);

      expect(favorites.title?.isNotEmpty, true);
      expect(favorites.content?.isNotEmpty, true);
      expect(favorites.isComplete, true);
    });

    test('A new TODO incomplete should be added', () {
      var favorites = TaskModel();

      favorites.addTitle("Test Title");
      favorites.addContent("Text Content");
      favorites.setComplete(false);

      expect(favorites.title, "Test Title");
      expect(favorites.content, "Text Content");
      expect(favorites.isComplete, false);
    });

    test('A new TODO should be added and null content', () {
      var favorites = TaskModel();
      var title = "Test Title";
      var isComplete = false;
      favorites.title =  title;
      favorites.isComplete =  isComplete;
      expect(favorites.title?.isNotEmpty, true);
      expect(favorites.content, null);
      expect(favorites.isComplete, false);
    });
  });
}