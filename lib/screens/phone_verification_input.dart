import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:first/screens/phone_otp_screen.dart';


class numberInput extends StatefulWidget {
  const numberInput({Key? key}) : super(key: key);
  static String verify="";
  @override
  State<numberInput> createState() => _numberInputState();
}

class _numberInputState extends State<numberInput> {
  TextEditingController _countryController = TextEditingController();
  // TextEditingController _emailTextController=TextEditingController();
  var phone="";
  // var email="";
  @override
  void initState() {
    // TODO: implement initState
    _countryController.text = "+91";
    super.initState();
  }

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
                  const Text(
                    "Phone Verification",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: _countryController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value){
                                phone=value;
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone",
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      child: const Text("Send the code"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: _countryController.text + phone,
                          verificationCompleted: (
                              PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId,
                              int? resendToken) {
                            numberInput.verify = verificationId;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const MyVerify()));

                          },
                          codeAutoRetrievalTimeout: (
                              String verificationId) {},
                        );
                      },
                    ),
                  ),



                ],
              ),
            )
        ),
      ),
    );
  }
}
