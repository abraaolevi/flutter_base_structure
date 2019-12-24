import 'package:flutter/material.dart';
import 'package:flutter_base_structure/main.dart';
import 'package:flutter_base_structure/pages/home/home_module.dart';
import 'package:flutter_base_structure/pages/login/login_module.dart';
import 'package:flutter_base_structure/shared/auth/auth_bloc.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}): super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthBloc bloc;

  @override
  void initState() {
    bloc = AppModule.to.getBloc<AuthBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.statusOut,
      initialData: false,
      builder: (context, snapshot) => snapshot.data ? HomeModule() : LoginModule(),
    );
  }
}