import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

import "../screens/signin_screen.dart";
import "../utils/colors.dart";
import "chooseOPeration.dart";
class mystudents extends StatefulWidget {
  const mystudents({ Key? key }) : super(key: key);

  @override
  _mystudentsState createState() => _mystudentsState();
}

class _mystudentsState extends State<mystudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Students"),
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
        margin: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context,studentSnapshot){
            if(studentSnapshot.connectionState== ConnectionState.waiting){
              return Center(
                child:CircularProgressIndicator(),
              );
            }
            else{
              final studentdocs = studentSnapshot.data!.docs;
              return ListView.builder(
                itemCount: studentdocs.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(studentdocs[index]['Name']),
                      subtitle: Text("RollNo: "+ studentdocs[index]['Rollno']+'   ' +"Class: " + studentdocs[index]['Class']),

                    ),
                  );
                },
              );
            }
          },

        ),
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