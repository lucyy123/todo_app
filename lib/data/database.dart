import 'package:hive/hive.dart';

class ToDoDataBase {
  List<dynamic> todolist = [];

// create instance of hive box
  final _mybox = Hive.box("myBox");

// initail data
  void initialData() {
    todolist = [
      ["Flutter Projects", false],
      ["React Projects", true],
    ];
  }

  void loadData() {
    todolist = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put('TODOLIST', todolist);
  }
}
