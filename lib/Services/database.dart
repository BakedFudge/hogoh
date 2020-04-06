import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogoh/Models/doCusine.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService with ChangeNotifier {
   String uid;

  DatabaseService({this.uid});

  final Firestore _db = Firestore.instance;
   final FirebaseAuth _auth = FirebaseAuth.instance;

   void inputData() async {
     final FirebaseUser user = await _auth.currentUser();
     final uid = user.uid;
     // here you write the codes to input the data into firestore
   }
   //Collection of User Profiles in App
  final CollectionReference userProfileCollection =
      Firestore.instance.collection('User_Profile');

  //Method to Update User Profile Data using uid.
  Future updateUserProfileData(
    String uid,
    String username,
    String nickname,
    String tag,
    String veg_nonveg,
  ) async {
    return await userProfileCollection.document(uid).setData({
      'uid': uid,
      'username': username,
      'nickname': nickname,
      'tag': tag,
      'veg_nonveg': "N",
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

  List<doCusine> _cuisineistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return doCusine(
        cusineid: doc.data['cusineid'],
        cusinename: doc.data['cusinename'] ?? '',
      );
    }).toList();
  }

  //Get Cuisine Stream
  Stream<List<doCusine>> getCuisines() {
    return _db
        .collection('Cuisines')
        .orderBy('cuisineid', descending: true)
        .snapshots()
        .map((snap) =>
            snap.documents.map((doc) => doCusine.fromJson(doc.data)).toList());
  }

//Get User Profile Stream
  Stream<List<doUserProfile>> get getUserProfiles {
    return userProfileCollection.snapshots().map(_userprofileListFromSnapshot);
  }

  //Get User
  Future<doUserProfile> getUser(String id) async {
    var snap = await _db.collection('User_Profile').document(id).get();

    return doUserProfile.fromMap(snap.data);
  }


  Future getCurrentUser() async {
    return await _auth.currentUser();
  }

//Get Current logged in User. Stream of single document
  Stream<doUserProfile> getCurrentUserFromSnapshot(String id) {

    print('getCurrentUserFromSnapshot :$id');

    return _db
        .collection('User_Profile')
        .document(id)
        .snapshots()
        .map((res) => doUserProfile.fromMap(res.data));
  }

//Get Cuisines

//final CollectionReference cusineCollection = Firestore.instance.collection('Cuisines');

}
