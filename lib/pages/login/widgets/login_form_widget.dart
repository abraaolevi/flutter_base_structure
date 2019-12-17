import 'package:flutter/material.dart';
import 'package:flutter_base_structure/pages/login/login_model.dart';
import 'package:flutter_base_structure/shared/utils/form_controller.dart';

class LoginFormWidget extends StatelessWidget {

  final Function(LoginModel data) onTap;

  LoginFormWidget({Key key, @required this.onTap}) : super(key: key);

  final FormController formController = FormController();
  LoginModel data = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: formController.key,
        child: Column(
          children: <Widget>[
            TextFormField(
              onSaved: (value) => data.username = value,
              validator: (value) => value.isEmpty ? 'O username não pode ser vazio' : null,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              obscureText: true,
              onSaved: (value) => data.password = value,
              validator: (value) => value.isEmpty ? 'O password não pode ser vazio' : null,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.blue,
                      colorBrightness: Brightness.dark,
                      child: Text('Entrar'),
                      onPressed: () {
                        if (formController.validade()) {
                          onTap(data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
