// To parse this JSON data, do
//
//     final regmodel = regmodelFromMap(jsonString);

import 'dart:convert';

class Regmodel {
    Regmodel({
          this.message,
          this.status,
          this.data,
    });

    final String ? message;
    final int ?status;
    final Data? data;

    factory Regmodel.fromJson(String str) => Regmodel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Regmodel.fromMap(Map<String, dynamic> json) => Regmodel(
        message: json["message"],
        status: json["status"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
        "data": data!.toMap(),
    };
}

class Data {
    Data({
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.confirmpassword,
        this.id,
        this.v,
    });

    final String ?firstname;
    final String ?lastname;
    final String ?email;
    final String ?password;
    final String ?confirmpassword;
    final String ?id;
    final int? v;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        confirmpassword: json["confirmpassword"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "confirmpassword": confirmpassword,
        "_id": id,
        "__v": v,
    };
}
