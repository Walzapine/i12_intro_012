import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';


final refAppState = NotifierProvider<AppStateNotifier, AppState>(
      () => AppStateNotifier(),
    );

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() => AppState(
    todos: [
      Todo(
        id: 'a',
        text: 'Müll rausbringen',
        isCompleted: false,
      ),
      Todo(
        id: 'b',
        text: 'Hausaufgaben machen',
        isCompleted: true,
      )
    ],
    isDarkMode: false,
    asksForDeletionConfirmation: true,
  );

  void addTodo(String text) {}

  void toggleTodo(Todo todo) {
    final newTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    final newTodos = <Todo>[];
    for (final t in state.todos) {
      if (t == todo) {
        newTodos.add(newTodo);
      } else {
        newTodos.add(t);
      }
    }
    state = state.copyWith(todos: newTodos);
  }

  void delecteTodos(List<Todo>()) {}

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void toggleDeletionConfirmation() {}

  void loadState() {}

  void saveState() {}
}