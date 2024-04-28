// ignore_for_file: prefer_final_fields, duplicate_ignore, implementation_imports, prefer_const_constructors, sort_child_properties_last, unused_import, prefer_const_constructors_in_immutables, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lms/admin.dart';
import 'package:flutter_lms/screens/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_lms/glassmorphism.dart';
import 'package:flutter_lms/reusable_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String? errMessage;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginImage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: displayHeight * 0.07),
              SizedBox(
                height: 100,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displayWidth * 0.1,
                  vertical: displayHeight * 0.05,
                ),
                child: Glassmorphism(
                  blur: 1,
                  opacity: 0.5,
                  radius: 20,
                  child: Container(
                    height: 400,
                    width: 380,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 129, 223),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 8.0,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        reusableTextField("Enter Email", Icons.email, false,
                            _emailTextController),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(height: 10),
                        reusableTextField(
                          "Enter Password",
                          Icons.lock,
                          true,
                          _passwordTextController,
                        ),
                        SizedBox(height: 15),
                        // signInSignUpButton(
                        //   context,
                        //   true,
                        //  signInOtion(_emailTextController.text,
                        //       _passwordTextController.text),
                        // ),
                        Container(
                          width: 155,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90)),
                          child: ElevatedButton(
                            onPressed: () {
                              signInOtion(_emailTextController.text,
                                  _passwordTextController.text);
                            },
                            child: Text(
                              'LOGIN',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.black26;
                                }
                                return Color.fromARGB(255, 79, 129, 223);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 350),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget checkSignComponent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("NO ACCOUNT? ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            )),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Text(
            "SIGN UP HERE",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }*/

  // login function
  Future<void> signInOtion(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          // .signInWithUsernameAndPassword(username: userN, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Home(),
                )),
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Home(),
                )),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errMessage = "User with this email doesn't exist.";
          break;

        case "operation-not-allowed":
          errMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errMessage!);
      print(error.code);
    }
  }
}
