import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:todo_bloc_isar/app/core/core_isar.dart';
import 'package:todo_bloc_isar/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = CoreIsar();
  await isar.init();

  
  runApp( MyApp(isar: isar.database));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => isar,
      
      child: MaterialApp(
        onGenerateRoute: Routes.routes,
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
