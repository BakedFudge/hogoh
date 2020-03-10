import 'package:flutter/material.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Services/database.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController tabController;
  final AuthService _auth = AuthService();

  @override
  void initState() {
    tabController= TabController(vsync: this,length: 2);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<doUserProfile>>.value(
      value: DatabaseService().getUserProfiles,
      child: SafeArea(
        child: Scaffold(
            body :
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(45, 20, 0, 0),
                     title: Text(
                           "HogoH",
                    style: TextStyle(
                    color: Color(hexColor('#1A535C')),
                    fontSize: 30.0,
                    fontWeight:FontWeight.w800,
                  ),
                  textAlign: TextAlign.start,
                ),
                      subtitle: Text(
                  "Hog Happy..Whenever..",
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w200,
                  ),
                        textAlign: TextAlign.start,
                ),
                    trailing:
                    FloatingActionButton(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      backgroundColor: Color(hexColor('#FFE66D')),
                      child: Icon(Icons.chat,color: Colors.white,
                        size: 30.0,),
                      elevation: 0.0,
                    )
                    ,
              ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: TabBar(
                      controller: tabController,
                      indicatorColor:Color(hexColor('#1A535C')),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'Single',
                            style: TextStyle(fontSize: 20.0,fontFamily: 'Montserrat')
                          ),
                        ),
                        Tab(
                          child: Text(
                              'Group',
                              style: TextStyle(fontSize: 20.0,fontFamily: 'Montserrat')
                          ),
                        ),
                      ],

                    )
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child:
                        Text( 'Eat With..',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30.0,
                            fontWeight:FontWeight.w400,
                            color: Color(hexColor('#1A535C')),
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 0.0),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                    height: 325.0,
                    width: 225.0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.lightBlue[50]
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}



