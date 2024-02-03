class SignInModel {
  bool? success;
  String? message;
  Data? data;

  SignInModel({
    this.success,
    this.message,
    this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? token;
  Result? result;

  Data({
    this.token,
    this.result,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "result": result?.toJson(),
      };
}

class Result {
  Geometry? geometry;
  String? fullName;
  String? profilePhoto;
  String? govtIdImage;
  String? password;
  bool? ageVerification;
  String? phoneNumber;
  String? formattedAddress;
  bool? verified;
  bool? blocked;
  int? deactivate;
  String? id;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Result({
    this.geometry,
    this.fullName,
    this.profilePhoto,
    this.govtIdImage,
    this.password,
    this.ageVerification,
    this.phoneNumber,
    this.formattedAddress,
    this.verified,
    this.blocked,
    this.deactivate,
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        fullName: json["fullName"],
        profilePhoto: json["profilePhoto"],
        govtIdImage: json["govtIdImage"],
        password: json["password"],
        ageVerification: json["ageVerification"],
        phoneNumber: json["phoneNumber"],
        formattedAddress: json["formattedAddress"],
        verified: json["verified"],
        blocked: json["blocked"],
        deactivate: json["deactivate"],
        id: json["_id"],
        email: json["email"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry?.toJson(),
        "fullName": fullName,
        "profilePhoto": profilePhoto,
        "govtIdImage": govtIdImage,
        "password": password,
        "ageVerification": ageVerification,
        "phoneNumber": phoneNumber,
        "formattedAddress": formattedAddress,
        "verified": verified,
        "blocked": blocked,
        "deactivate": deactivate,
        "_id": id,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Geometry {
  String? type;

  Geometry({
    this.type,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}
