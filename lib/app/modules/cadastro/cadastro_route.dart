
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_bloc_isar/app/modules/cadastro/cadastro_page.dart';
import 'package:todo_bloc_isar/app/modules/cadastro/cubit/cadastro_cubit.dart';

class CadastroRoute {
   Widget page(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider(create:(_) => CadastroCubit(repository: context.read())),

      ],
      builder: (context, child) => CadastroPage(controller: context.read()),
    );
  }
}