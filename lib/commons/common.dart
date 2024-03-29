import 'package:flutter/material.dart';

// ==== colors ===
Color deepOrange = Colors.deepOrange;
Color black = Colors.black;

// methods
void changeScreen (BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement (BuildContext context, Widget widget) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}