import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_isar/app/modules/cadastro/cadastro_route.dart';
import 'package:todo_bloc_isar/app/modules/home/cubit/home_cubit.dart';
import 'package:todo_bloc_isar/app/modules/home/widgets/list_task.dart';

class HomePage extends StatefulWidget {
  final HomeCubit controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () async {
            final data = await showModalBottomSheet(
              context: context,
              builder: (_) => CadastroRoute().page(context),
            );

            if (data != null) {
              widget.controller.loadTasks();
            }
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          const Center(
            child: Text('Minha lista'),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Center(
                  child: switch (state) {
                    HomeInitial() => const SizedBox(),
                    HomeLoading() => const CircularProgressIndicator.adaptive(),
                    HomeLoaded() => ListTask(
                        tasks: state.taks,
                        onChanged: (task) async {
                          await widget.controller.changeTask(task);
                        }),
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
