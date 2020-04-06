class User{

  final String uid;

  User({this.uid});

  factory User.fromMap(Map data){
    return User(
      uid: data['uid'],
    );
  }
}