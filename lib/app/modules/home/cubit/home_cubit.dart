import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/data/repository/task_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TaskRepository _repository;
  HomeCubit({required TaskRepository repository})
      : _repository = repository,
        super(HomeInitial()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    emit(HomeLoading());
    final tasks = await _repository.getTasks();
    emit(HomeLoaded(taks: tasks));
  }

  Future<void> changeTask(Task task) async {
    final changed = await _repository.changeTask(task);
    if (changed) {
      loadTasks();
    }
  }
}
