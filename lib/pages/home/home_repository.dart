import 'package:flutter_base_structure/shared/models/contact_model.dart';
import 'package:flutter_base_structure/shared/services/custom_dio/custom_dio.dart';

class HomeRepository {
  final CustomDio client;

  HomeRepository(this.client);

  Future<List<ContactModel>> getContacts() async {
    var response = await client.get('/users');
    return (response.data as List)
        .map((i) => ContactModel.fromJson(i))
        .toList();
  }
}
