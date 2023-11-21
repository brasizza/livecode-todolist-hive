import 'package:flutter/material.dart';
import 'package:todo_bloc_isar/app/modules/home/home_route.dart';
import 'package:todo_bloc_isar/app/modules/splash/splash_route.dart';

sealed class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case '/':
        builder = SplashRoute().page;
        break;


          case '/home':
        builder = HomeRoute().page;
        break;

      default:
        throw Exception('Rota nao encontrada');
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
