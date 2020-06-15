import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String userName = '';
    String mail = '';
    String password = '';
    String streetName = '';
    int streetNumber = 0;
    String postalCode = '';
    String phone = '';
    String city = '';
    String birthDate = '';
    String role = '';
    String imageProfile = '';

    User({
        this.id,
        this.userName,
        this.mail,
        this.password,
        this.streetName,
        this.streetNumber,
        this.postalCode,
        this.phone,
        this.city,
        this.birthDate,
        this.role,
    });


    factory User.fromJson(Map<String, dynamic> json) => User(
        id            : json["id"],
        userName      : json["userName"],
        mail          : json["mail"],
        password      : json["password"],
        streetName    : json["streetName"],
        streetNumber  : json["streetNumber"],
        postalCode    : json["postalCode"],
        phone         : json["phone"],
        city          : json["city"],
        birthDate     : json["birthDate"],
        role          : json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id"              : id,
        "userName"        : userName,
        "mail"            : mail,
        "password"        : password,
        "streetName"      : streetName,
        "streetNumber"    : streetNumber,
        "postalCode"      : postalCode,
        "phone"           : phone,
        "city"            : city,
        "birthDate"       : birthDate,
        "role"            : role,
    };
}
