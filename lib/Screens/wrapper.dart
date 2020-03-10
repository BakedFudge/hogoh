import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Screens/Authentication/authenticate.dart';
import 'package:hogoh/Screens/Home/sideBar.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<doUserProfile>(context);
    print(user);
    if(user == null)
      {
        return Authenticate();
      }
    else {
      return Scaffold(

        body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc,NavigationStates>(
                builder: (context, navigationState)
                    {
                      return navigationState as Widget;
                    }
              ),
            //SideBar(),
            //ProfilePage(),
           //User_Profile(),
            //FirestoreCRUDPage(),
          ],
      ),
        ),
      );
    }
  }
}
