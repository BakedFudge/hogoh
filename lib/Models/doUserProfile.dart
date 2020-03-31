

class doUserProfile{

  final String uid;
  final String username;
  final String nickname;
  final String tag;
//  final DateTime dob;
//  final String city;
//  final String gender;
  final String veg_nonveg;
//  final String fans;
//  final double level;

  doUserProfile({this.uid,this.username,this.nickname,this.tag,this.veg_nonveg
//    , this.about,this.dob,this.city,this.gender,this.veg_nv,
//  this.fans,this.level
  });

  factory doUserProfile.fromMap(Map data){
    return doUserProfile(
      uid: data['uid'],
      username: data['username'],
      nickname: data['nickname'],
      tag: data['tag'],
//      about:  data['about'],
//      dob: data['dob'],
//      city: data['city'],
//      gender: data['gender'],
      veg_nonveg: data['veg_nonveg'],
//      fans: data['fans'],
//      level: data['level']
    );
  }

}