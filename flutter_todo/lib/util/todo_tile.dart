import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Function(BuildContext)? deleteFnction;
  Function(BuildContext)? editFnction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFnction,
    required this.editFnction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        //after slide to right show...
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: editFnction,
              icon: Icons.edit,
              backgroundColor: Colors.green.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        //after slide to right show...
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFnction,
                icon: Icons.delete,
                backgroundColor: Color.fromARGB(255, 238, 128, 128),
                borderRadius: BorderRadius.circular(10)),
          ],
        ),
        //task body
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 206, 59),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //checbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 61, 46, 0),
              ),
              //task name
              Flexible(
                child: Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 17,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
