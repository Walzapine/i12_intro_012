import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/screens/settings_screen.dart';

class TodoListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final appState = ref.watch(refAppState);
    final appStateNotifier = ref.watch(refAppState.notifier);
    final todos = appState.todos;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo LIst Screen'),
        actions: [
          IconButton(onPressed: () {
              Navigator.of(context).pushNamed("settings");
            }, icon: Icon(Icons.settings))
               ],
      ),
      body: Column(
        children: [
          for(final todo in todos) 
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurface,
                ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    todo.text
                  ),
                ),
                if (todo.isCompleted)
                IconButton(
                  icon: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: (){
                    print("Text: ${todo.text}");
                    appStateNotifier.toggleTodo(todo);
                    print("Text: ${todo.text}");
                  },
                )
                else
                  IconButton(
                    icon: Icon(
                      Icons.circle_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {

                    print("Text: ${todo.text}");
                      appStateNotifier.toggleTodo(todo);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}