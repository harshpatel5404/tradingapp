import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradingapp/models/connection.dart';
import 'package:tradingapp/models/registor.dart';
import 'package:tradingapp/views/screen/auth/Login/components/login_screen.dart';
import 'package:tradingapp/views/screen/components/rounded_button.dart';
import 'package:tradingapp/views/screen/components/rounded_input_field.dart';
import 'package:tradingapp/views/screen/components/text_field_container.dart';
import 'package:tradingapp/views/screen/constants.dart';
import 'package:tradingapp/views/widgets/input_field.dart';

import 'background.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController cname;
  late TextEditingController cpass;
  late TextEditingController cemail;
  late TextEditingController clastname;
  late TextEditingController ccpass;

  @override
  void initState() {
    super.initState();
    cname = TextEditingController(text: '');
    clastname = TextEditingController(text: '');
    cemail = TextEditingController(text: '');
    cpass = TextEditingController(text: '');
    ccpass = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/signup.png"),
                radius: 70,
              ),
              Inputfield(
                icon: Icons.person,
                obtext: false,
                con: cname,
                name: "First Name",
              ),
              Inputfield(
                icon: Icons.person,
                obtext: false,
                con: clastname,
                name: "Last Name",
              ),
              Inputfield(
                icon: Icons.email,
                obtext: false,
                con: cemail,
                name: "Email",
              ),
              Inputfield(
                icon: Icons.lock,
                obtext: true,
                con: cpass,
                name: "Password",
              ),
              Inputfield(
                icon: Icons.lock,
                obtext: true,
                con: ccpass,
                name: "Confirm Password",
              ),
              RoundedButton(
                text: "Sign Up",
                press: () {
                  if (cname.text == "" ||
                      clastname.text == "" ||
                      cemail.text == "" ||
                      cpass.text == "" ||
                      ccpass.text == "") {
                    final snackBar = SnackBar(
                      content: Text("All fileds are required!"),
                      backgroundColor: kPrimaryColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    if (cpass.text == ccpass.text) {
                      signupData(cname.text, clastname.text, cemail.text,
                              cpass.text, ccpass.text)
                          .then((value) {
                        final snackBar = SnackBar(
                          content: Text("Register Sucessfully...!"),
                          backgroundColor: kPrimaryColor,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Get.off(const LoginScreen());
                      });
                    } else {
                      final snackBar = SnackBar(
                        content: Text("password are not match!"),
                        backgroundColor: kPrimaryColor,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              InkWell(
                onTap: () {
                  Get.off(const LoginScreen());
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Already have an Account ? Login",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
