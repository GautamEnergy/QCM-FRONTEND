import 'dart:convert';
import 'dart:io';
import 'package:QCM/CommonDrawer.dart';
import 'package:QCM/Fqc.dart';
import 'package:QCM/Ipqc.dart';
import 'package:QCM/Iqcp.dart';
import 'package:QCM/QualityList.dart';
import 'package:QCM/QualityPage.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_loader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/src/response.dart' as Response;
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/dialogs/city_list_model.dart';
import 'package:QCM/dialogs/dialog_role_city.dart';
import 'package:QCM/dialogs/dialog_role_state.dart';
import 'package:QCM/dialogs/state_list_model.dart';
import 'package:QCM/directory.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
import 'package:image_picker/image_picker.dart';
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

class QualityReport extends StatefulWidget {
  final String? id;
  QualityReport({this.id});
  _QualityReportState createState() => _QualityReportState();
}

class _QualityReportState extends State<QualityReport> {
  File? _image, personPreview;
  List<int>? personlogoBytes, pdfFileBytes, _imageBytes;
  List data = [];
  List statedata1 = [];
  List citydata1 = [];
  bool sameAsPresentAddress = false;
  final picker = ImagePicker();

  final _dio = Dio();
  // Response? _response;
  Response.Response? _response;
  String? fromdate,
      todate,
      _errorMessage,
      bloodGroupController,
      token,
      barcodeScanRes,
      issuetypeController,
      shiftController,
      reportingManagerController,
      modelNumberController,
      profilepicture,
      personLogoname,
      personid,
      designation,
      department,
      excelReport,
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

  // List departmentList = [
  //       {"key": "Wire Frame", "value": "Wire Frame"},
  //       {"key": "Breakdown", "value": "Breakdown"},
  //     ],
  List issueList = [],
      modelNumberList = [],
      reportingManagerList = [],
      shiftList = [
        {"key": "Day", "value": "Day"},
        {"key": "Night", "value": "Night"},
      ];

  SharedPreferences? prefs;
  TextEditingController fromdateController = new TextEditingController();
  TextEditingController todateController = new TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> qualityformKey = GlobalKey<FormState>();

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
      token = prefs.getString('token');
    });
  }

  Future<bool> redirectto() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PublicDrawer();
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
                memberId: personid,
                imgPath: "ImagePath",
                memberPic: pic,
                logo: "logo",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PublicDrawer();
                  }));
                },
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10, top: 15),
                child: _user(),
              ),
            )));
  }

  Future createData() async {
    setState(() {
      _isLoading = true;
    });
    print("whyyyyyyyyyyyyyyyyyyyy");

    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    print("Howwwwwwwwwwwwwwwwwwwww");
    print(site);
    final url = (site! + 'Quality/GetQualityReportExcel'); // Prod

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        "CurrentUser": personid ?? '',
        "FromDate": fromdate ?? '',
        "ToDate": todate ?? ''
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Resssssssss.....???");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      print(data['URL']);

      setState(() {
        excelReport = data['URL'];
        _isLoading = false;
      });

      Toast.show("Quality Report Generated Successfully.",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.primaryColor);
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (BuildContext context) => QualityList()),
      //     (Route<dynamic> route) => false);
    } else {
      setState(() {
        _isLoading = false;
      });
      Toast.show("Error on Server",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: Colors.redAccent);
    }
  }

  Widget _user() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: qualityformKey,
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
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.imgLogo,
                    height: 100,
                    width: 230,
                  ),
                ],
              ),
            ),

            const Center(
                child: Text("Generate Quality Reports",
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColors.black,
                        fontFamily: appFontFamily,
                        fontWeight: FontWeight.w700))),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(height: 10),
            Text(
              "From*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(height: 5),
            TextFormField(
                controller: fromdateController,
                readOnly: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: AppStyles.textFieldInputDecoration.copyWith(
                    hintText: "Please Enter From Date",
                    counterText: '',
                    suffixIcon: Image.asset(
                      AppAssets.icCalenderBlue,
                      color: AppColors.primaryColor,
                    )),
                style: AppStyles.textInputTextStyle,
                onTap: () async {
                  DateTime date = DateTime(2021);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime.now()))!;
                  fromdateController.text = DateFormat("EEE MMM dd, yyyy")
                      .format(DateTime.parse(date.toString()));
                  setState(() {
                    fromdate = DateFormat("dd-MM-yyyy")
                        .format(DateTime.parse(date.toString()));
                  });
                },
                validator: MultiValidator(
                    [RequiredValidator(errorText: "Please Enter From Date")])),

            const SizedBox(
              height: 15,
            ),
            Text(
              "To*",
              style: AppStyles.textfieldCaptionTextStyle,
            ),
            const SizedBox(height: 5),
            TextFormField(
                controller: todateController,
                readOnly: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: AppStyles.textFieldInputDecoration.copyWith(
                    hintText: "Please Enter To Date",
                    counterText: '',
                    suffixIcon: Image.asset(
                      AppAssets.icCalenderBlue,
                      color: AppColors.primaryColor,
                    )),
                style: AppStyles.textInputTextStyle,
                onTap: () async {
                  DateTime date = DateTime(2021);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime.now()))!;
                  todateController.text = DateFormat("EEE MMM dd, yyyy")
                      .format(DateTime.parse(date.toString()));
                  setState(() {
                    todate = DateFormat("dd-MM-yyyy")
                        .format(DateTime.parse(date.toString()));
                  });
                },
                validator: MultiValidator(
                    [RequiredValidator(errorText: "Please Enter To Date")])),
            const SizedBox(height: 15),

            const SizedBox(height: 30),

            AppButton(
              organization: (organizationtype ?? ''),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  fontSize: 16),
              onTap: () async {
                if (qualityformKey.currentState!.validate()) {
                  qualityformKey.currentState!.save();

                  createData();
                }
              },
              label: "Generate",
            ),
            SizedBox(height: 15),
            _isLoading
                ? const Center(
                    child: Column(children: [
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    Text('Generating...',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo)),
                    CircularProgressIndicator(),
                  ]))
                : excelReport != '' && excelReport != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              UrlLauncher.launch(excelReport!);
                            },
                            child: Icon(
                              Icons.download,
                              color: AppColors.redColor,
                              size: 62,
                            ),
                          ),
                        ),
                      )
                    : Container(),
            const Divider(),
          ],
        ));
  }
}
