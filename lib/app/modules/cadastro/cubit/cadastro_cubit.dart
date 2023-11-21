import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/data/models/task.dart';
import 'package:todo_bloc_isar/app/data/repository/task_repository.dart';

part 'cadastro_state.dart';

class CadastroCubit extends Cubit<CadastroState> {
  final TaskRepository _repository;

  CadastroCubit({required TaskRepository repository})
      : _repository = repository,
        super(CadastroInitial());

  Future<void> createTask({required Task task}) async {
    final created = await _repository.createTask(task);
    if (created) {
      emit(CadastroError(erro: 'Erro ao cadastrar'));
    }
  }
}
