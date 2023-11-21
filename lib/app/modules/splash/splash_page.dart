import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/modules/splash/cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit controller;

  const SplashPage({super.key, required this.controller});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          // print('VAMOS MANDAR PARA OUTRA TELA');
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      builder: (context, state) {
        return Center(
          child: Center(
            child: switch (state) {
              SplashInitial() => const SizedBox(),
              SplashLoading() => const CircularProgressIndicator.adaptive(),
              SplashLoaded() => const SizedBox(),
              SplashError() => Container(color: Colors.red, width: double.infinity, height: double.infinity, child: Center(child: Text(state.error ?? ''))),
            },
          ),
        );
      },
    ));
  }
}
