import 'package:blog_app/authentication.dart';
import 'package:blog_app/new_card_form.dart';
import 'package:blog_app/new_customer_form.dart';
import 'package:blog_app/payment_button_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/custom_button.dart';
import 'custom_widgets/custom_list_tile.dart';

class HomePage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  HomePage({
    this.auth,
    this.onSignedOut,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: Drawer(
//        child: ListView(
//          children: [
//            SizedBox(
//              height: 150.0,
//            ),
//            CustomListTile(
//                text: "Add New Customer",
//                icon: Icons.add_circle,
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => NewCustomerForm()),
//                  );
//                }),
//            SizedBox(
//              height: 40.0,
//            ),
//            CustomListTile(
//                text: "Add New Card",
//                icon: Icons.credit_card,
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) => NewCardForm()),
//                  );
//                }),
//            SizedBox(
//              height: 40.0,
//            ),
//            CustomListTile(
//                text: "Make A Payment",
//                icon: Icons.attach_money,
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => PaymentButtonScreen()),
//                  );
//                }),
//          ],
//        ),
//      ),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            iconSize: 40.0,
            color: Colors.white,
            onPressed: _logoutUser,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Colors.white60,
              Colors.yellow.withOpacity(.1),
              Colors.white30,
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.0,
                child: CustomButton(
                  text: "Add New Customer",
                  buttonColor: Colors.greenAccent,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewCustomerForm()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                child: CustomButton(
                  text: "Add New Card",
                  buttonColor: Colors.white30,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewCardForm()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                child: CustomButton(
                  text: "Make A Payment",
                  buttonColor: Colors.purpleAccent,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentButtonScreen()),
                    );
                  },

//              child: Text("Make A Payment"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
