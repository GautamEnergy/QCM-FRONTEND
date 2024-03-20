import 'dart:convert';

InOutModel inoutModelFromJson(String str) =>
    InOutModel.fromJson(json.decode(str));

String inoutModelToJson(InOutModel data) => json.encode(data.toJson());

class InOutModel {
  bool? status;
  String? message;
  List<InOutData>? data;

  InOutModel({this.status, this.message, this.data});

  InOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json["data"] == null
        ? []
        : List<InOutData>.from(
            json["data"][0].map((x) => InOutData.fromJson(x)));
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

class InOutData {
  String? employeeid;
  String? fullname;
  DateTime? date;
  String? intime;
  String? outtime;
  String? totaltime;
  String? profilepic;

  InOutData(
      {this.employeeid,
      this.fullname,
      this.date,
      this.intime,
      this.outtime,
      this.totaltime,
      this.profilepic});

  InOutData.fromJson(Map<String, dynamic> json) {
    employeeid = json['employeeid'];
    fullname = json['fullname'];
    date = DateTime.parse(json["date"]);
    intime = json['intime'];
    outtime = json['outtime'];
    totaltime = json['totaltime'];
    profilepic = json['profilepic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeid'] = employeeid;
    data['fullname'] = fullname;
    data['date'] = date;
    data['intime'] = intime;
    data['outtime'] = outtime;
    data['totaltime'] = totaltime;
    data['profilepic'] = profilepic;
    return data;
  }
}
