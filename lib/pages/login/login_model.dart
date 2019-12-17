class LoginModel {
  String username;
  String password;

  LoginModel({this.username, this.password});

  @override
  String toString() => "username: $username | password: $password";
}