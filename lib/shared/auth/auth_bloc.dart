import 'package:rxdart/rxdart.dart';

class AuthBloc {

  static AuthBloc _instance;
  static AuthBloc getInstance() {
    if (_instance == null) {
      _instance = AuthBloc();
    }
    return _instance;
  }

  AuthBloc() {
    statusOut = _status.stream;
    _statusIn = _status.sink;
  }

  //?Streams
  var _status = BehaviorSubject<bool>.seeded(false);
  Observable<bool> statusOut;
  Sink<bool> _statusIn;

  //?Functions

  void login() {
    _statusIn.add(true);
  }

  void logout() {
    _statusIn.add(false);
  }

  void dispose() {
    _status.close();
    _statusIn.close();
    _instance = null;
  }
}
