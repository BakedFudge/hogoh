

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hogoh/Models/doCusine.dart';

class UserProfileEdit extends StatefulWidget {
  @override
  _UserProfileEditState createState() => _UserProfileEditState();

}

class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    print('Edit in ');
   // var cuisines =Provider.of<List<doCusine>>(context) ;// Provider.of<doCusine>(context);
    final List<doCusine> cuisines = Provider.of<List<doCusine>>(context);

    for(var doc in cuisines){
      print(doc);
    }
    return Scaffold(
      backgroundColor: Colors.green,
    );

  }
}
