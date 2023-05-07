import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/crud/chooseOPeration.dart';
import 'package:first/screens/exit-popup.dart';
import 'package:first/utils/colors.dart';
import 'package:first/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:first/screens/signup_screen.dart';
import 'package:first/screens/mapsat/home_screen.dart';
import 'package:flutter/services.dart';


class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  TextEditingController _phoneNmberTextController= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>showExitPopup(context),
      child: AutofillGroup(
        child: Scaffold(
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
                    hexStringToColor("779eb2")//800080
                  ]),
            ),
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, MediaQuery
                      .of(context)
                      .size
                      .height * 0.25, 30, 0),
                  child: Column(
                    children: <Widget>[
                      logoWidget("assets/images/map-removebg-preview.png"),
                      SizedBox(height: 20),
                      reusableTextField("Enter Email", Icons.email_outlined, false,
                          _emailTextController),
                      SizedBox(height: 20),
                      reusableTextField("Enter password", Icons.lock_outline, true,
                          _passwordTextController),
                      SizedBox(height: 30),
                      Button(context, "LOG IN", () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                            .then((value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }).onError((error, stackTrace) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Enter valid email or password"),

                          ));
                        });
                      }) ,
                      signUpOption(),


                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            "Don't have Account?", style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => signUpScreen()));
          },
          child: const Text("Sign Up",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}



