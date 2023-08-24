import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDolist = [];
  //reference our box
  final _myBox = Hive.box('myBox');

  //run run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDolist = [
      ['Make tutorial', false], //' " " tthere error?
      ['Take 5 min break', false],
    ];
  }

  //load the data from database
  void loadData() {
    toDolist = _myBox.get('TODOLIST');
  }

  //update the database
  void updateData() {
    _myBox.put('TODOLIST', toDolist);
  }
}
