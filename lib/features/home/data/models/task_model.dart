import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String date;
  @HiveField(2)
  bool? isSynced = false;
  TaskModel({
    required this.title,
    required this.date,
    this.isSynced,
  });
}
