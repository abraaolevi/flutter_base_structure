import 'package:flutter/material.dart';
import 'package:flutter_base_structure/pages/home/home_bloc.dart';
import 'package:flutter_base_structure/pages/home/home_repository.dart';
import 'package:flutter_base_structure/pages/home/widgets/contact_tile/contact_tile_widget.dart';
import 'package:flutter_base_structure/shared/models/contact_model.dart';
import 'package:flutter_base_structure/shared/services/custom_dio/custom_dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = HomeBloc(HomeRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    bloc.getContacts();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<List<ContactModel>>(
          stream: bloc.contactsOut,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data
                    .map((i) => ContactTileWidget(
                          snapshot: i,
                        ))
                    .toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
