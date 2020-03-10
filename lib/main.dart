import 'package:flutter/material.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Models/user.dart';
import 'package:hogoh/Screens/wrapper.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is  the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<doUserProfile>.value(
      value: AuthService().authUser,
      child: MaterialApp(
          home : Wrapper(),
      ),
    );
  }
}

