import 'package:flutter/material.dart';
import 'package:i12_into_012/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.item, {super.key});

  final Todo item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(item.text),
    );
  }
}