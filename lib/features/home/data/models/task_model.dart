import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String date;
  @HiveField(2)
  bool isSynced;
  TaskModel({
    required this.title,
    required this.date,
    required this.isSynced,
  });

  TaskModel copyWith({
    String? title,
    String? date,
    bool? isSynced,
  }) {
    return TaskModel(
      title: title ?? this.title,
      date: date ?? this.title,
      isSynced: isSynced ?? this.isSynced,
    );
  }
}
