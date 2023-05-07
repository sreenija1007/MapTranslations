import 'package:first/crud/delete_student.dart';
import 'package:first/crud/retrieve_student.dart';
import 'package:first/crud/students.dart';
import 'package:first/crud/update_student.dart';
import 'package:first/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'add_student.dart';

class chooseOP extends StatefulWidget {
  const chooseOP({Key? key}) : super(key: key);

  @override
  State<chooseOP> createState() => _chooseOPState();
}

class _chooseOPState extends State<chooseOP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black38,
        title: const Text("Home"),

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black38,
                ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const createpage()),
                    );
                  },
                  child: Text("Add")),
            SizedBox(
            height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const fetchstudent()),
                    );
                  },
                  child: Text("Retrieve")),
              SizedBox(
                  height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const updatepage()),
                    );
                  },
                  child: Text("Update")),
              SizedBox(
                  height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black38,
              ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const deletepage()),
                    );
                  },
                  child: Text("Delete")),
              SizedBox(
                  height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const mystudents()),
                    );
                  },
                  child: Text("view")),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      // isExtended: true,
      child: Icon(Icons.logout_rounded),
      backgroundColor: Colors.black38,
      onPressed: () {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>signInScreen()));
    },

  )






    );
  }
}
