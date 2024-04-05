import 'dart:convert';
import 'dart:io';
import 'package:QCM/Ipqc.dart';
import 'package:QCM/Iqcp.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_loader.dart';
import 'package:dio/src/response.dart' as Response;
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/dialogs/city_list_model.dart';
import 'package:QCM/dialogs/dialog_role_city.dart';
import 'package:QCM/dialogs/dialog_role_state.dart';
import 'package:QCM/dialogs/state_list_model.dart';
import 'package:QCM/directory.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart' as email_validator;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'components/appbar.dart';
import 'constant/app_assets.dart';
import 'constant/app_color.dart';
import 'constant/app_fonts.dart';
import 'constant/app_strings.dart';
import 'constant/app_styles.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class AddEditProfile extends StatefulWidget {
  final String? id;
  AddEditProfile({this.id});
  _ScoreDetailsState createState() => _ScoreDetailsState();
}

class _ScoreDetailsState extends State<AddEditProfile> {
  File? _image, personPreview;
  List<int>? personlogoBytes, pdfFileBytes;
  List data = [];
  List statedata1 = [];
  List citydata1 = [];
  bool sameAsPresentAddress = false;

  final _dio = Dio();
  // Response? _response;
  Response.Response? _response;
  String? _genderType = 'Male',
      _employeementType = 'Internal',
      _maritalstatus = 'Married',
      bloodGroupController,
      PresentStateController,
      PresentCityController,
      PermanentStateController,
      PermanentCityController,
      departmentController,
      locationController,
      reportingManagerController,
      designationController,
      profilepicture,
      personLogoname,
      personid,
      designation,
      department,
      setpersonid,
      firstname,
      _selectedFileName,
      lastname,
      pic,
      ImagePath,
      logo,
      site,
      businessname,
      organizationtype,
      dobdate,
      dojdate,
      doidate,
      announcementId,
      endDate,
      announcementStatus;
  bool _isLoading = false;

  List bloodGroupList = [
    {"label": 'A+', "value": 'A+'},
    {"label": 'A-', "value": 'A-'},
    {"label": 'AB+', "value": 'AB+'},
    {"label": 'AB-', "value": 'AB-'},
    {"label": 'B+', "value": 'B+'},
    {"label": 'B-', "value": 'B-'},
    {"label": 'O+', "value": 'O+'},
    {"label": 'O-', "value": 'O-'},
  ];

  List departmentList = [],
      designationList = [],
      reportingManagerList = [],
      locationList = [];

  SharedPreferences? prefs;
  TextEditingController employeeIdController = new TextEditingController();
  TextEditingController loginIdController = new TextEditingController();
  TextEditingController fathernameController = TextEditingController();

  TextEditingController joblocationController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController officialMobileController = new TextEditingController();
  TextEditingController personalMobileController = new TextEditingController();
  TextEditingController officialEmailController = new TextEditingController();
  TextEditingController personalEmailController = new TextEditingController();
  TextEditingController presentFulladdressController = TextEditingController();
  TextEditingController _PresentStatecontroller = new TextEditingController();
  TextEditingController _PresentCitycontroller = new TextEditingController();
  TextEditingController PresentPinCodeController = new TextEditingController();

  TextEditingController permanentFulladdressController =
      TextEditingController();
  TextEditingController _PermanentStatecontroller = new TextEditingController();
  TextEditingController _PermanentCitycontroller = new TextEditingController();
  TextEditingController PermanentPinCodeController =
      new TextEditingController();

  TextEditingController doiController = new TextEditingController();
  TextEditingController dojController = new TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountNumberController = new TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController pannumberController = TextEditingController();
  TextEditingController branchaddressController = TextEditingController();
  TextEditingController familynameController = TextEditingController();
  TextEditingController familyrelationController = TextEditingController();
  TextEditingController familyaddressController = TextEditingController();
  TextEditingController familycontactnumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File pdffile = File(result.files.single.path!);
      setState(() {
        pdfFileBytes = pdffile.readAsBytesSync();
        _selectedFileName = result.files.single.name;
      });
    } else {
      // User canceled the file picker
    }
  }

  @override
  void initState() {
    store();
    getLocationData();
    getReportingManagerData();
    getDepartmentData();
    getDsignationData();

    super.initState();
  }

  void store() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      designation = prefs.getString('designation');
      department = prefs.getString('department');
      pic = prefs.getString('pic');
      personid = prefs.getString('personid');
      site = prefs.getString('site');
    });
  }

  Future<bool> redirectto() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WelcomePage();
    }));
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
        // ignore: deprecated_member_use
        child: WillPopScope(
            // ignore: missing_return
            onWillPop: redirectto,
            child: Scaffold(
              appBar: GautamAppBar(
                organization: "organizationtype",
                isBackRequired: true,
                memberId: "personid",
                imgPath: "ImagePath",
                memberPic: pic,
                logo: "logo",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return (department == 'IQCP' &&
                            designation != 'Super Admin')
                        ? IqcpPage()
                        : (department == 'IPQP' && designation != 'Super Admin')
                            ? IpqcPage()
                            : (department == 'FQCP' &&
                                    designation != 'Super Admin')
                                ? IqcpPage()
                                : WelcomePage();
                  }));
                },
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10, top: 15),
                child: _isLoading ? AppLoader() : _user(),
              ),
            )));
  }

  TextFormField textemployeeId() {
    return TextFormField(
      controller: employeeIdController,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: AppStyles.textFieldInputDecoration.copyWith(
          hintText: "Please Enter Employee Id",
          counterText: '',
          contentPadding: EdgeInsets.all(10)),
      style: AppStyles.textInputTextStyle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter employee id';
        }
        return null;
      },
      enabled: widget.id != '' && widget.id != null ? false : true,
    );
  }

  TextFormField textloginId() {
    return TextFormField(
      controller: loginIdController,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: AppStyles.textFieldInputDecoration.copyWith(
          hintText: "Please Enter Login Id",
          counterText: '',
          contentPadding: EdgeInsets.all(10)),
      style: AppStyles.textInputTextStyle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter login id';
        }
        return null;
      },
      enabled: widget.id != '' && widget.id != null ? false : true,
    );
  }

  TextFormField textJobLocation() {
    return TextFormField(
      controller: joblocationController,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.next,
      decoration: AppStyles.textFieldInputDecoration.copyWith(
          hintText: "Please Enter Work Location",
          counterText: '',
          contentPadding: EdgeInsets.all(10)),
      style: AppStyles.textInputTextStyle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter work location';
        }
        return null;
      },
    );
  }

  getReportingManagerData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    final url = (site! + 'getReportingManagers');
    print(url);
    http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (mounted) {
        var departmentBody = jsonDecode(response.body);
        setState(() {
          reportingManagerList = departmentBody['data'];
        });
        print(reportingManagerList);
      }
    });
  }

  DropdownButtonFormField textReportingManager() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Please Select Reporting Manager', // Add hint text here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      items: reportingManagerList
          .map((label) => DropdownMenuItem(
                child: Text(label['fullname'],
                    style: AppStyles.textInputTextStyle),
                value: label['personid'].toString(),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          reportingManagerController = val!;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a reporting manager';
        }
        return null; // Return null if validation succeeds
      },
      value:
          reportingManagerController != '' ? reportingManagerController : null,
    );
  }

  TextFormField textFullName() {
    return TextFormField(
      controller: fullnameController,
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.next,
      decoration: AppStyles.textFieldInputDecoration.copyWith(
          hintText: "Please Enter Full Name",
          counterText: '',
          contentPadding: EdgeInsets.all(10)),
      style: AppStyles.textInputTextStyle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter full name';
        }
        return null;
      },
    );
  }

  getDepartmentData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');

    final url = (site! + 'QCM//GetDepartmentList');

    http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (mounted) {
        var departmentBody = jsonDecode(response.body);
        setState(() {
          departmentList = departmentBody['data'];
        });
      }
    });
  }

  getDsignationData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');

    final url = (site! + 'QCM/GetDesignationList');

    http.get(
      Uri.parse(url),
      // body: jsonEncode(<String, String>{"departmentid": departmentId}),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (mounted) {
        var designationBody = jsonDecode(response.body);
        setState(() {
          designationList = designationBody['data'];
        });
      }
    });
  }

  getLocationData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');

    final url = (site! + 'QCM/GetWorkLocationList');

    http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (mounted) {
        var designationBody = jsonDecode(response.body);
        setState(() {
          locationList = designationBody['data'];
        });
      }
    });
  }

  // DropdownButtonFormField textLocation() {
  //   return DropdownButtonFormField<String>(
  //     decoration: InputDecoration(
  //       hintText: 'Please Select Work Location', // Add hint text here
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //     ),
  //     borderRadius: BorderRadius.circular(20),
  //     items: locationList
  //         .map((label) => DropdownMenuItem(
  //               child: Text(label['Location'],
  //                   style: AppStyles.textInputTextStyle),
  //               value: label['LocationID'].toString(),
  //             ))
  //         .toList(),
  //     onChanged: (val) {
  //       setState(() {
  //         locationController = val!;
  //       });
  //     },
  //     value: locationController != '' ? locationController : null,
  //   );
  // }
  DropdownButtonFormField textLocation() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Please Select Work Location',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      items: locationList
          .map((label) => DropdownMenuItem(
                child: Text(label['Location'],
                    style: AppStyles.textInputTextStyle),
                value: label['LocationID'].toString(),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          locationController = val!;
        });
      },
      value: locationController != '' ? locationController : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a work location';
        }
        return null; // Return null if the validation is successful
      },
    );
  }

  DropdownButtonFormField textDepartment() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Please Select Department', // Add hint text here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      items: departmentList
          .map((label) => DropdownMenuItem(
                child: Text(label['Department'],
                    style: AppStyles.textInputTextStyle),
                value: label['DepartmentID'].toString(),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          departmentController = val!;
        });
      },
      value: departmentController != '' ? departmentController : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a department';
        }
        return null; // Return null if the validation is successful
      },
    );
  }

  DropdownButtonFormField textDesignation() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: 'Please Select Designation', // Add hint text here
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      items: designationList
          .map((label) => DropdownMenuItem(
                child: Text(label['Designation'],
                    style: AppStyles.textInputTextStyle),
                value: label['DesignationID'].toString(),
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          designationController = val!;
        });
      },
      value: designationController != '' && designationController != null
          ? designationController
          : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a designation';
        }
        return null; // Return null if the validation is successful
      },
    );
  }

  Future createData(
    String employeeid,
    String loginid,
    String joblocation,
    String fullname,
    String department,
    String designation,
  ) async {
    setState(() {
      _isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');

    final url = (site! + 'Employee/Signup'); // Prod

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        "personid":
            widget.id != '' && widget.id != null ? widget.id.toString() : '',
        "employeeid": employeeid,
        "loginid": loginid,
        "joblocation": joblocation,
        "fullname": fullname,
        "department": department,
        "designation": designation,
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      //  pdfFileUpload((pdfFileBytes ?? []), (personLogoname ?? ''));
      var data = json.decode(response.body);

      setState(() {
        setpersonid = data['data'][0][0]['vPersonID'];
      });
      if (data['data'][0].length > 0) {
        upload((personlogoBytes ?? []), (personLogoname ?? ''));
        // pdfFileUpload((pdfFileBytes ?? []), (personLogoname ?? ''));
      }
    } else {
      Toast.show("Error on Server",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: Colors.redAccent);
    }
  }

  upload(List<int> bytes, String name) async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');

    var currentdate = DateTime.now().microsecondsSinceEpoch;
    var formData = FormData.fromMap({
      'personid': setpersonid,
      "Profile": MultipartFile.fromBytes(
        bytes,
        filename: (name + (currentdate.toString()) + '.jpg'),
        contentType: MediaType("image", 'jpg'),
      ),
    });

    _response = await _dio.post((site! + 'Employee/UploadProfileImg'), // Prod

        options: Options(
          contentType: 'multipart/form-data',
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        data: formData);

    try {
      if (_response!.data != null) {
        setState(() {
          _isLoading = false;
        });
        Toast.show("Employee registered successfully.",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.primaryColor);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
            (Route<dynamic> route) => false);
      }
    } catch (err) {
      print("Error");
    }
  }

  Widget _user() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListView(
          children: [
            // Padding(padding: EdgeInsets.only(top: 10)),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
              ),
            ),
            //  Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    widget.id != '' && widget.id != null
                        ? 'Edit Employee'
                        : 'Register Employee',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        fontFamily: appFontFamily,
                        color: AppColors.blueColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  personPreview != null
                      ? Center(
                          child: CircleAvatar(
                              radius: 50,
                              child: ClipOval(
                                  child: Image.file(
                                personPreview!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ))),
                        )
                      : profilepicture != ''
                          ? InkWell(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        type: FileType.image, withData: true);
                                CroppedFile? croppedprofilepicture =
                                    await ImageCropper().cropImage(
                                        cropStyle: CropStyle.circle,
                                        maxWidth: 300,
                                        compressFormat: ImageCompressFormat.jpg,
                                        sourcePath:
                                            (result!.files.single.path ?? ''),
                                        aspectRatio: const CropAspectRatio(
                                            ratioX: 9, ratioY: 9));
                                if (result != null) {
                                  var name = personalMobileController.text;
                                  setState(() {
                                    personPreview =
                                        File(croppedprofilepicture!.path);
                                  });
                                  if (result != null) {
                                    var _imageBytesOriginal =
                                        personPreview!.readAsBytesSync();
                                    personlogoBytes = await FlutterImageCompress
                                        .compressWithList(
                                      _imageBytesOriginal!,
                                      quality: 20,
                                    );

                                    // personlogoBytes =
                                    //     await croppedprofilepicture!
                                    //         .readAsBytes();

                                    personLogoname =
                                        personalMobileController.text;
                                  }
                                }
                              },
                              child: Center(
                                child: CircleAvatar(
                                  radius: 35,
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                    imageUrl: ((profilepicture ?? '')),
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) {
                                      return CircleAvatar(
                                        radius: 35,
                                        child: ClipOval(
                                          child: Image.asset(
                                            AppAssets.imgPlaceholder,
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return CircleAvatar(
                                        radius: 35,
                                        child: ClipOval(
                                          child: Image.asset(
                                            AppAssets.imgPlaceholder,
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                ),
                              ))
                          : InkWell(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                        type: FileType.image, withData: true);
                                CroppedFile? croppedprofilepicture =
                                    await ImageCropper().cropImage(
                                        cropStyle: CropStyle.circle,
                                        maxWidth: 300,
                                        compressFormat: ImageCompressFormat.jpg,
                                        sourcePath:
                                            (result!.files.single.path ?? ''),
                                        aspectRatio: const CropAspectRatio(
                                            ratioX: 9, ratioY: 9));

                                if (result != null) {
                                  var name = personalMobileController.text;
                                  setState(() {
                                    personPreview =
                                        File(croppedprofilepicture!.path);
                                  });
                                  if (result != null) {
                                    await croppedprofilepicture!.readAsBytes();
                                    personLogoname =
                                        personalMobileController.text;
                                  }
                                }
                              },
                              child: Center(
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: AppColors.blueColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Upload Profile Picture",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: appFontFamily,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                  const Padding(padding: EdgeInsets.only(left: 10.0)),
                ]),

            Text(
              "Employee Id*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            textemployeeId(),
            const SizedBox(
              height: 15,
            ),

            Text(
              "Login Id*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            textloginId(),
            const SizedBox(
              height: 15,
            ),

            Text(
              "Work Location*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(height: 5),
            textLocation(),
            const SizedBox(height: 15),

            Text(
              "Full Name*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(height: 5),
            textFullName(),

            const SizedBox(
              height: 15,
            ),

            Text(
              "Department*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            textDepartment(),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Designation*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),

            textDesignation(),
            const SizedBox(
              height: 15,
            ),

            const SizedBox(height: 30),
            AppButton(
              organization: (organizationtype ?? ''),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  fontSize: 16),
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  if (personlogoBytes != null && personlogoBytes != '') {
                    createData(
                        employeeIdController.text,
                        loginIdController.text,
                        locationController ?? "",
                        fullnameController.text,
                        departmentController ?? "",
                        designationController ?? "");
                  } else {
                    Toast.show("Please Upload Profile Picture.",
                        duration: Toast.lengthLong,
                        gravity: Toast.center,
                        backgroundColor: Colors.redAccent);
                  }
                }
              },
              label: AppStrings.SAVE,
            ),
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => WelcomePage()),
                        (Route<dynamic> route) => false);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: appFontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.redColor),
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
