import 'dart:convert';
import 'dart:io';
import 'package:QCM/CommonDrawer.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/attendance.dart';
import 'package:QCM/components/appbar.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_fonts.dart';
import 'package:QCM/directory.dart';
import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/app_styles.dart';

class SalaryReport extends StatefulWidget {
  @override
  _SalaryReportState createState() => _SalaryReportState();
}

class _SalaryReportState extends State<SalaryReport> {
  TextEditingController FromDateController = TextEditingController();
  TextEditingController ToDateController = TextEditingController();
  String? clubname,
      site,
      pic,
      logo,
      ImagePath,
      personid,
      excelFileName = '',
      receiverEmail = '',
      role = '',
      monthController;
  List organizationdata = [];
  int ListLength = 0;
  bool _isLoading = false, _isDownloading = false;
  var formatter = NumberFormat('#,##,000');
  String? _typeController = null;
  bool loader = false, isAllowedVicePresident = false, isAllowedEdit = false;
  bool menu = true, user = false, face = false, home = false;
  var excel = Excel.createExcel();
  int? FromDateYear,
      ToDateYear,
      FromDateMonth,
      ToDateMonth,
      FromDateDay,
      ToDateDay;
  String? _localPath, organizationid, organizationtype;
  bool? _permissionReady;
  TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
    store();
    getorganizationdropdown();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  Future<void> generateExcel(String month) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      site = prefs.getString('site');
      excelFileName = '';
      _isLoading = true;
    });
    final url = site! + 'generateSalaryReport';
    // var currentdate = DateTime.now().microsecondsSinceEpoch;
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{"monthName": month}),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var exceldata = json.decode(response.body);
    print("Report...........??");
    print(exceldata['status']);
    if (exceldata['status'] == false) {
      setState(() {
        _isLoading = false;
        excelFileName = '';
      });
      Toast.show("No data found.",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: Colors.red);
    } else {
      setState(() {
        excelFileName = exceldata['url'];
        _isLoading = false;
      });
      Toast.show("Excel report generated.",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.primaryColor);
    }
  }

  void store() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      site = prefs.getString('site');
      personid = prefs.getString('personid');
      pic = prefs.getString('pic');
    });
  }

  getorganizationdropdown() async {
    setState(() {
      loader = true;
    });

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      site = prefs.getString('site');
    });

    final organizationurl = ((site ?? '') + 'getMonths');
    final organization = await http.get(
      Uri.parse(organizationurl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final response = jsonDecode(organization.body);
    print("Kya haiiiiiiiiii");
    print(response);
    if (mounted) {
      setState(() {
        organizationdata = response;
        loader = false;
      });
    }
  }

  DropdownButtonFormField textOrganization() {
    return DropdownButtonFormField<String>(
      decoration: AppStyles.textFieldInputDecoration
          .copyWith(hintText: "Month", counterText: ''),
      borderRadius: BorderRadius.circular(20),
      items: organizationdata
          .map((label) => DropdownMenuItem(
                child: Text(label['monthname'],
                    style: AppStyles.textInputTextStyle),
                value: label['monthvalue'].toString(),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          monthController = val!;
        });
      },
      // value: OrganizationController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an month.';
        }
        return null; // Return null if the input is valid.
      },
    );
  }

  contentBox(context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Send Report',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'HKGrotesk',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'HKGrotesk',
                                fontWeight: FontWeight.w400),
                          ),
                          style: TextStyle(
                              fontFamily: 'HKGrotesk',
                              fontSize: 15.0,
                              color: Colors.black),
                          onChanged: (val) {
                            setState(() {
                              receiverEmail = val;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                child: Text(
                                  'Sent',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'HKGrotesk',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'HKGrotesk',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath());

    print(_localPath);
    final savedDir = Directory(_localPath ?? '');
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return true;
  }

  Future<String> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/storage/emulated/0/download";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  downloadExcel() async {
    print(excelFileName);
    _permissionReady = await _checkPermission();
    if (_permissionReady!) {
      setState(() {
        _isDownloading = true;
      });
      print("BIKKIii");
      print(_localPath);
      await _prepareSaveDir();
      try {
        await Dio().download((excelFileName ?? ''),
            (_localPath ?? '') + "/" + (excelFileName ?? ''));
        setState(() {
          _isDownloading = false;
        });
        Toast.show("Excel Report Downloaded.",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.primaryColor);
      } catch (e) {
        setState(() {
          _isDownloading = false;
        });
        Toast.show("File not found.",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: Colors.red);
        print("Download Failed.\n\n" + e.toString());
      }
    }
  }

  Future<bool> redirectto() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => EmployeeList()),
        (Route<dynamic> route) => false);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: WillPopScope(
            // ignore: missing_return
            onWillPop: redirectto,
            child: Scaffold(
              backgroundColor: AppColors.appBackgroundColor,
              appBar: GautamAppBar(
                organization: "organizationtype",
                isBackRequired: true,
                memberId: "personid",
                imgPath: "",
                memberPic: pic,
                logo: "logo",
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => EmployeeList()),
                      (Route<dynamic> route) => false);
                },
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 10, left: 15, right: 10),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5),
                          const Text(
                            'Generate Salary Reports',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: appFontFamily,
                              color: AppColors.blueColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 50,
                              child: textOrganization(),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: InkWell(
                                  onTap: () {
                                    if (monthController == null ||
                                        monthController == '') {
                                      Toast.show(
                                        "Please select a month.",
                                        duration: Toast.lengthLong,
                                        gravity: Toast.center,
                                        backgroundColor: Colors.red,
                                      );
                                    } else {
                                      generateExcel(
                                        (monthController ?? ''),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    margin: const EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Generate',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              excelFileName != ''
                                  ? Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 0, 0),
                                      child: Row(
                                        children: [
                                          // IconButton(
                                          //   icon: Icon(Icons.download),
                                          //   onPressed: () {
                                          //     downloadExcel();
                                          //   },
                                          // ),
                                          IconButton(
                                            icon: const Icon(Icons.download),
                                            onPressed: () {
                                              UrlLauncher.launch(
                                                excelFileName ?? '',
                                              );
                                            },
                                          ),
                                          // IconButton(
                                          //   icon: const Icon(
                                          //       Icons.remove_red_eye_rounded),
                                          //   onPressed: () {
                                          //     UrlLauncher.launch(
                                          //       excelFileName ?? '',
                                          //     );
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          ),
                          _isLoading
                              ? const Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 20.0)),
                                      Text(
                                        'Generating...',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                )
                              : _isDownloading
                                  ? const Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 40.0)),
                                          Text(
                                            'Downloading...',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                            ),
                                          ),
                                          CircularProgressIndicator(),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 224, 163),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      WelcomePage()));
                        },
                        child: Image.asset(
                            home
                                ? AppAssets.icHomeSelected
                                : AppAssets.icHomeUnSelected,
                            height: 25)),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      EmployeeList()));
                        },
                        child: Image.asset(
                            user
                                ? AppAssets.imgSelectedPerson
                                : AppAssets.imgPerson,
                            height: 25)),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Attendance()));
                        },
                        child: Image.asset(
                            face
                                ? AppAssets.imgSelectedFace
                                : AppAssets.imgFace,
                            height: 25)),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PublicDrawer()));
                        },
                        child: Image.asset(
                            menu
                                ? AppAssets.imgSelectedMenu
                                : AppAssets.imgMenu,
                            height: 25)),
                  ],
                ),
              ),
            )));
  }
}
