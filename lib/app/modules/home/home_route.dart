
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_bloc_isar/app/data/repository/task_repository.dart';
import 'package:todo_bloc_isar/app/data/repository/task_repository_impl.dart';
import 'package:todo_bloc_isar/app/modules/home/cubit/home_cubit.dart';
import 'package:todo_bloc_isar/app/modules/home/home_page.dart';

class HomeRoute {
   Widget page(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider<TaskRepository>(create: (context) => TaskRepositoryImpl(database: context.read())),

        Provider(create:(context) => HomeCubit(repository: context.read())),

      ],
      builder: (context, child) => HomePage(controller: context.read()),
    );
  }
}