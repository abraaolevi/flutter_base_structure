import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_base_structure/pages/login/login_bloc.dart';
import 'package:flutter_base_structure/pages/login/login_page.dart';
import 'package:flutter_base_structure/pages/login/login_repository.dart';

class LoginModule extends ModuleWidget {

  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
    Bloc((i) => LoginBloc(to.getDependency<LoginRepository>()))
      ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
    Dependency((i) => LoginRepository())
      ];

  //main widget
  @override
  Widget get view => LoginPage();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<LoginModule>.of();
}