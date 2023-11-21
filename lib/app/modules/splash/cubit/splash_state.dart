part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {}

final class SplashLoaded extends SplashState {}

final class SplashError extends SplashState {
  final String? error;
  SplashError({this.error});
}
