import 'package:blog_app/authentication.dart';
import 'package:blog_app/custom_widgets/custom_button.dart';
import 'package:blog_app/dialog_box.dart';
import 'package:blog_app/forget_password.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  LoginRegisterPage({
    this.auth,
    this.onSignedIn,
  });

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

enum FormType { login, register }

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  DialogBox dialogBox = DialogBox();
  bool flag = false;
  final formKey = GlobalKey<FormState>();

  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    setState(() {
      flag = true;
    });
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.signIn(_email, _password);
          dialogBox.information(
              context, "Congratulation ", "you have logged in successfully.");
          print("Login userId=" + userId);
        } else {
          String userId = await widget.auth.signUp(_email, _password);
          dialogBox.information(context, "Congratulation ",
              "your account has been created successfully.");
          print("Register userId=" + userId);
        }
        widget.onSignedIn();
      } catch (e) {
        dialogBox.information(context, "Error  ", e.toString());
        print("Error ${e.toString()}");
      }
    }
    setState(() {
      flag = false;
    });
  }

  void moveToRegister() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();

    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App",
        ),
      ),
      body: flag == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: createInputs() + createButtons(),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(height: 100.0),
      Center(
          child: Text(
        _formType == FormType.login ? "Sign In" : "Sign Up",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
      )),
      // logo(),
      SizedBox(height: 50.0),
      TextFormField(
        decoration: InputDecoration(
          labelText: "email",
        ),
//        validator: (value) {
//          return value.isEmpty ? "email is required " : null;
//        },
        validator: (val) =>
            val.isEmpty || !val.contains("@") ? "enter a valid eamil" : null,
        onSaved: (value) {
          return _email = value;
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "password",
        ),
        validator: (value) {
          return value.isEmpty ? "password is required " : null;
        },
        onSaved: (value) {
          return _password = value;
        },
      ),
      SizedBox(
        height: 15.0,
      ),
    ];
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        GestureDetector(
          child: Text(
            "Forget Password ?",
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => ForgotScreen())),
        ),
        SizedBox(
          height: 15.0,
        ),
        CustomButton(
          text: "Login",
          buttonColor: Colors.indigoAccent,
          onPress: validateAndSubmit,
        ),
        SizedBox(height: 10.0),
        SizedBox(height: 10.0),
        FlatButton(
          child: Text("Not have an Account? Create Account?"),
          textColor: Colors.pink,
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        CustomButton(
          text: "Create Account",
          buttonColor: Colors.pink,
          onPress: validateAndSubmit,
        ),
        SizedBox(height: 10.0),
        FlatButton(
          child: Text("Already have an Account? Login"),
          textColor: Colors.pink,
          onPressed: moveToLogin,
        ),
      ];
    }
  }
// Widget logo() {
//   return Hero(
//     tag: 'hero',
//     child: CircleAvatar(
//       backgroundColor: Colors.transparent,
//       radius: 110.0,
//       child: Image.asset("images/app_logo.png"),
//     ),
//   );
// }
}
