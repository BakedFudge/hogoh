import 'package:flutter/material.dart';
import 'package:hogoh/Models/commonHelper.dart';
import 'package:hogoh/Services/Auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(hexColor('#F7FFF7')),
        appBar: AppBar(
          backgroundColor: Color(hexColor('#7bed9f')),
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: () {
                  widget.toggleView();
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email!' : null,
                  obscureText: false,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) =>
                      val.length < 6 ? 'Pwd should be min 6 chars' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      pwd = val;
                    });
                  },
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Color(hexColor('#7bed9f')),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.registerWithEmailAndPassword(email,pwd);
                      if (result == null) {
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
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ])),
        ));
  }
}
