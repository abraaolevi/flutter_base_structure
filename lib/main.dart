import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/pages/root_page.dart';
import 'package:flutter_base_structure/shared/auth/auth_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RootPage(),
      ),
      blocs: [
        Bloc((i) => AuthBloc())
      ],
    );
  }
}
