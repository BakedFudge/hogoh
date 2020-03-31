

import 'package:flutter/material.dart';

class UserProfileEdit extends StatefulWidget {
  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  @override
  Widget build(BuildContext context) {
    print('Edit in ');
    return Hero(
      tag: 'edit',
      child: Container(
        color: Colors.red,
        height: 400,
      ),
    );
  }
}
