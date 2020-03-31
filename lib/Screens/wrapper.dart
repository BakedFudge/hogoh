import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Screens/Authentication/authenticate.dart';
import 'package:hogoh/Screens/Authentication/sign_in.dart';
import 'package:hogoh/Screens/Home/home.dart';
import 'package:hogoh/Screens/Home/sideBar.dart';
import 'package:hogoh/Screens/Profile/UserProfile.dart';
import 'package:hogoh/Screens/Profile/user_profile.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currIndex = 1;


  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    final tabs = [
      SideBar(),
      Home(),
      UserProfile(),
    ];
    final user = Provider.of<doUserProfile>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    }
    else {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _currIndex,
          height: 50,
          animationCurve: Curves.easeInOutBack,
          color: Color(hexColor('#7bed9f')),
          backgroundColor: Color(hexColor('#F7FFF7')),
          items: <Widget>[
            Icon(Icons.settings, size: 20),
            Icon(FontAwesomeIcons.lemon, size: 20),
            Icon(FontAwesomeIcons.addressCard, size: 20),
          ],
          onTap: (index) {
            setState(() {
              _currIndex = index;
            });
            //Handle button tap
          },
        ),
        body: Stack(
          children: <Widget>[
            tabs[_currIndex],
          ],
        ),

// Bloc Side Bar code DND
//        body: BlocProvider<NavigationBloc>(
//          create: (context) => NavigationBloc(),
//          child: Stack(
//            children: <Widget>[
//              BlocBuilder<NavigationBloc,NavigationStates>(
//                  builder: (context, navigationState)
//                  {
//                    return navigationState as Widget;
//                  }
//              ),
//              //SideBar(),
//              //ProfilePage(),
//              //User_Profile(),
//              //FirestoreCRUDPage(),
//            ],
//          ),
//        ),
      );
    }
  }
}
