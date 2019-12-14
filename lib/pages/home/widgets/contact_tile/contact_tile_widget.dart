import 'package:flutter/material.dart';
import 'package:flutter_base_structure/shared/models/contact_model.dart';

class ContactTileWidget extends StatelessWidget {

  final ContactModel snapshot;

  const ContactTileWidget({Key key, @required this.snapshot}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot.name),
      subtitle: Text(snapshot.phone),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(snapshot.photo),
      ),
    );
  }
}