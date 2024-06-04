import 'dart:convert';

class Task {
  final String title;
  final String date;
  int? isSynced = 0;
  Task({
    required this.title,
    required this.date,
    this.isSynced,
  });

  Task copyWith({
    String? title,
    String? date,
    int? isSynced,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'isSynced': isSynced,
    };
  }

  factory Task.fromMap(Map<dynamic, dynamic> map) {
    return Task(
      title: map['title'] as String,
      date: map['date'] as String,
      isSynced: map['isSynced'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Task(title: $title, date: $date, isSynced: $isSynced)';

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.date == date &&
        other.isSynced == isSynced;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode ^ isSynced.hashCode;
}
