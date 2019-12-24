import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_structure/main.dart';
import 'package:flutter_base_structure/pages/login/login_bloc.dart';
import 'package:flutter_base_structure/pages/login/login_module.dart';
import 'package:flutter_base_structure/pages/login/widgets/login_form_widget.dart';
import 'package:flutter_base_structure/shared/auth/auth_bloc.dart';
import 'package:flutter_base_structure/shared/utils/sub_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var bloc = LoginModule.to.getBloc<LoginBloc>();

  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = bloc.statusOut.listen((data){
      if (data == SubState.success) {
        AppModule.to.getBloc<AuthBloc>().login();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            child: Image.network('https://miro.medium.com/max/400/1*gH1iKXJH8T12LIqhboZWEA.png'),
          ),
          LoginFormWidget(
            onTap: (value) => bloc.signIn(username: value.username, password: value.password),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: StreamBuilder<SubState>(
              stream: bloc.statusOut,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                if (snapshot.hasData) {
                  if (snapshot.data == SubState.success) {
                    return Text("Logado com sucesso");
                  }
                  return CircularProgressIndicator();
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}