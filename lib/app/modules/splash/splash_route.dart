import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_bloc_isar/app/modules/splash/cubit/splash_cubit.dart';
import 'package:todo_bloc_isar/app/modules/splash/splash_page.dart';

class SplashRoute {
  Widget page(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider(create:(context) => SplashCubit()),

      ],
      builder: (context, child) => SplashPage(controller: context.read()),
    );
  }
}
