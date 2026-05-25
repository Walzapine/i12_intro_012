import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';

class AddTodoDialog extends ConsumerWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hier wird der Text gespeichert
    final textController = TextEditingController();

    return AlertDialog(
      title: const Text('Todo hinzufügen'),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Was muss erledigt werden?',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Dialog schließen
          child: const Text('Abbrechen'),
        ),
        TextButton(
          onPressed: () {
            final text = textController.text.trim();
            if (text.isNotEmpty) {
              ref.read(refAppState.notifier).addTodo(text);
              Navigator.of(context).pop(); // Dialog schließen
            }
          },
          child: const Text('Hinzufügen'),
        ),
      ],
    );
  }
}
