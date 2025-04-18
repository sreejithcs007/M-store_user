

class SignUpModel {
    String? status;
    String? message;
    User? user;

    SignUpModel({
        this.status,
        this.message,
        this.user,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
    };
}

class User {
    String? uName;
    String? uEmail;
    String? uPhone;
    dynamic uAddress;
    dynamic city;
    dynamic pinCode;
    dynamic uProfilePic;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    User({
        this.uName,
        this.uEmail,
        this.uPhone,
        this.uAddress,
        this.city,
        this.pinCode,
        this.uProfilePic,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        uName: json["u_name"],
        uEmail: json["u_email"],
        uPhone: json["u_phone"],
        uAddress: json["u_address"],
        city: json["city"],
        pinCode: json["pin_code"],
        uProfilePic: json["u_profile_pic"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "u_name": uName,
        "u_email": uEmail,
        "u_phone": uPhone,
        "u_address": uAddress,
        "city": city,
        "pin_code": pinCode,
        "u_profile_pic": uProfilePic,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
