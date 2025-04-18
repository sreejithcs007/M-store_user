// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);




class LoginModel {
    String? status;
    String? token;
    Data? data;

    LoginModel({
        this.status,
        this.token,
        this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        token: json["token"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data?.toJson(),
    };
}

class Data {
    dynamic userId;
    String? name;
    String? email;
    String? phone;
    String? address;

    Data({
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.address,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
    };
}
