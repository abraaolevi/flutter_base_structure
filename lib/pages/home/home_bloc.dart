import 'package:flutter_base_structure/pages/home/home_repository.dart';
import 'package:flutter_base_structure/shared/models/contact_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final HomeRepository repo;

  HomeBloc(this.repo) {
    contactsOut = _contacts.stream;
    _contactsIn = _contacts.sink;
  }

  // STREAMS
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

  void dispose() {
    _contacts.close();
    _contactsIn.close();
  }
}