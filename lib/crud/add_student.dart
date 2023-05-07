

import 'package:first/crud/chooseOPeration.dart';
import 'package:first/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

import '../screens/signin_screen.dart';
import '../utils/colors.dart';
import 'curdops/crudfunc.dart';


class createpage extends StatefulWidget {
  const createpage({ Key? key }) : super(key: key);

  @override
  _createpageState createState() => _createpageState();
}

class _createpageState extends State<createpage> {
  final rollnocontroller = TextEditingController();
  final classcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(


        automaticallyImplyLeading: false,
        title: Text("Create Student"),
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
        child: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                reusableTextField(
                  "Enter rollNo",Icons.numbers,false,rollnocontroller
                ),
                SizedBox(height:20),
                reusableTextField(
                    "Enter name",Icons.text_fields,false,namecontroller
                ),
                SizedBox(height:20),
                reusableTextField(
                    "Enter class",Icons.groups,false,classcontroller
                ),
                SizedBox(height:20),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                    ),
                    onPressed: () async {
                  await createStudent(rollnocontroller.text,namecontroller.text,classcontroller.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                    content: Text("Added"),

                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const chooseOP()),
                  );
                }, child: Text("Add")),
              ],

            ),),),
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