import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context,) {
   double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
  return PreferredSize(
        preferredSize: Size.fromHeight(h/15),
              child: Container(
                  decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF8ac1d9),
                  const Color(0xFF7f74a4),
                ],
                begin: const FractionalOffset(0.1, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
      
      
                child: AppBar(
    backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
      
      
              ),
      ));
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
