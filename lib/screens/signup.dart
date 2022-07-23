// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signinandsignupwithfirebase/screens/home.dart';
import 'package:signinandsignupwithfirebase/utils/color.dart';
import 'package:signinandsignupwithfirebase/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernametextcontroller = TextEditingController();
  TextEditingController _passwordtextcontroller = TextEditingController();
  TextEditingController _emailtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Sign Up',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexstringtocolor('CB2B93'),
              hexstringtocolor('9546C4'),
              hexstringtocolor('5E61F4')
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  reuseabletextfield('Enter Username', Icons.person_outline,
                      false, _usernametextcontroller),
                  SizedBox(
                    height: 20,
                  ),
                  reuseabletextfield('Enter Email ID', Icons.person_outline,
                      false, _emailtextcontroller),
                  SizedBox(
                    height: 20,
                  ),
                  reuseabletextfield('Enter Password', Icons.person_outline,
                      false, _passwordtextcontroller),
                  SizedBox(
                    height: 20,
                  ),
                  signinsignupbutton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailtextcontroller.text,
                            password: _passwordtextcontroller.text)
                        .then((val) {
                      print("Created new account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print('Error ${error.toString()}');
                    });
                  })
                ],
              ),
            ),
          ),
        ));
  }
}
