class Todo {
  final String id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'isCompleted': isCompleted,
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'] as String,
    text: json['text'] as String,
    isCompleted: json['isCompleted'] as bool,
  );

  Todo copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) => Todo(
    //muss ich mir herleiten
    id: id ?? this.id,
    text: text ?? this.text,
    isCompleted: isCompleted ?? this.isCompleted,
  );
}
