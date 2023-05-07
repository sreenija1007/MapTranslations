import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

import "../reusable_widgets/reusable_widget.dart";
import "../screens/signin_screen.dart";
import "../utils/colors.dart";
import "chooseOPeration.dart";
import "curdops/crudfunc.dart";


class updatepage extends StatefulWidget {
  const updatepage({ Key? key}) : super(key: key);

  @override
  _updatepageState createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
  final rollnocontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final classcontroller = TextEditingController();
  // final rollnotobeupdated = TextEditingController();
  // final classtobeupdated = TextEditingController();
  // final nametobeupdated = TextEditingController();

  // final docRef = db.collection("students").doc(rollnotobeupdated);
  // docRef.get().then(
  //   (DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     // ...
  //   },
  //   onError: (e) => print("Error getting document: $e"),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(


        automaticallyImplyLeading: false,
        title: Text("Update Student"),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                hexStringToColor("E8DAEF"),
                hexStringToColor("C3B1E1"),
                hexStringToColor("C3B1E1")//800080
              ]),
        ),
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
            SizedBox(
            height: 100,
          ),
              reusableTextField(
                  "Enter rollNo to be updated",Icons.numbers,false,rollnocontroller
              ),
              SizedBox(height:20),
              reusableTextField(
                  "Enter updated name",Icons.text_fields,false,namecontroller
              ),
              SizedBox(height:20),
              reusableTextField(
                  "Enter updated class",Icons.groups,false,classcontroller
              ),
              SizedBox(height:20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38
                  ),
                  onPressed: () async{
                await updateStudent(rollnocontroller.text,namecontroller.text,classcontroller.text);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text("Updated"),

                ));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const chooseOP()),
                );
              }, child: Text("Update")),
            ],

          ),),
      ),

        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.home),
          backgroundColor: Colors.black38,
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>chooseOP()));
          },

        )


    );
  }
}