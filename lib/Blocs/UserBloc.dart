//import 'dart:async';
//import 'package:hogoh/Models/doUserProfile.dart';
//import 'package:hogoh/Services/database.dart';
//import 'package:rxdart/rxdart.dart';
//
//class UserBloc {
//
//  doUserProfile _user;
//  final _userController  = BehaviorSubject<doUserProfile>();
//  Stream<doUserProfile> get outUser => _userController.stream;
//  UserBloc(){
//    init();
//  }
//  void init() async {
//    _user = await DatabaseService.;
//    _userController.add(_user);
//  }
//  void updateUser(User user){
//    _user = user;
//    _userController.add(_user);
//  }
//}