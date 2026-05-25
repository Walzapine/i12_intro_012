import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/services/storage__service.dart';

final refAppState = NotifierProvider<AppStateNotifier, AppState>(
  () => AppStateNotifier(),
);

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() {
    loadState();
    return AppState(
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
        ),
      ],
      isDarkMode: false,
      asksForDeletionConfirmation: true,
    );
  }

  void addTodo(String text) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),

      ///das ist ein einfacher Trick für eine einzigartige ID. Es ist die Anzahl Millisekunden seit 1970, also immer eine andere Zahl
      text: text,
      isCompleted: false,
    );
    state = state.copyWith(todos: [...state.todos, newTodo]);
    saveState();
  }

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
    saveState();
  }

  void deleteTodo(Todo todo) {
    final newTodos = state.todos.where((t) => t.id != todo.id).toList();
    state = state.copyWith(todos: newTodos);
    saveState();
  }

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void toggleDeletionConfirmation() {
    state = state.copyWith(
      asksForDeletionConfirmation: !state.asksForDeletionConfirmation,
    );
  }

  void loadState() async {
    final storageService = StorageService();
    final loadedState = await storageService.loadAppState();
    if (loadedState != null) {
      state = loadedState;
    }
  }

  void saveState() async {
    final storageService = StorageService();
    await storageService.saveAppState(state);
  }
}
