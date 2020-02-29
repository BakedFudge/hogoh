import 'package:flutter/material.dart';
import 'package:hogoh/Services/Auth.dart';
import 'package:hogoh/Screens/Authentication/authenticate.dart';



class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey  = GlobalKey<FormState>();

  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[20],
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent[200],
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: () {
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
                  children : <Widget>[
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
                      validator:(val) => val.length < 6 ? 'Pwd should be min 6 chars': null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          pwd=val;
                        });
                      },
                    ),
                    SizedBox(height: 30.0),
                    RaisedButton(
                      color : Colors.deepOrange[400],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate())
                          {
                            dynamic result = await _auth.registerInWithEmail(email, pwd) ;
                            if(result==null){
                              setState(() {
                                error = 'Enter valid email or pwd';
                              });
                            }
                          }
                      },
                    ),
                    SizedBox(height: 20.0),
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
