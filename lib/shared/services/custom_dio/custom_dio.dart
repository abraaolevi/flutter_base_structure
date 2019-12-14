import 'package:dio/native_imp.dart';
import 'package:flutter_base_structure/shared/constants.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
  }
}