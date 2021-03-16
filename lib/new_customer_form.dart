import 'package:blog_app/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NewCustomerForm extends StatefulWidget {
  @override
  _NewCustomerFormState createState() => _NewCustomerFormState();
}

class _NewCustomerFormState extends State<NewCustomerForm> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final passwordController = TextEditingController();

  void validate() {
    if (formKey.currentState.validate()) {
      print("validate");
    } else
      print("not validated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          autovalidate: false,
//          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add New Customer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is Required";
                    } else if (value.length < 5) {
                      return "atleast 5 characters";
                    } else {
                      return null;
                    }
                  },
                  controller: textController,
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value.length < 5) {
                      return "Password is Required";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  onPressed: validate,
                  child: Text("Submit"),
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
