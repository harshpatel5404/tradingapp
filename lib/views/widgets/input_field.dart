import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradingapp/views/screen/constants.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController con;
  final bool obtext;
  final String name;
  final IconData icon;
   Inputfield(
      {Key? key,
      required this.con,
      required this.name,
      required this.icon,
      required this.obtext,   })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: obtext,
        controller: con,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: name,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
