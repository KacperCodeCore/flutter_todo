import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(name),
    );
  }
}
