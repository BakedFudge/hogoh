import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hogoh/Models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =  GoogleSignIn();


  User _userfFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }



  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfFromFirebaseUser);
  }

  //Sign In Anonymously
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with Email n pwd
  Future signInWithEmail(String email, String pwd) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: pwd);
      FirebaseUser user = result.user;
      print('Insidde Auth');
      return _userfFromFirebaseUser(user);
    }
    catch (e) {
      print('Fitebase err');
    }
  }

  //Register with Email and Pwd.
  Future registerInWithEmail(String email, String pwd) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      FirebaseUser user = result.user;
      return _userfFromFirebaseUser(user);
    }
    catch (e) {
      print('');
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> signInWithGoogle()  async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final FirebaseUser user = (await _auth.signInWithCredential(credential))
          .user;
      print("signed in " + user.displayName);
      return user;
    }
    catch(e){
      print(e.toString());
    }
  }
}