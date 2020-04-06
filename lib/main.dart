import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Models/doCusine.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Models/user.dart';
import 'package:hogoh/Screens/wrapper.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Services/database.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is  the root of your application.
  @override
  Widget build(BuildContext context) {
    print('Inside MyApp');
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
         value: FirebaseAuth.instance.onAuthStateChanged,
          // value: AuthService().authUser
        ),
//        StreamProvider<doUserProfile>.value(
//          value:DatabaseService().getCurrentUserFromSnapshot('nXU2OO9B6dPSXp050JiYXmuVjAq1'),
//          //store uid globally // watch some tutorials on firbase
//        ),
        StreamProvider<List<doCusine>>(
          create: (context) => DatabaseService().getCuisines(),
          //value:  DatabaseService().getCuisines(),
        ),
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );

//    return StreamProvider<doUserProfile>.value(
//      value: AuthService().authUser,
//      child: MaterialApp(
//          home : Wrapper(),
//      ),
//    );
  }
}
