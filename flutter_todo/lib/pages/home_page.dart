import 'package:flutter/material.dart';
import 'package:flutter_todo/data/database.dart';
import 'package:flutter_todo/util/dialog_box.dart';
import 'package:flutter_todo/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      //if this is 1st time ever opening the app, then create default data
      db.createInitialData();
    } else {
      //if there arleady exist data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  // Check box was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateData();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCance: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  //save task
  void saveTask(int index) {
    setState(
      () {
        db.toDolist[index][1] ? _controller : _controller.clear();
      },
    );
    Navigator.of(context).pop();
    db.updateData();
  }

  //edit task
  void editTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        _controller.text = db.toDolist[index][0];
        return DialogBox(
          controller: _controller,
          onSave: () => _handleSaveEdit(index),
          onCance: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void _handleSaveEdit(int index) {
    if (db.toDolist[index][0] == _controller.text) {
      _controller.clear();
      Navigator.of(context).pop();
    } else {
      setState(() {
        db.toDolist[index][0] = _controller.text;
      });
      _controller.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 234, 171),
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFnction: (context) => deleteTask(index),
            editFnction: (context) => editTask(index),
          );
        },
        padding: const EdgeInsets.only(bottom: 200),
      ),
    );
  }
}
