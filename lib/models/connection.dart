import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tradingapp/models/registor.dart';

const baseURL = "https://stockappdemo1.herokuapp.com/auth/";

Future<String?> signupData(var first, var last, var email, var pass, var confirm) async {
  final response = await http.post(Uri.parse(baseURL + 'register'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "firstname": first,
        "lastname": last,
        "email": email,
        "password": pass,
        "confirmpassword": confirm
      }),
      encoding: Encoding.getByName('utf-8'));
  String send = "";
   var jsonString = response.body;
    var data = jsonDecode(jsonString);
    // print("userdata");
    // print(data);
    send = data["message"];
    // print(send);
    return send;
 
}

Future loginData(var email, var pass) async {
  final response = await http.post(Uri.parse(baseURL + 'login'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "email": email,
        "password": pass,
      }),
      encoding: Encoding.getByName('utf-8'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var data = jsonDecode(jsonString);
    print("userdata");
    print(data);
  } else {
    return null;
  }
}

Future<String> otpsend(String number) async {
  final response = await http.post(Uri.parse(baseURL + 'otp/send'),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({'number': "$number"}),
      encoding: Encoding.getByName('utf-8'));

  String send = "";

  if (response.statusCode == 200) {
    var jsonString = response.body;

    var data = jsonDecode(jsonString);
    // print(data["message"]);
    send = data["message"];
    return send;
  } else {
    return send;
    // throw Exception('Failed to load album');
  }
}

Future<String?> getOtp() async {
  final response = await http.get(Uri.parse(baseURL + 'otp/verify'));
  String? otp;
  if (response.statusCode == 200) {
    var jsonString = response.body;
    var data = jsonDecode(jsonString);
    print("object");
    print(data);
    otp = data["message"];
    print("otp");
    print(otp);
    return otp;
  } else {
    return otp;
  }
}
