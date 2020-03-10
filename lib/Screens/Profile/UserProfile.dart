import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Services/database.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    print('inside');
    var uid = Provider.of<doUserProfile>(context).uid;
//    var linearGradient = const BoxDecoration(
//      gradient: const LinearGradient(
//        begin: FractionalOffset.centerRight,
//        end: FractionalOffset.bottomLeft,
//        colors: <Color>[
//          const Color(0xFF413070),
//          const Color(0xFF2B264A),
//        ],
//      ),
//    ); Linea//
    return MultiProvider(
        providers: [
          StreamProvider<doUserProfile>.value(
            value: DatabaseService().getCurrentUserFromSnapshot(uid),
          )
        ],
        child: SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            child: new Container(
              color: Color(hexColor('#F6F6FB')),
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  //Avatar
                  Positioned(
                    top: 0.0,
                    child: Container(
                        width: 180.0,
                        height: 180.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        )),
                  ),
                  //Name Details
                  Positioned(
                    top: 60.0,
                    child: Container(
                      height: 250.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 120),
                        child:UserDetailHeader() ,
                      ),
                      //color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top:20.0,
                    child: Container(
                        width:150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(hexColor('#826F4C'))
                        ),

                    ),
                  ),

                //Emoticons
                  Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only( top:250.0,left: 0),
                      child: new Icon(FontAwesomeIcons.grinWink,
                        color: Colors.lightGreen,
                        size: 40.0,
                        //radius: 20.0,
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only( top:250.0),
                      child: new Icon(FontAwesomeIcons.grinHearts,
                        color: Colors.amber,
                        size: 40.0,
                        //radius: 20.0,
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only( top:250.0),
                      child: new Icon(FontAwesomeIcons.smileBeam,
                        color: Colors.pink,
                        size: 40.0,
                        //radius: 20.0,
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: const EdgeInsets.only( top:250.0),
                      child: new Icon(FontAwesomeIcons.grinTears,
                        color: Colors.blue,
                        size: 40.0,
                        //radius: 20.0,
                      ),
                    ),


                  ],
                ),

                  SizedBox(height: 50.0),

                  //Header & Body Details
                  new Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 330.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //Detail body
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: UserDetailBody(),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        ));
  }
}

//StateLess
//class UserProfile extends StatelessWidget with NavigationStates {
//  @override
//  Widget build(BuildContext context) {
//    print('inside');
//    var uid = Provider.of<doUserProfile>(context).uid;
//    var linearGradient = const BoxDecoration(
//      gradient: const LinearGradient(
//        begin: FractionalOffset.centerRight,
//        end: FractionalOffset.bottomLeft,
//        colors: <Color>[
//          const Color(0xFF413070),
//          const Color(0xFF2B264A),
//        ],
//      ),
//    );
//
//    return MultiProvider(
//        providers: [
//
//          StreamProvider<doUserProfile>.value(
//            value: DatabaseService().getCurrentUserFromSnapshot(uid),
//          )
//        ],
//        child: Scaffold(
//            body: SingleChildScrollView(
//              child: new Container(
//                  decoration:linearGradient ,
//                  child:
//                    Column(
//                      children: <Widget>[
//                        new Container(
//                          height: 250.0,
//                          color: Colors.white,
//                          child: new Column(
//                            children: <Widget>[
//                              Padding(
//                                padding: EdgeInsets.only(top: 50.0),
//                                child: new Stack(
//                                    fit: StackFit.loose,
//                                    children: <Widget>[
//                                      new Row(
//                                        crossAxisAlignment:
//                                        CrossAxisAlignment.center,
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: <Widget>[
//                                          new Container(
//                                              width: 200.0,
//                                              height: 200.0,
//                                              decoration: new BoxDecoration(
//                                                shape: BoxShape.circle,
//                                                color: Color(hexColor('#FFE66D')),
//                                              )),
//                                        ],
//                                      ),
//                                    ]),
//                              )
//                            ],
//                          ),
//                        ),
//                        SizedBox(height: 10.0),
//                       UserProfileDetails(),
//                        new Container(
//                          color: Color(0xffFFFFFF),
//                          child: Padding(
//                            padding: EdgeInsets.only(bottom: 25.0),
//                            child: new Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Padding(
//                                  padding: const EdgeInsets.all(40.0),
//                                  child:
//                                  FriendDetailBody(widget.friend)
//                                ),
//
//
//
//                              ],
//                            ),
//                          ),
//                        )],
//                    )
//              ),
//            )
//        )
//    );
//  }
//}

class UserProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currUser = Provider.of<doUserProfile>(context);
    print(currUser.username);
    print(currUser.uid);
    return ListView(shrinkWrap: true, children: <Widget>[
      ListTile(
        title: Text(
          currUser.nickname,
          style: TextStyle(
            color: Color(hexColor('#1A535C')),
            fontSize: 30.0,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          currUser.tag,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}

class UserDetailHeader extends StatelessWidget {

  Widget _createCircleBadge(IconData iconData, Color color) {
    return new Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: new CircleAvatar(
        backgroundColor: color,
        child: new Icon(
          iconData,
          color: Colors.black,
          size: 16.0,
        ),
        radius: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final doUserProfile currUser = Provider.of<doUserProfile>(context);

    return ListView(shrinkWrap: true, children: <Widget>[
      ListTile(
        title: Text(
          currUser.nickname,
          style: TextStyle(
            color: Color(hexColor('#1A535C')),
            fontSize: 30.0,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          currUser.tag,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}

class LevelSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class UserDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 1900),
      padding: EdgeInsets.only(top:10.0),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "FoodFolio",
              textAlign: TextAlign.center,
              style: GoogleFonts.holtwoodOneSC(
                fontSize: 30,
                color:Color(hexColor('#5B68C7')),
                letterSpacing: 15,
                fontWeight: FontWeight.w100,
              ),
            ),

          ),
          ListTile(
            title: Text(
              'Fav Dish :',
              style: GoogleFonts.holtwoodOneSC(
                fontSize: 30,
                color:Color(hexColor('#5B68C7')),
               // letterSpacing: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            //isThreeLine: true,
          )
        ],
      ),

    );
  }
}

//class dummy extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 25.0),
//          child: new Row(
//            mainAxisAlignment:
//            MainAxisAlignment.spaceBetween,
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Column(
//                mainAxisAlignment:
//                MainAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Text(
//                    'Personal Information',
//                    style: TextStyle(
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ],
//              ),
//              new Column(
//                mainAxisAlignment: MainAxisAlignment.end,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Container(),
//                ],
//              )
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 25.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Column(
//                mainAxisAlignment:
//                MainAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Text(
//                    'Email ID',
//                    style: TextStyle(
//                        fontSize: 16.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ],
//              ),
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 2.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Flexible(
//                child: new TextField(
//                  decoration: const InputDecoration(
//                      hintText: "Enter Email ID"),
//                ),
//              ),
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 25.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Column(
//                mainAxisAlignment:
//                MainAxisAlignment.start,
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new Text(
//                    'Mobile',
//                    style: TextStyle(
//                        fontSize: 16.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ],
//              ),
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 2.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            children: <Widget>[
//              new Flexible(
//                child: new TextField(
//                  decoration: const InputDecoration(
//                      hintText: "Enter Mobile Number"),
//                  //enabled: !_status,
//                ),
//              ),
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 25.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Expanded(
//                child: Container(
//                  child: new Text(
//                    'Pin Code',
//                    style: TextStyle(
//                        fontSize: 16.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//                flex: 2,
//              ),
//              Expanded(
//                child: Container(
//                  child: new Text(
//                    'State',
//                    style: TextStyle(
//                        fontSize: 16.0,
//                        fontWeight: FontWeight.bold),
//                  ),
//                ),
//                flex: 2,
//              ),
//            ],
//          )),
//      Padding(
//          padding: EdgeInsets.only(
//              left: 25.0, right: 25.0, top: 2.0),
//          child: new Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Flexible(
//                child: Padding(
//                  padding: EdgeInsets.only(right: 10.0),
//                  child: new TextField(
//                    decoration: const InputDecoration(
//                        hintText: "Enter Pin Code"),
//                    //enabled: !_status,
//                  ),
//                ),
//                flex: 2,
//              ),
//              Flexible(
//                child: new TextField(
//                  decoration: const InputDecoration(
//                      hintText: "Enter State"),
//                  // enabled: !_status,
//                ),
//                flex: 2,
//              ),
//            ],
//          )),
//    );
//  }
//}
