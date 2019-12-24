import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/pages/root_page.dart';
import 'package:flutter_base_structure/shared/auth/auth_bloc.dart';
import 'package:flutter_base_structure/shared/services/custom_dio/custom_dio.dart';

void main() => runApp(AppModule());

class AppModule extends ModuleWidget {

  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((i) => AuthBloc())
  ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
    Dependency((i) => CustomDio())
  ];

  //main widget
  @override
  Widget get view => MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      );

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<AppModule>.of();
}
