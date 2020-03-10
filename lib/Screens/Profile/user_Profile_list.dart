import 'package:hogoh/Models/doUserProfile.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Screens/Profile/user_profile.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<doUserProfile>>(context);


    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return User_Profile();
      },
    );

  }
}