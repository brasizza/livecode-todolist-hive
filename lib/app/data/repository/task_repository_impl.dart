import 'package:isar/isar.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/data/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Isar _database;

  TaskRepositoryImpl({required Isar database}) : _database = database;

  @override
  Future<List<Task>?> getTasks() async {
    return _database.tasks.where().findAll();
  }

  @override
  Future<bool> changeTask(Task task) async {
    final updated = await _database.writeTxn(() async => _database.tasks.put(task));
    return (updated != 0);
  }

  @override
  Future<bool> createTask(Task task) async {
    final created = await _database.writeTxn(() async => _database.tasks.put(task));
        return (created != 0);

  }
}
