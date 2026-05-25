import 'package:i12_into_012/models/todo.dart';

class AppState {
  final List<Todo> todos;
  final bool isDarkMode;
  final bool asksForDeletionConfirmation;

  AppState({
    required this.todos,
    required this.isDarkMode,
    required this.asksForDeletionConfirmation,
  });

  Map<String, dynamic> toJason() => {
    'todos': todos.map((t) => t.toJson()).toList(),
    'isDarkMode': isDarkMode,
    'asksForDeletionConfirmation': asksForDeletionConfirmation,
  };

  factory AppState.fromJason(Map<String, dynamic> json) => AppState(
    todos: (json['todos'] as List)
        .map((t) => Todo.fromJson(t as Map<String, dynamic>))
        .toList(),
    isDarkMode: json['isDarkMode'] as bool,
    asksForDeletionConfirmation: json['asksForDeletionConfirmation'] as bool,
  );

  AppState copyWith({
    List<Todo>? todos,
    bool? isDarkMode,
    bool? asksForDeletionConfirmation,
  }) => AppState(
    //ergibt sich automatisch
    todos: todos ?? this.todos,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    asksForDeletionConfirmation:
        asksForDeletionConfirmation ?? this.asksForDeletionConfirmation,
  );
}
