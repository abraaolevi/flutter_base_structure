import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_base_structure/pages/home/home_repository.dart';
import 'package:flutter_base_structure/shared/models/contact_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;

  HomeBloc(this.repo) {
    contactsOut = _contacts.stream;
    _contactsIn = _contacts.sink;
  }

  //?Streams
  var _contacts = BehaviorSubject<List<ContactModel>>();
  Observable<List<ContactModel>> contactsOut;
  Sink<List<ContactModel>> _contactsIn;

  Future<void> getContacts() async {
    try {
      var response = await repo.getContacts();
      _contactsIn.add(response);
    } catch (e) {
      _contacts.addError(e);
    }
  }

  @override
  void dispose() {
    _contacts.close();
    _contactsIn.close();
    super.dispose();
  }
}