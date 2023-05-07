import 'package:first/crud/chooseOPeration.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../screens/signin_screen.dart';
import '../utils/colors.dart';
import 'curdops/crudfunc.dart';


class deletepage extends StatefulWidget {
  const deletepage({ Key? key }) : super(key: key);

  @override
  _deletepageState createState() => _deletepageState();
}

class _deletepageState extends State<deletepage> {
  final deleterollnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(


        automaticallyImplyLeading: false,
        title: Text("Delete Student"),
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
                height: 150,
              ),
              reusableTextField(
                  "Enter rollNo to be deleted ",Icons.numbers,false,deleterollnocontroller
              ),
              SizedBox(height:20),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.black38
                  ),
                  onPressed: () async{
                await deleteStudent(deleterollnocontroller.text);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text("Deleted"),

                ));
                Navigator.pop(context);
              }, child: Text("Delete Student"))
            ],),),
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