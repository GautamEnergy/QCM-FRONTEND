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

    data = json['data'] == null
        ? []
        : List<UserData>.from(json['data'].map((x) => UserData.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData {
  String? qualityId;
  String? shift;
  String? shiftInChargeName;
  String? shiftInChargePreLime;
  String? shiftInChargePostLim;
  String? productBarCode;
  String? wattage;
  String? modelNumber;
  String? issueType;
  String? stage;
  String? resposiblePerson;
  String? reasonOfIssue;
  String? issueComeFrom;
  String? actionTaken;
  String? createdBy;
  Null? updatedBy;
  String? createdOn;
  Null? updatedOn;
  String? modulePicture;
  String? otherIssueType;
  String? otherModelNumber;

  UserData(
      {this.qualityId,
      this.shift,
      this.shiftInChargeName,
      this.shiftInChargePreLime,
      this.shiftInChargePostLim,
      this.productBarCode,
      this.wattage,
      this.modelNumber,
      this.issueType,
      this.stage,
      this.resposiblePerson,
      this.reasonOfIssue,
      this.issueComeFrom,
      this.actionTaken,
      this.createdBy,
      this.updatedBy,
      this.createdOn,
      this.updatedOn,
      this.modulePicture,
      this.otherIssueType,
      this.otherModelNumber});

  UserData.fromJson(Map<String, dynamic> json) {
    qualityId = json['QualityId'];
    shift = json['Shift'];
    shiftInChargeName = json['ShiftInChargeName'];
    shiftInChargePreLime = json['ShiftInChargePreLime'];
    shiftInChargePostLim = json['ShiftInChargePostLim'];
    productBarCode = json['ProductBarCode'];
    wattage = json['Wattage'];
    modelNumber = json['ModelNumber'];
    issueType = json['IssueType'];
    stage = json['Stage'];
    resposiblePerson = json['ResposiblePerson'];
    reasonOfIssue = json['ReasonOfIssue'];
    issueComeFrom = json['IssueComeFrom'];
    actionTaken = json['ActionTaken'];
    createdBy = json['CreatedBy'];
    updatedBy = json['UpdatedBy'];
    createdOn = json['CreatedOn'];
    updatedOn = json['UpdatedOn'];
    modulePicture = json['ModulePicture'];
    otherIssueType = json['OtherIssueType'];
    otherModelNumber = json['OtherModelNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QualityId'] = this.qualityId;
    data['Shift'] = this.shift;
    data['ShiftInChargeName'] = this.shiftInChargeName;
    data['ShiftInChargePreLime'] = this.shiftInChargePreLime;
    data['ShiftInChargePostLim'] = this.shiftInChargePostLim;
    data['ProductBarCode'] = this.productBarCode;
    data['Wattage'] = this.wattage;
    data['ModelNumber'] = this.modelNumber;
    data['IssueType'] = this.issueType;
    data['Stage'] = this.stage;
    data['ResposiblePerson'] = this.resposiblePerson;
    data['ReasonOfIssue'] = this.reasonOfIssue;
    data['IssueComeFrom'] = this.issueComeFrom;
    data['ActionTaken'] = this.actionTaken;
    data['CreatedBy'] = this.createdBy;
    data['UpdatedBy'] = this.updatedBy;
    data['CreatedOn'] = this.createdOn;
    data['UpdatedOn'] = this.updatedOn;
    data['ModulePicture'] = this.modulePicture;
    data['OtherIssueType'] = this.otherIssueType;
    data['OtherModelNumber'] = this.otherModelNumber;
    return data;
  }
}
