import 'dart:convert';

class TasksModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  TasksModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  TasksModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
  }) {
    return TasksModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory TasksModel.fromMap(Map<String, dynamic> map) {
    return TasksModel(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TasksModel.fromJson(String source) =>
      TasksModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TasksModel(id: $id, userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TasksModel &&
        other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
