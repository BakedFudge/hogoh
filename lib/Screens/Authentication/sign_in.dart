import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Shared/loading.dart';


class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  
  final AuthService _authService = AuthService();
  final _formKey  = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    print('signin in ');
    return loading? Loading() : Scaffold(
     // backgroundColor: Colors.deepOrange[30],
      appBar: AppBar(

        backgroundColor: Color(hexColor('#7bed9f')),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
              print('toggling');
              widget.toggleView();
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children : <Widget>[
              SizedBox(height:60.0),

              Text(
                'HogoH',
                style: GoogleFonts.freckleFace(
                  textStyle:
                  TextStyle(color: Color(hexColor('#7bed9f')),
                      fontSize:100,
                      letterSpacing: 8),
                ),
              ),
              SizedBox(height:20.0),
              TextFormField(
                validator:(val) => val.isEmpty ? 'Enter an Email!': null,
                obscureText: false,
                onChanged: (val) {
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                validator:(val) => val.length < 6 ? 'Pwd should be more than 6 chars': null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    pwd=val;
                  });
                },
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                color : Color(hexColor('#7bed9f')),
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print('Started');
                  if(_formKey.currentState.validate())
                  {
                    setState(() {
                      loading = true;
                    });
                    print('got in');
                    dynamic result = await _authService.signInWithEmail(email, pwd) ;
                    if(result==null){
                      setState(() {
                        print('User Null');
                        loading = false;
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }

                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color : Colors.blue[400],
                child: Text(
                  'Sign In with Google',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  _authService.signInWithGoogle().then((FirebaseUser user){
                  }).catchError((e) => print(e));
                },
              ),

              Text(
                error,
                style: TextStyle(color : Colors.red,fontSize: 14.0 ),
              )
            ]
          )
        ),
        )
    );
  }

}
