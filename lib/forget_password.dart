import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  String email = "";
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "we will mail you a link ... Please click on that link to reset your password"),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter your email";
                    } else {
                      email = value;
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email)
                          .then((value) => print("check your email"));
                    }
                  },
                  child: Text("Send Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
