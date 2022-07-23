// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signinandsignupwithfirebase/screens/home.dart';
import 'package:signinandsignupwithfirebase/screens/signup.dart';
import 'package:signinandsignupwithfirebase/utils/color.dart';
import 'package:signinandsignupwithfirebase/widgets/widgets.dart';

class SigInScreen extends StatefulWidget {
  const SigInScreen({Key? key}) : super(key: key);

  @override
  State<SigInScreen> createState() => _SigInScreenState();
}

class _SigInScreenState extends State<SigInScreen> {
  TextEditingController _passwordtextcontroller = TextEditingController();
  TextEditingController _emailtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexstringtocolor('CB2B93'),
          hexstringtocolor('9546C4'),
          hexstringtocolor('5E61F4'),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reuseabletextfield("Enter Username", Icons.person_outline, false,
                  _emailtextcontroller),
              SizedBox(
                height: 8,
              ),
              reuseabletextfield("Enter Password", Icons.lock_outline, true,
                  _passwordtextcontroller),
              SizedBox(
                height: 20,
              ),
              signinsignupbutton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailtextcontroller.text,
                        password: _passwordtextcontroller.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              signupoption()
            ],
          ),
        ),
      ),
    );
  }

  Row signupoption() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            "Dont have an account?",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(
            width: 3,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              'Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]);
  }
}
