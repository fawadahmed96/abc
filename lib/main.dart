import 'package:blog_app/authentication.dart';
import 'package:blog_app/new_card_form.dart';
import 'package:blog_app/new_customer_form.dart';
import 'package:flutter/material.dart';
import 'mapping.dart';
import 'package:firebase_core/firebase_core.dart';
import 'payment_button_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlogApp());
}


class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: PaymentButtonScreen(),
      home: Mapping(auth: Auth(),),
    );
  }
}
