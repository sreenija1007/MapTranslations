
import 'package:flutter/material.dart';

Image logoWidget(String imagename){
  return Image.asset(
    imagename,
    fit:BoxFit.fitHeight,
    width: 100,
    height: 100
  );
}

TextField reusableTextField(String text,IconData icon,bool isPasswordType,TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white10,
    style: TextStyle(color: Colors.white60.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white60,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white10.withOpacity(0.9)),
      filled:true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black38,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0,style: BorderStyle.none),
      ),

    ),
    keyboardType: isPasswordType
        ?TextInputType.visiblePassword
        :TextInputType.emailAddress,

  );
}


Container Button(BuildContext context, String text, Function onTap){
  return Container(
    width:MediaQuery.of(context).size.width,
    height: 50,
    margin:const EdgeInsets.fromLTRB(0,10,0,20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16
        ),
      ),
      style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.pressed)){
          return Colors.white;
        }
        return Colors.black54;
      }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))

    ),

    ),


  );
}


