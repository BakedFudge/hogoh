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

    return MultiProvider(
        providers: [
          StreamProvider<doUserProfile>.value(
            value: DatabaseService().getCurrentUserFromSnapshot(uid),
          )
        ],
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Color(hexColor('#F7FFF7')),
              body: Container(
                color: Color(hexColor('#F7FFF7')),
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: <Widget>[
                          //Avatar
                          Positioned(
                          top:100.0,
                           child: Container(
                                width: 180.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(hexColor('#FFE66D')),
                                )
                            ),
                         ),

                          //Name Details

                          Positioned(
                            top: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                //padding:EdgeInsets.only(top:20.0),
                                height: 230.0,
                                width: MediaQuery.of(context).size.width - 30,
                                color: Colors.white,
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 80.0),
                                      child: UserDetailHeader(),
                                    ),
                                    //Emoticons
                                    Wrap(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 160.0, left: 80),
                                          child: new Icon(
                                            FontAwesomeIcons.grinWink,
                                            color: Colors.lightGreen,
                                            size: 40.0,
                                            //radius: 20.0,
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 160.0),
                                          child: new Icon(
                                            FontAwesomeIcons.grinHearts,
                                            color: Colors.amber,
                                            size: 40.0,
                                            //radius: 20.0,
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 160.0),
                                          child: new Icon(
                                            FontAwesomeIcons.smileBeam,
                                            color: Colors.pink,
                                            size: 40.0,
                                            //radius: 20.0,
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 160.0),
                                          child: new Icon(
                                            FontAwesomeIcons.grinTears,
                                            color: Colors.blue,
                                            size: 40.0,
                                            //radius: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Inside Circle Avatar

                          Positioned(
                            top: 120,
                            child: Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(hexColor('#1A535C')),
                              ),
                            ),
                          ),

                          //Detail body
                          Positioned(
                            top: 450,
                            child: Container(
                                //padding: EdgeInsets.all(20),
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width - 30,
                                child: UserDetailBody()),
                          ),
                          //SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}

class UserDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doUserProfile currUser = Provider.of<doUserProfile>(context);
    return ListTile(
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
    );
  }
}

class UserProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currUser = Provider.of<doUserProfile>(context);
    print(currUser.username);
    print(currUser.uid);
    return ListTile(
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
      );
  }
}

class UserDetailBody extends StatefulWidget {
  @override
  _UserDetailBodyState createState() => _UserDetailBodyState();
}

class CusinesFilterEntry {
  const CusinesFilterEntry(this.cusineName);

  final String cusineName;
}

class _UserDetailBodyState extends State<UserDetailBody> {
  final List<CusinesFilterEntry> _cusines = <CusinesFilterEntry>[
    const CusinesFilterEntry('Indian'),
    const CusinesFilterEntry('Chinese'),
    const CusinesFilterEntry('Italian'),
    const CusinesFilterEntry('Eastern'),
    const CusinesFilterEntry('Turkish'),
    const CusinesFilterEntry('Chettinad'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (CusinesFilterEntry actor in _cusines) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: ChoiceChip(
          label: Text(actor.cusineName),
          selected: _filters.contains(actor.cusineName),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.cusineName);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.cusineName;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        constraints: BoxConstraints.expand(height: 100),
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            //Foodfolio
            ListTile(
              title: Text(
                "FoodFolio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(hexColor('#1A535C')),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            //Cusines
            Text(
              'Fav Cuisines :',
              style: TextStyle(
                color: Color(hexColor('#1A535C')),
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Wrap(
              children: actorWidgets.toList(),
            ),
            SizedBox(
              height: 20,
            ),
            //Dish
            Text(
              'Fav Dish :',
              style: TextStyle(
                color: Color(hexColor('#1A535C')),
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Fav Dish
            Wrap(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.hamburger,
                  color: Colors.lightGreen,
                  size: 40.0,
                  //radius: 20.0,
                ),
                SizedBox(width: 30),
                Icon(
                  FontAwesomeIcons.pizzaSlice,
                  color: Colors.amber,
                  size: 40.0,
                  //radius: 20.0,
                ),
                SizedBox(width: 30),
                Icon(
                  FontAwesomeIcons.birthdayCake,
                  color: Colors.pink,
                  size: 40.0,
                  //radius: 20.0,
                ),
                SizedBox(width: 30),
                Icon(
                  FontAwesomeIcons.iceCream,
                  color: Colors.blue,
                  size: 40.0,
                  //radius: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Foodies
            Text(
              'Fav Foodies :',
              style: TextStyle(
                color: Color(hexColor('#1A535C')),
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Wrap(),
          ],
        ),
      ),
    );
  }
}
