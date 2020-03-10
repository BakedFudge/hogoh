import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Models/doUserProfile.dart';

class DatabaseService with ChangeNotifier{
  final String uid;

  DatabaseService({this.uid});

  final Firestore _db = Firestore.instance;

  //Collection of User Profiles in App
  final CollectionReference userProfileCollection =
      Firestore.instance.collection('User_Profile');

  //Method to Update User Profile Data using uid.
  Future updateUserProfileDate(
      String uid,
      String username,
      String nickname,
      String tag,
//      String about,
//      DateTime dob,
//      String city,
//      String gender,
//      String veg_nv,
//      String fans,
     // double level
   ) async {
    return await userProfileCollection.document(uid).setData({
      'uid' : uid,
      'username': username,
      'nickname': nickname,
      'tag' : tag,
//      'about': about,
//      'dob': dob,
//      'city': city,
//      'veg_nv': veg_nv,
//      'fans': fans,
//      'level': level
    });
  }

  //Profile from snapshot
  List<doUserProfile> _userprofileListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return doUserProfile(
          uid: doc.documentID,
          username: doc.data['uname'] ?? '',
          nickname: doc.data['nickname'] ?? '',
//          about: doc.data['about'] ?? '',
//          dob: doc.data['DOB'] ?? '',
//          city: doc.data['city'],
//          gender: doc.data['gender'],
//          veg_nv: doc.data['veg_nv'],
//          fans: doc.data['fans'],
//          level: doc.data['level']
      );
    }).toList();
  }

//Get User Profile Stream
  Stream<List<doUserProfile>> get getUserProfiles {
    return userProfileCollection.snapshots().map(_userprofileListFromSnapshot);
  }

  //Get User
  Future<doUserProfile> getUser(String id) async{
    var snap = await _db.collection('User_Profile').document(id).get();

    return doUserProfile.fromMap(snap.data);
  }

//Get Current logged in User. Stream of single document
  Stream<doUserProfile> getCurrentUserFromSnapshot(String id) {
    return _db
        .collection('User_Profile')
        .document(id)
        .snapshots()
        .map((res) => doUserProfile.fromMap(res.data));
  }
}
