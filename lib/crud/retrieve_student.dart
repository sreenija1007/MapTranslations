import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/crud/update_student.dart';
import 'package:first/reusable_widgets/reusable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'add_student.dart';

// import "{ doc, getDoc } from firebase/firestore";


class fetchstudent extends StatefulWidget {
  const fetchstudent({Key? key}) : super(key: key);

  @override
  _fetchstudentState createState() => _fetchstudentState();
}

class _fetchstudentState extends State<fetchstudent> {
  final classtobeupdated = TextEditingController();
  final nametobeupdated = TextEditingController();
  final rollnofetched = TextEditingController();
  var db = FirebaseFirestore.instance;
  // void getdata(String rollno) {
  //   final docRef = db.collection("student_data").doc(rollno);
  //   docRef.get().then(
  //     (DocumentSnapshot doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       classtobeupdated.text = data["Class"];
  //       nametobeupdated.text = data["name"];

  //       // ...
  //     },
  //     onError: (e) => print("Error getting document: $e"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Fetch Student"),
          backgroundColor: Colors.black38,
      ),
      body: Center(
        child: Container(
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
          child: Column(

            children: [
              SizedBox(
                height: 150,
              ),
              reusableTextField("Enter rollno", Icons.numbers, false, rollnofetched),
              SizedBox(height:20),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('students')
                        .doc(rollnofetched.text)
                        .get()
                        .then((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.exists) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text("Present Document data: ${documentSnapshot.data()}\n Enter new data to be updated"),

                        ));

                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const updatepage()),
                          );

                       // return 'Document data: ${documentSnapshot.data()}';
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text("Document does not exist on the database, add data "),

                        ));
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const createpage()),
                          );
                        //return 'Document does not exist on the database';
                      }

                    }

                      // onError: (e) {

                      //   TextButton(child: Text("OOps! Data not found\nWould you like to Add"),
                      //   onPressed: () {
                      //     Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const createpage()),
                      //   );
                      //   },
                      //   );
                      // },
                    );

                  },
                  child: Text("Fetch Student")),
            ],
          ),
        ),
      ),
    );
  }
}