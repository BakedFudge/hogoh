import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//          appBar: AppBar(
//            actions: <Widget>[
//              FlatButton.icon(
//                  onPressed: () async {
//                    await _auth.signOut();
//
//                  },
//                  icon: Icon(Icons.person),
//                  label:  Text('Log Out'),
//              )
//            ],
//          ),
          body : ListView(
            children: <Widget>[

              SizedBox(height: 15.0),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.menu,color: Colors.deepOrange[400],),
                        iconSize: 50.0,
                      ),
                      FloatingActionButton(
                        onPressed: (){},
                        backgroundColor: Colors.grey[100],
                        child: Icon(Icons.person,color: Colors.deepOrange[400],size: 35.0,),
                        elevation: 0.0,
                      )
                    ],
                  ),
                ),
              ),

              Container(
                child:Padding(
                  padding: EdgeInsets.all(50.0),
                  child:
                  Text( 'Eat With..',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      fontWeight:FontWeight.w400,
                    ),
                  ),
                ),
              )
//            Container(
//              child: Center(
//                child: LiquidSwipe(
//                  pages: pages,
//                  enableLoop: true,
//                  fullTransitionValue:300,
//                  enableSlideIcon: true,
//                  waveType: WaveType.liquidReveal,
//                  positionSlideIcon: 0.5,
//                ),
//              ),
//            )
            ],
          )

      ),
    );
  }
}



class Home1 extends StatelessWidget {

  final AuthService _auth = AuthService();

  final pages=[
    Container(
      color: Colors.lightGreen,
    ),
    Container(
      color: Colors.lightBlueAccent,
    ),
    Container(
      color: Colors.yellow,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//          appBar: AppBar(
//            actions: <Widget>[
//              FlatButton.icon(
//                  onPressed: () async {
//                    await _auth.signOut();
//
//                  },
//                  icon: Icon(Icons.person),
//                  label:  Text('Log Out'),
//              )
//            ],
//          ),
        body : ListView(
          children: <Widget>[

            SizedBox(height: 15.0),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.menu,color: Colors.deepOrange[400],),
                      iconSize: 50.0,
                    ),
                     FloatingActionButton(
                       onPressed: (){},
                       backgroundColor: Colors.grey[100],
                       child: Icon(Icons.person,color: Colors.deepOrange[400],size: 35.0,),
                       elevation: 0.0,
                     )
                  ],
                ),
              ),
            ),

            Container(
              child:Padding(
                padding: EdgeInsets.all(50.0),
                child:
                Text( 'Eat With..',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  fontSize: 50.0,
                  fontWeight:FontWeight.w400,
                  ),
                ),
              ),
            )
//            Container(
//              child: Center(
//                child: LiquidSwipe(
//                  pages: pages,
//                  enableLoop: true,
//                  fullTransitionValue:300,
//                  enableSlideIcon: true,
//                  waveType: WaveType.liquidReveal,
//                  positionSlideIcon: 0.5,
//                ),
//              ),
//            )
          ],
        )

      ),
    );
  }
}
