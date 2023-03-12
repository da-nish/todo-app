class TodoModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool complete;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.complete});

  factory TodoModel.fromMap(Map<String, dynamic> data, String documentId) {
    String id = data['id'];
    String title = data['title'];
    String desc = data['description'];
    DateTime date = data['date'].toDate();
    bool complete = data['complete'];

    return TodoModel(
        id: id,
        title: title,
        description: desc,
        date: date,
        complete: complete);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'complete': complete,
    };
  }
}
