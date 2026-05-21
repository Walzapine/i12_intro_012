class Todo {
  final String id;
  final String text;
  final bool isCompleted;

  Todo ({
    required this.id,
    required this.text,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
    //muss ich mir herleiten
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    //muss ich mir herleiten
    id:'',
    text: '',
    isCompleted:false,
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