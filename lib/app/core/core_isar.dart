import 'package:isar/isar.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';

class CoreIsar {
  late final Isar database;

  Future<void> init() async {
    database = await Isar.open([TaskSchema], directory: '');
  }
}
