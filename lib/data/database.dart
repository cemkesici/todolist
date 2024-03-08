import 'package:hive/hive.dart';

class ToDoDataBase {
  final _myBox = Hive.box("myBox");
  List toDoList = [];

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["First Challange", false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }
  //update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
