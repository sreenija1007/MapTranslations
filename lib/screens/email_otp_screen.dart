import 'package:email_otp/email_otp.dart';
import 'package:first/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'mapsat/home_screen.dart';

class emailOTP extends StatefulWidget {
  const emailOTP({Key? key}) : super(key: key);

  @override
  State<emailOTP> createState() => _emailOTPState();
}

class _emailOTPState extends State<emailOTP> {
  TextEditingController email = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  EmailOTP myauth = EmailOTP();
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: email,
                          decoration:
                          const InputDecoration(hintText: "User Email")),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          myauth.setConfig(
                              appEmail: "myfirstapp.com",
                              appName: "Email OTP",
                              userEmail: email.text,
                              otpLength: 6,
                              otpType: OTPType.digitsOnly
                          );
                          if (await myauth.sendOTP() == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ));
                          }
                        },
                        child: const Text("Send OTP")),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: otp,
                          decoration:
                          const InputDecoration(hintText: "Enter OTP")),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (await myauth.verifyOTP(otp: otp.text) == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP is verified"),

                            ));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => signUpScreen()));
                        },
                        child: const Text("Verify")),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}