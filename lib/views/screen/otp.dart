import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tradingapp/models/connection.dart';
import 'package:tradingapp/views/screen/auth/Signup/components/signup_screen.dart';

import 'auth/Login/components/background.dart';
import 'components/rounded_button.dart';
import 'components/text_field_container.dart';
import 'constants.dart';

class Otpscreen extends StatefulWidget {
  Otpscreen({Key? key}) : super(key: key);

  @override
  OotpscreenState createState() => OotpscreenState();
}

class OotpscreenState extends State<Otpscreen> {
  TextEditingController otpcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // otpsend();
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: otpcontroller,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.call,
                        color: kPrimaryColor,
                      ),
                      hintText: "Enter Otp",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButton(
                  text: "Verify",
                  press: () {
                    if (otpcontroller.text.length == 6) {
                      getOtp().then((value) {
                        print("value");
                        print("$value");
                        if (value == "999999") {
                          final snackBar = SnackBar(
                            content: Text("Otp Verified Sucessfully..! $value"),
                            backgroundColor: kPrimaryColor,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Get.to(SignUpScreen());
                        }
                        else{
                           final snackBar = SnackBar(
                        content: Text("$value"),
                        backgroundColor: kPrimaryColor,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                          Get.to(SignUpScreen());

                      });
                    } else {
                      final snackBar = SnackBar(
                        content: Text("Enter Valid OTP"),
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
