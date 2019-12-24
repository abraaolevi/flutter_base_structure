import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_base_structure/pages/login/login_repository.dart';
import 'package:flutter_base_structure/shared/utils/sub_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final LoginRepository repo;

  LoginBloc(this.repo) {
    statusOut = _status.stream;
    _statusIn = _status.sink;
  }

  //?Streams
  var _status = BehaviorSubject<SubState>();
  Observable<SubState> statusOut;
  Sink<SubState> _statusIn;

  Future<void> signIn({String username, String password}) async {
    _statusIn.add(SubState.loading);
    try {
      var response = await repo.login({'username': username, 'password': password});
      if (response) {
        _statusIn.add(SubState.success);
      }
    } catch (e) {
      _status.addError(e);
    }
  }

  @override
  void dispose() {
    _status.close();
    _statusIn.close();
    super.dispose();
  }
}