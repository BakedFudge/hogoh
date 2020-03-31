import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Screens/Home/Cards/cards.dart';
import 'package:hogoh/Screens/Home/sideBar.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Services/database.dart';
import 'package:hogoh/Shared/navigationBloc.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:provider/provider.dart';
import 'package:hogoh/Screens/Home/Cards/matches.dart';
import 'package:hogoh/Screens/Home/Cards/profiles.dart';

class Home extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class CusinesFilterEntry {
  const CusinesFilterEntry(this.cusineName);

  final String cusineName;
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();

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

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      body:
////      new CardStack(
////        matchEngine: matchEngine,
////      ),
//      //bottomNavigationBar: _buildBottomBar(),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<doUserProfile>>.value(
      value: DatabaseService().getUserProfiles,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color(hexColor('#F7FFF7')),
            body:
            CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverDelegate(
                    expandedHeight: 400,
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Filters
//                        ListTile(
//                          title:
//
//                          Text(
//                            "Filters",
//                            textAlign: TextAlign.center,
//
//                            style: TextStyle(
//                              color: Color(hexColor('#1A535C')),
//                              fontSize: 30.0,
//                              fontWeight: FontWeight.w500,
//                            ),
//                          ),
//                        ),
                        //EDIT BUTTON

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
                ])),
                SliverFillRemaining(
                  child: Center(
                    child: Text("data"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final MatchEngine matchEngine = new MatchEngine(
      matches: demoProfiles.map((Profile profile) {
    return Match(profile: profile);
  }).toList());

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 6 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Color(hexColor('#7bed9f')),
              leading: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 25,
                onPressed: () {},
              ),
              elevation: 0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("HogoH")),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 * percent),
                child: CardStack(
                  matchEngine: matchEngine,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      title: Text(
        "HogoH",
        style: TextStyle(
          color: Color(hexColor('#1A535C')),
          fontSize: 30.0,
          fontWeight: FontWeight.w800,
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
      trailing: Container(
        height: 50,
        child: FloatingActionButton(
          onPressed: () async {
            //await _auth.signOut();
          },
          backgroundColor: Color(hexColor('#7bed9f')),
          child: Icon(
            FontAwesomeIcons.rocket,
            color: Colors.black,
            size: 20.0,
          ),
          elevation: 5.0,
        ),
      ),
      leading: Container(
        height: 50,
        child: FloatingActionButton(
          onPressed: () async {
            await SideBar();
          },
          backgroundColor: Color(hexColor('#7bed9f')),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 20.0,
          ),
          elevation: 5.0,
        ),
      ),
    );
  }
}

class SwipeCards extends StatefulWidget {
  @override
  _SwipeCardsState createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  final MatchEngine matchEngine = new MatchEngine(
      matches: demoProfiles.map((Profile profile) {
    return Match(profile: profile);
  }).toList());

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 60.0),

          //SizedBox(height: 15.0),
//          //Single/group Tab
//          Padding(
//              padding: EdgeInsets.only(left: 15.0),
//              child: TabBar(
//                controller: tabController,
//                indicatorColor:Color(hexColor('#1A535C')),
//                labelColor: Colors.black,
//                unselectedLabelColor: Colors.grey,
//                isScrollable: true,
//                tabs: <Widget>[
//                  Tab(
//                    child: Text(
//                        'Single',
//                        style: TextStyle(fontSize: 20.0,fontFamily: 'Montserrat')
//                    ),
//                  ),
//                  Tab(
//                    child: Text(
//                        'Group',
//                        style: TextStyle(fontSize: 20.0,fontFamily: 'Montserrat')
//                    ),
//                  ),
//                ],
//
//              )
//          ),
          //SizedBox(height: 15.0),
//          //Header
//          Center(
//            child: Padding(
//              padding: EdgeInsets.all(20.0),
//              child:
//              Text( 'Eat With..',
//                style: TextStyle(
//                  fontFamily: 'Montserrat',
//                  fontSize: 30.0,
//                  fontWeight:FontWeight.w400,
//                  color: Color(hexColor('#1A535C')),
//                ),
//              ),
//            ),
//          ),
          //Cards
          Container(
            // color: Colors.white70,
            height: 500,
            child: CardStack(
              matchEngine: matchEngine,
            ),
          ),
          SizedBox(height: 10.0),

//                  Container(
//                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
//                    height: 325.0,
//                    width: 225.0,
//                    child:
//                  ),
        ],
      ),
    );
  }
}
