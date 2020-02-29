import 'package:flutter/material.dart';
import 'package:hogoh/Models/user.dart';
import 'package:hogoh/Screens/Authentication/authenticate.dart';
import 'package:hogoh/Screens/Authentication/register.dart';
import 'package:hogoh/Screens/Authentication/sign_in.dart';
import 'package:hogoh/Screens/Home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<User>(context);
    print(user);
    //return Authenticate();
    if(user == null)
      {
        return Authenticate();
      }
    else {
      return Home();
    }
  }
}
