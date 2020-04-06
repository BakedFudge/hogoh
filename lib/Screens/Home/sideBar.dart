import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Screens/Profile/UserProfile.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Services/database.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Screens/Home/menuItem.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  StreamController<bool> isSideBarOpenedStreamController;
  Stream<bool> isSideBarOpenedStream;
  Sink<bool> isSideBarOpenedSInk;
  AnimationController _animationController;
  final _animatedDutration = const Duration(milliseconds: 500);
  final AuthService _auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animatedDutration);
    isSideBarOpenedStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedStream = isSideBarOpenedStreamController.stream;
    isSideBarOpenedSInk = isSideBarOpenedStreamController.sink;
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSideBarOpenedSInk.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenedSInk.add(true);
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenedStreamController.close();
    isSideBarOpenedSInk.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var uid = Provider.of<doUserProfile>(context).uid;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSideBarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          final doUserProfile user = Provider.of<doUserProfile>(context);
          return AnimatedPositioned(
            duration: _animatedDutration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    color:Color(hexColor('#FFE66D')),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40.0,),
                        ListTile(
                          title: Text(
                            "Aswin",
                            style: TextStyle(
                              color: Color(hexColor('#FF6B6B')),
                              fontSize: 30.0,
                              fontWeight:FontWeight.w800,
                            ),
                          ),
                          subtitle: Text(
                            "Co-Founder of Hogoh",
                            style: TextStyle(
                              color: Color(hexColor('#FF6B6B')),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Color(hexColor('#FF6B6B')),
                            child: Icon(
                              Icons.perm_identity,
                              color: Color(hexColor('#FF6B6B')),
                            ),
                            radius: 40.0,
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 1,
                          color: Color(hexColor('#FF6B6B')).withOpacity(0.5),
                          indent: 32,
                          endIndent: 32,
                        ),
                        MenuItem(
                          icon: Icons.home,
                          title:  "Home",
                          onTap: () {
                            onIconPressed();
                            BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.person,
                          title: "My Account",
                          onTap: () {
                            onIconPressed();
                           BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.UserPageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.shopping_basket,
                          title: "My Orders",
                          onTap: () {
                            onIconPressed();
                            //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                          },
                        ),
                        Divider(
                          height: 64,
                          thickness: 1,
                          color: Color(hexColor('#FF6B6B')).withOpacity(0.5),
                          indent: 32,
                          endIndent: 32,
                        ),

                        MenuItem(
                          icon: Icons.settings,
                          title: "Settings",
                        ),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Logout",
                        onTap:  () async {
                           await _auth.signOut();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35.0,
                        height: 110,
                        color: Color(hexColor('#FFE66D')),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(hexColor('#FF6B6B')),
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}


class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}