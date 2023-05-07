

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

createStudent(String rollno,String name,String classname) async{
  await FirebaseFirestore.instance.collection('students').doc(rollno).set(
      {
        'Rollno':rollno,
        'Class':classname,
        'Name': name,

      }
  ).then((value) => null);
}

updateStudent(String rollno,String name,String classname) async{
  await FirebaseFirestore.instance.collection('students').doc(rollno).update({
    'Class':classname,
    'Name':name,
    'Rollno':rollno,

  });
}
deleteStudent(String docname) async{
  await FirebaseFirestore.instance.collection("students").doc(docname).delete();
}