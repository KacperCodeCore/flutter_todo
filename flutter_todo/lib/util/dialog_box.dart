import 'package:flutter/material.dart';

import 'package:flutter_todo/util/my_button.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCance;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCance,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 212, 82),
      content: SizedBox(
        width: 300,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: widget.controller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(name: 'Save', onPressed: widget.onSave),
                const SizedBox(
                  width: 10,
                ),
                //cancel button
                MyButton(name: 'Cancel', onPressed: widget.onCance),
              ],
            )
          ],
        ),
      ),
    );
  }
}
