import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/pages/home/home_page.dart';
import 'package:flutter_base_structure/pages/login/login_page.dart';
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
    bloc = BlocProvider.getBloc<AuthBloc>();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.statusOut,
      initialData: false,
      builder: (context, snapshot) => snapshot.data ? HomePage() : LoginPage(),
    );
  }
}