import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tradingapp/models/connection.dart';

import 'auth/Login/components/background.dart';
import 'components/rounded_button.dart';
import 'components/rounded_input_field.dart';
import 'components/text_field_container.dart';
import 'constants.dart';
import 'otp.dart';

class Mobilescreen extends StatefulWidget {
  Mobilescreen({Key? key}) : super(key: key);

  @override
  MmobilescreenState createState() => MmobilescreenState();
}

class MmobilescreenState extends State<Mobilescreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController number = TextEditingController();
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: MediaQuery.of(context).size.height * 0.30,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: number,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.call,
                        color: kPrimaryColor,
                      ),
                      hintText: "Mobile Number",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButton(
                  text: "Confirm",
                  press: () {
                    if (number.text.length == 10) {
                      print("number ${number.text}");
                      otpsend(number.text).then((value) {
                        final snackBar = SnackBar(
                          content: Text("$value"),
                          backgroundColor: kPrimaryColor,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Get.to(Otpscreen());
                      });
                    } else {
                      final snackBar = SnackBar(
                        content: Text("Enter Valid Mobile Number"),
                        backgroundColor: kPrimaryColor,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
