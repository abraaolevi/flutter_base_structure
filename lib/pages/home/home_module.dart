import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/main.dart';
import 'package:flutter_base_structure/pages/home/home_bloc.dart';
import 'package:flutter_base_structure/pages/home/home_page.dart';
import 'package:flutter_base_structure/pages/home/home_repository.dart';
import 'package:flutter_base_structure/shared/services/custom_dio/custom_dio.dart';

class HomeModule extends ModuleWidget {

  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((i) => HomeBloc(to.getDependency<HomeRepository>()))
      ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
    Dependency((i) => HomeRepository(AppModule.to.getDependency<CustomDio>()))
      ];

  //main widget
  @override
  Widget get view => HomePage();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<HomeModule>.of();

}