import 'package:blog_app/authentication.dart';
import 'package:blog_app/home_page.dart';
import 'package:blog_app/login_register_page.dart';
import 'package:flutter/widgets.dart';

class Mapping extends StatefulWidget {
  final AuthImplementation auth;

  Mapping({this.auth});

  @override
  _MappingState createState() => _MappingState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _MappingState extends State<Mapping> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserId) {
      setState(() {
        authStatus = firebaseUserId == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("fawad result ${authStatus.toString()}");
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        print("fawad result ${authStatus.toString()}");
        return LoginRegisterPage(auth: widget.auth, onSignedIn: _signedIn);

      case AuthStatus.signedIn:
        print("fawad result ${authStatus.toString()}");
        return HomePage(auth: widget.auth, onSignedOut: _signedOut);
    }

    return Container();
  }
}
