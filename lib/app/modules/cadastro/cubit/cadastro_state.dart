part of 'cadastro_cubit.dart';

sealed class CadastroState {}
final class CadastroInitial extends CadastroState {}

final class CadastroLoading extends CadastroState {}

final class CadastroCompleted extends CadastroState {}

final class CadastroError extends CadastroState {
  final String? erro;

  CadastroError({ this.erro});
}
