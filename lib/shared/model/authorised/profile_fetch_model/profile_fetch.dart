

class ProfileFetchModel {
    String? status;
    Users? user;

    ProfileFetchModel({
        this.status,
        this.user,
    });

    factory ProfileFetchModel.fromJson(Map<String, dynamic> json) => ProfileFetchModel(
        status: json["status"],
        user: json["user"] == null ? null : Users.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
    };
}

class Users {
    String? uName;
    String? uEmail;
    String? uPhone;
    String? uAddress;
    dynamic city;
    String? pinCode;
    String? uStatus;
    String? uProfilePic;
    int? superCoins;

    Users({
        this.uName,
        this.uEmail,
        this.uPhone,
        this.uAddress,
        this.city,
        this.pinCode,
        this.uStatus,
        this.uProfilePic,
        this.superCoins,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        uName: json["u_name"],
        uEmail: json["u_email"],
        uPhone: json["u_phone"],
        uAddress: json["u_address"],
        city: json["city"],
        pinCode: json["pin_code"],
        uStatus: json["u_status"],
        uProfilePic: json["u_profile_pic"],
        superCoins: json["super_coins"],
    );

    Map<String, dynamic> toJson() => {
        "u_name": uName,
        "u_email": uEmail,
        "u_phone": uPhone,
        "u_address": uAddress,
        "city": city,
        "pin_code": pinCode,
        "u_status": uStatus,
        "u_profile_pic": uProfilePic,
        "super_coins": superCoins,
    };
}
