import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/screens/email_otp_screen.dart';
import 'package:first/screens/signin_screen.dart';
import 'package:first/screens/phone_verification_input.dart';
import 'package:first/utils/colors.dart';
import 'package:first/screens/mapsat/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:first/screens/phone_otp_screen.dart';
import 'package:first/reusable_widgets/reusable_widget.dart';
class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);


  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {


  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  TextEditingController _usernameTexController =new TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              hexStringToColor("acc8d7"),
            hexStringToColor("8eb1c2"),
            hexStringToColor("779eb2")
              ]),
        ),
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30,120, 30, 0),
              child: Column(
                children: <Widget>[
                 // logoWidget("assets/images/logo-removebg-preview.png"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => numberInput()));
                    },
                    child: const Text("Phone OTP verification?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.underline
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(child: Text("OR")),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => emailOTP()));
                    },
                    child: const Text("Email OTP verification?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            decoration: TextDecoration.underline
                        )),
                  ),





                  SizedBox(
                    height: 60,
                  ),
                  reusableTextField("Enter UserName", Icons.person_2_outlined, false,
                      _usernameTexController),
                   const SizedBox(height: 20),
                  reusableTextField("Enter Email", Icons.email_outlined, false,
                      _emailTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(height: 30),
                  Button(context, "SIGN UP", () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                          print("Created new account");
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const signInScreen()));
                    }).onError((error, stackTrace){
                      print("Error ${error.toString()}");
                    });
                  })
                ],
              ),
            )
        ),
      ),
    );
  }
}

