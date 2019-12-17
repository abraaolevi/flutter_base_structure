import 'package:flutter/material.dart';

class FormController {

  var key = GlobalKey<FormState>();

  bool validade() {
    var form = key.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

}