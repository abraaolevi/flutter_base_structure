class LoginRepository {

  Future<bool> login(Map<String, String> data) async {
    await Future.delayed(Duration(seconds: 1));
    if (data['username'] == 'a' && data['password'] == 'a') {
      return true;
    }
    throw 'E-mail ou senha inválida';
  }

}