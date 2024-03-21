import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  String? message;
  List<UserData>? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json["data"] == null
        ? []
        : List<UserData>.from(json["data"][0].map((x) => UserData.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? personid;
  String? employeeid;
  String? employeementtype;
  String? fullname;
  String? profilepic;
  String? officialcontactno;
  String? officialemail;
  String? personalcontactno;
  String? personalemail;
  String? department;

  UserData(
      {this.personid,
      this.employeeid,
      this.employeementtype,
      this.fullname,
      this.profilepic,
      this.officialcontactno,
      this.officialemail,
      this.personalcontactno,
      this.personalemail,
      this.department});

  UserData.fromJson(Map<String, dynamic> json) {
    personid = json['personid'];
    employeeid = json['employeeid'];
    employeementtype = json['employeementtype'];
    fullname = json['fullname'];
    profilepic = json['profilepic'];
    officialcontactno = json['officialcontactno'];
    officialemail = json['officialemail'];
    personalcontactno = json['personalcontactno'];
    personalemail = json['personalemail'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personid'] = this.personid;
    data['employeeid'] = this.employeeid;
    data['employeementtype'] = this.employeementtype;
    data['fullname'] = this.fullname;
    data['profilepic'] = this.profilepic;
    data['officialcontactno'] = this.officialcontactno;
    data['officialemail'] = this.officialemail;
    data['personalcontactno'] = this.personalcontactno;
    data['personalemail'] = this.personalemail;
    data['department'] = this.department;
    return data;
  }
}






































// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String userModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   UserModel({
//     this.success,
//     this.data,
//   });

//   bool? success;
//   List<UserData>? data;

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         success: json["success"],
//         data: json["data"] == null
//             ? []
//             : List<UserData>.from(
//                 json["data"].map((x) => UserData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class UserData {
//   UserData({
//     this.personid,
//     this.fullName,
//     this.occupation,
//     this.profilepicture,
//     this.isMemberrole,
//     this.phonenum,
//     this.email,
//     this.businessname,
//     this.businesscategory,
//     this.area,
//     this.personStatus,
//     this.firstname,
//     this.lastname,
//     this.countrycode,
//     this.logo,
//     this.facebooklink,
//     this.instalink,
//     this.linkdlnlink,
//     this.website,
//     this.membershipexpirationdatecount,
//   });

//   String? personid;
//   String? fullName;
//   String? occupation;
//   String? profilepicture;
//   int? isMemberrole;
//   String? phonenum;
//   String? email;
//   String? businessname;
//   String? businesscategory;
//   String? area;
//   String? personStatus;
//   String? firstname;
//   String? lastname;
//   String? countrycode;
//   String? logo;
//   String? facebooklink;
//   String? instalink;
//   String? linkdlnlink;
//   String? website;
//   int? membershipexpirationdatecount;

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         personid: json["personid"],
//         fullName: json["FullName"] == null ? '' : json["FullName"],
//         occupation: json["occupation"] == null ? '' : json["occupation"],
//         profilepicture:
//             json["profilepicture"] == null ? '' : json["profilepicture"],
//         isMemberrole: json["IsMemberrole"] == null ? '' : json["IsMemberrole"],
//         phonenum: json["phonenum"] == null ? '' : json["phonenum"],
//         email: json["email"] == null ? '' : json["email"],
//         businessname: json["businessname"] == null ? '' : json["businessname"],
//         businesscategory:
//             json["businesscategory"] == null ? '' : json["businesscategory"],
//         area: json["area"] == null ? '' : json["area"],
//         personStatus: json["personStatus"] == null ? '' : json["personStatus"],
//         firstname: json["firstname"] == null ? '' : json["firstname"],
//         lastname: json["lastname"] == null ? '' : json["lastname"],
//         countrycode: json["countrycode"] == null ? '' : json["countrycode"],
//         logo: json["logo"],
//         facebooklink: json["facebooklink"] == null ? '' : json["facebooklink"],
//         instalink: json["instalink"] == null ? '' : json["instalink"],
//         linkdlnlink: json["linkdlnlink"] == null ? '' : json["linkdlnlink"],
//         website: json["website"] == null ? '' : json["linkdlnlink"],
//         membershipexpirationdatecount:
//             json["membershipexpirationdatecount"] == null
//                 ? 0
//                 : json["membershipexpirationdatecount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "personid": personid,
//         "FullName": fullName,
//         "occupation": occupation,
//         "profilepicture": profilepicture,
//         "IsMemberrole": isMemberrole,
//         "phonenum": phonenum,
//         "email": email,
//         "businessname": businessname,
//         "businesscategory": businesscategory,
//         "area": area,
//         "personStatus": personStatus,
//         "firstname": firstname,
//         "lastname": lastname,
//         "countrycode": countrycode,
//         "logo": logo,
//         "facebooklink": facebooklink,
//         "instalink": instalink,
//         "linkdlnlink": linkdlnlink,
//         "website": website,
//         "membershipexpirationdatecount": membershipexpirationdatecount,
//       };
// }
