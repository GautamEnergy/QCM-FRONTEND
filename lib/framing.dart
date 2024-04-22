import 'dart:convert';

import 'package:QCM/Ipqc.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_fonts.dart';
import 'package:QCM/constant/app_helper.dart';
import 'package:QCM/constant/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class framing extends StatefulWidget {
  final String? id;
  framing({this.id});
  @override
  _framingState createState() => _framingState();
}

class _framingState extends State<framing> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();

  TextEditingController Sample1Controller = TextEditingController();

  TextEditingController Sample1GlueController = TextEditingController();
  TextEditingController Sample1x1Controller = TextEditingController();
  TextEditingController Sample1x2Controller = TextEditingController();
  TextEditingController Sample1y1Controller = TextEditingController();
  TextEditingController Sample1y2Controller = TextEditingController();
  TextEditingController Sample1L1Controller = TextEditingController();
  TextEditingController Sample1L2Controller = TextEditingController();
  TextEditingController Sample1W1Controller = TextEditingController();
  TextEditingController Sample1W2Controller = TextEditingController();

  TextEditingController Sample2Controller = TextEditingController();

  TextEditingController Sample2GlueController = TextEditingController();
  TextEditingController Sample2x1Controller = TextEditingController();
  TextEditingController Sample2x2Controller = TextEditingController();
  TextEditingController Sample2y1Controller = TextEditingController();
  TextEditingController Sample2y2Controller = TextEditingController();
  TextEditingController Sample2L1Controller = TextEditingController();
  TextEditingController Sample2L2Controller = TextEditingController();
  TextEditingController Sample2W1Controller = TextEditingController();
  TextEditingController Sample2W2Controller = TextEditingController();

  TextEditingController Sample3Controller = TextEditingController();

  TextEditingController Sample3GlueController = TextEditingController();
  TextEditingController Sample3x1Controller = TextEditingController();
  TextEditingController Sample3x2Controller = TextEditingController();
  TextEditingController Sample3y1Controller = TextEditingController();
  TextEditingController Sample3y2Controller = TextEditingController();
  TextEditingController Sample3L1Controller = TextEditingController();
  TextEditingController Sample3L2Controller = TextEditingController();
  TextEditingController Sample3W1Controller = TextEditingController();
  TextEditingController Sample3W2Controller = TextEditingController();

  TextEditingController Sample4Controller = TextEditingController();

  TextEditingController Sample4GlueController = TextEditingController();
  TextEditingController Sample4x1Controller = TextEditingController();
  TextEditingController Sample4x2Controller = TextEditingController();
  TextEditingController Sample4y1Controller = TextEditingController();
  TextEditingController Sample4y2Controller = TextEditingController();
  TextEditingController Sample4L1Controller = TextEditingController();
  TextEditingController Sample4L2Controller = TextEditingController();
  TextEditingController Sample4W1Controller = TextEditingController();
  TextEditingController Sample4W2Controller = TextEditingController();

  TextEditingController Sample5Controller = TextEditingController();

  TextEditingController Sample5GlueController = TextEditingController();
  TextEditingController Sample5x1Controller = TextEditingController();
  TextEditingController Sample5x2Controller = TextEditingController();
  TextEditingController Sample5y1Controller = TextEditingController();
  TextEditingController Sample5y2Controller = TextEditingController();
  TextEditingController Sample5L1Controller = TextEditingController();
  TextEditingController Sample5L2Controller = TextEditingController();
  TextEditingController Sample5W1Controller = TextEditingController();
  TextEditingController Sample5W2Controller = TextEditingController();

  bool menu = false, user = false, face = false, home = false;
  int numberOfStringers = 0;
  bool _isLoading = false;
  String setPage = '', pic = '', site = '', personid = '';
  String invoiceDate = '';
  String date = '';
  String sendStatus = '';
  String dateOfQualityCheck = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;
  String? selectedShift;
  String status = '',
      framingId = '',
      approvalStatus = "Approved",
      designation = '',
      token = '',
      department = '';
  // final _dio = Dio();
  //List data = [];

  //Response.Response? _response;

  @override
  void initState() {
    super.initState();
    store(); // Set initial value
  }

  // ****************************************  Send the Data where will be Used ro Backend **************************
  // Future<void> sendDataToBackend() async {
  //   final url =
  //       'your-backend-url'; // Replace 'your-backend-url' with your actual backend URL

  //   // Gather data from text controllers
  //   final data = {
  //     'DocNo': 'GSPL/IPQC/AF/011',
  //     'RevNo': '1.0/12.08.2023',
  //     'Date': dateController.text,
  //     'Shift': shiftController.text,
  //     'samples': [
  //       {
  //         'Sample': Sample1Controller.text,
  //         'FramingObservation': Sample1GlueController.text,
  //         'FramingDimension': {
  //           'x1': Sample1x1Controller.text,
  //           'x2': Sample1x2Controller.text,
  //           'y1': Sample1y1Controller.text,
  //           'y2': Sample1y2Controller.text,
  //           'l1': Sample1L1Controller.text,
  //           'l2': Sample1L2Controller.text,
  //           'w1': Sample1W1Controller.text,
  //           'w2': Sample1W2Controller.text
  //         }
  //       },
  //       {
  //         'Sample': Sample2Controller.text,
  //         'FramingObservation': Sample2GlueController.text,
  //         'FramingDimension': {
  //           'x1': Sample2x1Controller.text,
  //           'x2': Sample2x2Controller.text,
  //           'y1': Sample2y1Controller.text,
  //           'y2': Sample2y2Controller.text,
  //           'l1': Sample2L1Controller.text,
  //           'l2': Sample2L2Controller.text,
  //           'w1': Sample2W1Controller.text,
  //           'w2': Sample2W2Controller.text
  //         }
  //       },
  //       {
  //         'Sample': Sample3Controller.text,
  //         'FramingObservation': Sample3GlueController.text,
  //         'FramingDimension': {
  //           'x1': Sample3x1Controller.text,
  //           'x2': Sample3x2Controller.text,
  //           'y1': Sample3y1Controller.text,
  //           'y2': Sample3y2Controller.text,
  //           'l1': Sample3L1Controller.text,
  //           'l2': Sample3L2Controller.text,
  //           'w1': Sample3W1Controller.text,
  //           'w2': Sample3W2Controller.text
  //         }
  //       },
  //       {
  //         'Sample': Sample4Controller.text,
  //         'FramingObservation': Sample4GlueController.text,
  //         'FramingDimension': {
  //           'x1': Sample4x1Controller.text,
  //           'x2': Sample4x2Controller.text,
  //           'y1': Sample4y1Controller.text,
  //           'y2': Sample4y2Controller.text,
  //           'l1': Sample4L1Controller.text,
  //           'l2': Sample4L2Controller.text,
  //           'w1': Sample4W1Controller.text,
  //           'w2': Sample4W2Controller.text
  //         }
  //       },
  //       {
  //         'Sample': Sample5Controller.text,
  //         'FramingObservation': Sample5GlueController.text,
  //         'FramingDimension': {
  //           'x1': Sample5x1Controller.text,
  //           'x2': Sample5x2Controller.text,
  //           'y1': Sample5y1Controller.text,
  //           'y2': Sample5y2Controller.text,
  //           'l1': Sample5L1Controller.text,
  //           'l2': Sample5L2Controller.text,
  //           'w1': Sample5W1Controller.text,
  //           'w2': Sample5W2Controller.text
  //         }
  //       },
  //     ],
  //   };
  //   print('$data');
  //   print('Kulbhushan Singh');
  // }
  void store() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pic = prefs.getString('pic')!;
      personid = prefs.getString('personid')!;
      site = prefs.getString('site')!;
      designation = prefs.getString('designation')!;
      department = prefs.getString('department')!;
      token = prefs.getString('token')!;
    });
    _get();
  }

  Future _get() async {
    final prefs = await SharedPreferences.getInstance();
    print("Kullllllllllllllllllllllllllllllllllllll");
    print(widget.id);
    setState(() {
      if (widget.id != '' && widget.id != null) {
        _isLoading = true;
      }
      site = prefs.getString('site')!;
    });
    final AllSolarData = ((site!) + 'IPQC/GetSpecificeJobCard');
    final allSolarData = await http.post(
      Uri.parse(AllSolarData),
      body: jsonEncode(<String, String>{
        "JobCardDetailId": widget.id ?? '',
        "token": token!
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    setState(() {
      _isLoading = false;
    });
    print("hhhhhhhhhhhhhhhh");
    var resBody = json.decode(allSolarData.body);

    if (mounted) {
      setState(() {
        if (resBody != '') {
          print(resBody['response']);
          print(resBody['response']['Date']);
          // print(resBody['response']['Visual Inspection & Laminator Description']
          //     ["Cycle_Time"]);

          print("saiffffffffffffffffffffffffffffffffffffffffff");
          print("kulllllllllllllllllllllllllllllllllllllllllll");
          // dateController.text = resBody['response']['Date'] ?? '';
          // status = resBody['response']['Status'] ?? '';
          // jobCardDate = resBody['response']['Date'] ?? '';
          // dateController.text = resBody['response']['Date'] != ''
          //     ? DateFormat("EEE MMM dd, yyyy").format(
          //         DateTime.parse(resBody['response']['Date'].toString()))
          //     : '';
          // moduleTypeController.text = resBody['response']['ModuleType'] ?? '';

          // matrixSizeController.text = resBody['response']['MatrixSize'] ?? '';
          // moduleNoController.text = resBody['response']['ModuleNo'] ?? '';
          // lotNoController.text =
          //     resBody['response']['Glass Washing Description']["Lot_No"] ?? '';
        }
      });
    }
  }

  // Future setApprovalStatus() async {
  //   print("kyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  //   print(approvalStatus);
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   FocusScope.of(context).unfocus();
  //   print("goooooooooooooooooooooooooooooooooooooooooooooooo");

  //   final url = (site! + "IPQC/UpdateJobCardStatus");

  //   var params = {
  //     "token": token,
  //     "CurrentUser": personid,
  //     "ApprovalStatus": approvalStatus,
  //     "JobCardDetailId": widget.id ?? ""
  //   };

  //   var response = await http.post(
  //     Uri.parse(url),
  //     body: json.encode(params),
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     var objData = json.decode(response.body);
  //     if (objData['success'] == false) {
  //       Toast.show("Please Try Again.",
  //           duration: Toast.lengthLong,
  //           gravity: Toast.center,
  //           backgroundColor: AppColors.redColor);
  //     } else {
  //       Toast.show("Job Card Test $approvalStatus .",
  //           duration: Toast.lengthLong,
  //           gravity: Toast.center,
  //           backgroundColor: AppColors.blueColor);
  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
  //           builder: (BuildContext context) => IpqcTestList()));
  //     }
  //   } else {
  //     Toast.show("Error In Server",
  //         duration: Toast.lengthLong, gravity: Toast.center);
  //   }
  // }

  // Future<void> _pickReferencePDF() async {
  //   print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );

  //   if (result != null) {
  //     File pdffile = File(result.files.single.path!);
  //     setState(() {
  //       referencePdfFileBytes = pdffile.readAsBytesSync();
  //       referencePdfController.text = result.files.single.name;
  //     });
  //   } else {
  //     // User canceled the file picker
  //   }
  // }

  Future createData() async {
    print("Naveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeen");
    //print(jobCardDate);
    var data = {
      "Type": "Job Card",
      "PreLamDetailId": framingId != '' && framingId != null
          ? framingId
          : widget.id != '' && widget.id != null
              ? widget.id
              : '',
      "Type": "Framing",
      "CurrentUser": personid,
      "Status": sendStatus,
      'DocNo': 'GSPL/IPQC/AF/011',
      'RevNo': '1.0/12.08.2023',
      'Date': dateController.text,
      'Shift': shiftController.text,
      'samples': [
        {
          'Sample': Sample1Controller.text,
          'FramingObservation': Sample1GlueController.text,
          'FramingDimension': {
            'x1': Sample1x1Controller.text,
            'x2': Sample1x2Controller.text,
            'y1': Sample1y1Controller.text,
            'y2': Sample1y2Controller.text,
            'l1': Sample1L1Controller.text,
            'l2': Sample1L2Controller.text,
            'w1': Sample1W1Controller.text,
            'w2': Sample1W2Controller.text
          }
        },
        {
          'Sample': Sample2Controller.text,
          'FramingObservation': Sample2GlueController.text,
          'FramingDimension': {
            'x1': Sample2x1Controller.text,
            'x2': Sample2x2Controller.text,
            'y1': Sample2y1Controller.text,
            'y2': Sample2y2Controller.text,
            'l1': Sample2L1Controller.text,
            'l2': Sample2L2Controller.text,
            'w1': Sample2W1Controller.text,
            'w2': Sample2W2Controller.text
          }
        },
        {
          'Sample': Sample3Controller.text,
          'FramingObservation': Sample3GlueController.text,
          'FramingDimension': {
            'x1': Sample3x1Controller.text,
            'x2': Sample3x2Controller.text,
            'y1': Sample3y1Controller.text,
            'y2': Sample3y2Controller.text,
            'l1': Sample3L1Controller.text,
            'l2': Sample3L2Controller.text,
            'w1': Sample3W1Controller.text,
            'w2': Sample3W2Controller.text
          }
        },
        {
          'Sample': Sample4Controller.text,
          'FramingObservation': Sample4GlueController.text,
          'FramingDimension': {
            'x1': Sample4x1Controller.text,
            'x2': Sample4x2Controller.text,
            'y1': Sample4y1Controller.text,
            'y2': Sample4y2Controller.text,
            'l1': Sample4L1Controller.text,
            'l2': Sample4L2Controller.text,
            'w1': Sample4W1Controller.text,
            'w2': Sample4W2Controller.text
          }
        },
        {
          'Sample': Sample5Controller.text,
          'FramingObservation': Sample5GlueController.text,
          'FramingDimension': {
            'x1': Sample5x1Controller.text,
            'x2': Sample5x2Controller.text,
            'y1': Sample5y1Controller.text,
            'y2': Sample5y2Controller.text,
            'l1': Sample5L1Controller.text,
            'l2': Sample5L2Controller.text,
            'w1': Sample5W1Controller.text,
            'w2': Sample5W2Controller.text
          }
        },
      ],
    };
    print('$data');
    print('Kulbhushan Singh');

    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    final url = (site! + "IPQC/AddFraming");

    final prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Saif bhai");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var objData = json.decode(response.body);
      setState(() {
        framingId = objData['UUID'];

        _isLoading = false;
      });

      print(
          "RESPONSHTEEEEEEEEEEEEEEEEEEEEEEEEEHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
      print(objData['UUID']);
      if (objData['success'] == false) {
        Toast.show(objData['message'],
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      } else {
        if (sendStatus == 'Pending') {
          // uploadPDF((referencePdfFileBytes ?? []));
        } else {
          Toast.show("Data has been saved.",
              duration: Toast.lengthLong,
              gravity: Toast.center,
              backgroundColor: AppColors.blueColor);
        }
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
  }

  // ***************** Done Send the Data *******************************
  Widget _getFAB() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: FloatingActionButton(
        onPressed: () {
          if (status != 'Pending') {
            setState(() {
              sendStatus = 'Inprogress';
            });
            createData();
          }
        },
        child: ClipOval(
          child: Image.asset(
            AppAssets.save,
            height: 70,
            width: 60,
          ),
        ),
      ),
    );
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
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          appBar: GautamAppBar(
            organization: "organizationtype",
            isBackRequired: true,
            memberId: "personid",
            imgPath: "ImagePath",
            memberPic: pic,
            logo: "logo",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return IpqcPage();
              }));
            },
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: setPage == ''
                ? Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: _registerFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets.imgLogo,
                                            height: 100,
                                            width: 230,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Framing Dimension Measurement Checksheet",
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Color.fromARGB(255, 8, 8, 8),
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),

                              // **************** Document Number *******************
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Document No : ',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'GSPL/IPQC/AF/011',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                ],
                              ),

                              // *************************** Revisional Number ********************
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rev.No./Dated : ',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Ver.1.0 & 12-08-2023',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                ],
                              ),

// ****************** Date *****************************************
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Date",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: dateController,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Date",
                                  counterText: '',
                                  suffixIcon: Icon(Icons.calendar_month),
                                ),
                                style: AppStyles.textInputTextStyle,
                                onTap: () async {
                                  DateTime date = DateTime(2021);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  date = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now(),
                                  ))!;
                                  dateController.text =
                                      DateFormat("EEE MMM dd, yyyy").format(
                                    DateTime.parse(date.toString()),
                                  );
                                  setState(() {
                                    dateOfQualityCheck =
                                        DateFormat("yyyy-MM-dd").format(
                                      DateTime.parse(date.toString()),
                                    );
                                  });
                                },
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Date",
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),

                              // ************************************* Shift *********************
                              Text(
                                "Shift",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              DropdownButtonFormField<String>(
                                value: selectedShift,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedShift = newValue!;
                                    shiftController.text = selectedShift!;
                                  });
                                },
                                items: <String>[
                                  'Night Shift',
                                  'Day Shift'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Select Shift",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly:
                                //     status == 'Pending' && designation != "QC"
                                //         ? true
                                //         : false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Select Shift";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
//  *******************************************   Sample  ********************

                              const SizedBox(
                                height: 15,
                              ),
                              const Center(
                                child: Text(
                                  "Sample 1",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 250, 4, 4),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter Module ID",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

//  *******************************************  START THE STRINGER 1  ********************

                              const SizedBox(
                                height: 15,
                              ),
                              const Center(
                                child: Text(
                                  "Framing Observation(v)/(x)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 21, 219, 51),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Glue Uniformity & countinuity in frame groove",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1GlueController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              const Center(
                                child: Text(
                                  "Framing Dimension(mm)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 21, 219, 51),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Mounting Hole x1 pitch",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1x1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Mounting Hole x2 pitch",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1x2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Mounting Hole y1 pitch",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1y1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Mounting Hole y2 pitch",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1y2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Length L1",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1L1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Length L2",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1L2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Width w1",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1W1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Width w2",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Sample1W2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Detail's",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly:
                                    status == 'Pending' && designation != "QC"
                                        ? true
                                        : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Supplier",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

// ------------------------------------------------   END OF THE HEADER -----------------------------------------
                              // Center(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: InkWell(
                              //       onTap: () {
                              //         // Navigator.of(context).pushReplacement(
                              //         //     MaterialPageRoute(
                              //         //         builder: (BuildContext context) =>
                              //         //             LoginPage(
                              //         //                 appName: widget.appName)));
                              //       },
                              //       child: Text(
                              //         "BACK",
                              //         style: TextStyle(
                              //           fontFamily: appFontFamily,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //           color: AppColors.redColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              _isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : AppButton(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                      onTap: () {
                                        AppHelper.hideKeyboard(context);
                                        createData(); //500

                                        // _registerFormKey.currentState!.save;
                                        // if (_registerFormKey.currentState!
                                        //     .validate()) {
                                        //   sendDataToBackend();
                                        // }
                                        setState(() {
                                          setPage = "sample2";
                                        });
                                        print("Page set");
                                        print(setPage);
                                      },
                                      label: "Next",
                                      organization: '',
                                    ),

                              const SizedBox(
                                height: 35,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Powered By Gautam Solar Pvt. Ltd.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: appFontFamily,
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : setPage == "sample2"
                    ? Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            child: Form(
                              key: _registerFormKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AppAssets.imgLogo,
                                                height: 100,
                                                width: 230,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Framing Dimension Measurement Checksheet",
                                        style: TextStyle(
                                          fontSize: 27,
                                          color: Color.fromARGB(255, 8, 8, 8),
                                          fontFamily: appFontFamily,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // **************** Document Number *******************
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Document No : ',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'GSPL/IPQC/AF/011',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),

                                  // *************************** Revisional Number ********************
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rev.No./Dated : ',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Ver.1.0 & 12-08-2023',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),
//  *******************************************   Sample  ********************

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Sample 2",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 250, 4, 4),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter Module ID",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

//  *******************************************  START THE STRINGER 1  ********************

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Framing Observation(v)/(x)",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 21, 219, 51),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Glue Uniformity & countinuity in frame groove",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2GlueController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Framing Dimension(mm)",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 21, 219, 51),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Mounting Hole x1 pitch",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2x1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Mounting Hole x2 pitch",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2x2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Mounting Hole y1 pitch",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2y1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Mounting Hole y2 pitch",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2y2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Length L1",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2L1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  Text(
                                    "Length L2",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2L2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  Text(
                                    "Width w1",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2W1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Width w2",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: Sample2W2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Detail's",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: status == 'Pending' &&
                                            designation != "QC"
                                        ? true
                                        : false,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter Supplier",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

// ------------------------------------------------   END OF THE HEADER -----------------------------------------
                                  // Center(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //         // Navigator.of(context).pushReplacement(
                                  //         //     MaterialPageRoute(
                                  //         //         builder: (BuildContext context) =>
                                  //         //             LoginPage(
                                  //         //                 appName: widget.appName)));
                                  //       },
                                  //       child: Text(
                                  //         "BACK",
                                  //         style: TextStyle(
                                  //           fontFamily: appFontFamily,
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: AppColors.redColor,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                  _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : AppButton(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                          onTap: () {
                                            AppHelper.hideKeyboard(context);
                                            createData(); //100

                                            // _registerFormKey.currentState!.save;
                                            // if (_registerFormKey.currentState!
                                            //     .validate()) {
                                            //   sendDataToBackend();
                                            // }
                                            setState(() {
                                              setPage = "sample3";
                                            });
                                            print("Page set");
                                            print(setPage);
                                          },
                                          label: "Next",
                                          organization: '',
                                        ),

                                  const SizedBox(
                                    height: 25,
                                  ),

                                  // Back button
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            setPage = '';
                                          });
                                          // Navigator.of(context).pushReplacement(
                                          //     MaterialPageRoute(
                                          //         builder: (BuildContext context) =>
                                          //             LoginPage(
                                          //                 appName: widget.appName)));
                                        },
                                        child: const Text(
                                          "BACK",
                                          style: TextStyle(
                                              fontFamily: appFontFamily,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.redColor),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Powered By Gautam Solar Pvt. Ltd.",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: appFontFamily,
                                            color: AppColors.greyColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : setPage == "sample3"
                        ? Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              SingleChildScrollView(
                                child: Form(
                                  key: _registerFormKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AppAssets.imgLogo,
                                                    height: 100,
                                                    width: 230,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Framing Dimension Measurement Checksheet",
                                            style: TextStyle(
                                              fontSize: 27,
                                              color:
                                                  Color.fromARGB(255, 8, 8, 8),
                                              fontFamily: appFontFamily,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // **************** Document Number *******************
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Document No : ',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'GSPL/IPQC/AF/011',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),

                                      // *************************** Revisional Number ********************
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rev.No./Dated : ',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Ver.1.0 & 12-08-2023',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),
//  *******************************************   Sample  ********************

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Center(
                                        child: Text(
                                          "Sample 3",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 250, 4, 4),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter Module ID",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

//  *******************************************  START THE STRINGER 1  ********************

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Center(
                                        child: Text(
                                          "Framing Observation(v)/(x)",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 21, 219, 51),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Glue Uniformity & countinuity in frame groove",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3GlueController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Center(
                                        child: Text(
                                          "Framing Dimension(mm)",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 21, 219, 51),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting Hole x1 pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3x1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting Hole x2 pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3x2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting Hole y1 pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3y1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting Hole y2 pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3y2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Length L1",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3L1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                        "Length L2",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3L2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                        "Width w1",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3W1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Width w2",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: Sample3W2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Detail's",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: status == 'Pending' &&
                                                designation != "QC"
                                            ? true
                                            : false,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Supplier",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

// ------------------------------------------------   END OF THE HEADER -----------------------------------------
                                      // Center(
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: InkWell(
                                      //       onTap: () {
                                      //         // Navigator.of(context).pushReplacement(
                                      //         //     MaterialPageRoute(
                                      //         //         builder: (BuildContext context) =>
                                      //         //             LoginPage(
                                      //         //                 appName: widget.appName)));
                                      //       },
                                      //       child: Text(
                                      //         "BACK",
                                      //         style: TextStyle(
                                      //           fontFamily: appFontFamily,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w500,
                                      //           color: AppColors.redColor,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                      _isLoading
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : AppButton(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.white,
                                                fontSize: 16,
                                              ),
                                              onTap: () {
                                                AppHelper.hideKeyboard(context);
                                                createData(); //200

                                                // _registerFormKey.currentState!.save;
                                                // if (_registerFormKey.currentState!
                                                //     .validate()) {
                                                //   sendDataToBackend();
                                                // }
                                                setState(() {
                                                  setPage = "sample4";
                                                });
                                                print("Page set");
                                                print(setPage);
                                              },
                                              label: "Next",
                                              organization: '',
                                            ),

                                      const SizedBox(
                                        height: 25,
                                      ),
                                      // Back button
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                setPage = 'sample2';
                                              });
                                              // Navigator.of(context).pushReplacement(
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext context) =>
                                              //             LoginPage(
                                              //                 appName: widget.appName)));
                                            },
                                            child: const Text(
                                              "BACK",
                                              style: TextStyle(
                                                  fontFamily: appFontFamily,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.redColor),
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Powered By Gautam Solar Pvt. Ltd.",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: appFontFamily,
                                                color: AppColors.greyColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : setPage == "sample4"
                            ? Stack(
                                alignment: Alignment.center,
                                fit: StackFit.expand,
                                children: [
                                  SingleChildScrollView(
                                    child: Form(
                                      key: _registerFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        AppAssets.imgLogo,
                                                        height: 100,
                                                        width: 230,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                "Framing Dimension Measurement Checksheet",
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  color: Color.fromARGB(
                                                      255, 8, 8, 8),
                                                  fontFamily: appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),

                                          // **************** Document Number *******************
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Document No : ',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'GSPL/IPQC/AF/011',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                            ],
                                          ),

                                          // *************************** Revisional Number ********************
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rev.No./Dated : ',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Ver.1.0 & 12-08-2023',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                            ],
                                          ),

//  *******************************************   Sample 4  ********************

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Center(
                                            child: Text(
                                              "Sample 4",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 250, 4, 4),
                                                fontFamily: appFontFamily,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter Module ID",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

//  *******************************************  START THE STRINGER 1  ********************

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Center(
                                            child: Text(
                                              "Framing Observation(v)/(x)",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 21, 219, 51),
                                                fontFamily: appFontFamily,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Glue Uniformity & countinuity in frame groove",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4GlueController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Center(
                                            child: Text(
                                              "Framing Dimension(mm)",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 21, 219, 51),
                                                fontFamily: appFontFamily,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mounting Hole x1 pitch",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4x1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mounting Hole x2 pitch",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4x2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mounting Hole y1 pitch",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4y1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Mounting Hole y2 pitch",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4y2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Length L1",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4L1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          Text(
                                            "Length L2",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4L2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          Text(
                                            "Width w1",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4W1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Width w2",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: Sample4W2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Detail's",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: status == 'Pending' &&
                                                    designation != "QC"
                                                ? true
                                                : false,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Supplier",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

// ------------------------------------------------   END OF THE HEADER -----------------------------------------
                                          // Center(
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: InkWell(
                                          //       onTap: () {
                                          //         // Navigator.of(context).pushReplacement(
                                          //         //     MaterialPageRoute(
                                          //         //         builder: (BuildContext context) =>
                                          //         //             LoginPage(
                                          //         //                 appName: widget.appName)));
                                          //       },
                                          //       child: Text(
                                          //         "BACK",
                                          //         style: TextStyle(
                                          //           fontFamily: appFontFamily,
                                          //           fontSize: 16,
                                          //           fontWeight: FontWeight.w500,
                                          //           color: AppColors.redColor,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0)),
                                          _isLoading
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : AppButton(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.white,
                                                    fontSize: 16,
                                                  ),
                                                  onTap: () {
                                                    AppHelper.hideKeyboard(
                                                        context);
                                                    createData(); //300

                                                    // _registerFormKey.currentState!.save;
                                                    // if (_registerFormKey.currentState!
                                                    //     .validate()) {
                                                    //   sendDataToBackend();
                                                    // }
                                                    setState(() {
                                                      setPage = "sample5";
                                                    });
                                                    print("Page set");
                                                    print(setPage);
                                                  },
                                                  label: "Next",
                                                  organization: '',
                                                ),

                                          const SizedBox(
                                            height: 25,
                                          ),
                                          // Back button
                                          // const SizedBox(
                                          //   height: 15,
                                          // ),
                                          // AppButton(
                                          //   textStyle: const TextStyle(
                                          //     fontWeight: FontWeight.w700,
                                          //     color: AppColors.white,
                                          //     fontSize: 16,
                                          //   ),
                                          //   onTap: () {
                                          //     AppHelper.hideKeyboard(context);

                                          //     setState(() {
                                          //       setPage = 'sample3';
                                          //     });
                                          //     print("Page set");
                                          //     print(setPage);
                                          //   },
                                          //   label: "Back",
                                          //   organization: '',
                                          // ),
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    setPage = 'sample3';
                                                  });
                                                  // Navigator.of(context).pushReplacement(
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) =>
                                                  //             LoginPage(
                                                  //                 appName: widget.appName)));
                                                },
                                                child: const Text(
                                                  "BACK",
                                                  style: TextStyle(
                                                      fontFamily: appFontFamily,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.redColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Powered By Gautam Solar Pvt. Ltd.",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: appFontFamily,
                                                    color: AppColors.greyColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : setPage == "sample5"
                                ? Stack(
                                    alignment: Alignment.center,
                                    fit: StackFit.expand,
                                    children: [
                                      SingleChildScrollView(
                                        child: Form(
                                          key: _registerFormKey,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            AppAssets.imgLogo,
                                                            height: 100,
                                                            width: 230,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Center(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    "Framing Dimension Measurement Checksheet",
                                                    style: TextStyle(
                                                      fontSize: 27,
                                                      color: Color.fromARGB(
                                                          255, 8, 8, 8),
                                                      fontFamily: appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // **************** Document Number *******************
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Document No : ',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'GSPL/IPQC/AF/011',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                ],
                                              ),

                                              // *************************** Revisional Number ********************
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Rev.No./Dated : ',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Ver.1.0 & 12-08-2023',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                ],
                                              ),
//  *******************************************   Sample  ********************

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Center(
                                                child: Text(
                                                  "Sample 5",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 250, 4, 4),
                                                    fontFamily: appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText: "Enter Module ID",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

//  *******************************************  START THE STRINGER 1  ********************

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Center(
                                                child: Text(
                                                  "Framing Observation(v)/(x)",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 21, 219, 51),
                                                    fontFamily: appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Glue Uniformity & countinuity in frame groove",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    Sample5GlueController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Center(
                                                child: Text(
                                                  "Framing Dimension(mm)",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 21, 219, 51),
                                                    fontFamily: appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Mounting Hole x1 pitch",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5x1Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Mounting Hole x2 pitch",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5x2Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Mounting Hole y1 pitch",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5y1Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Mounting Hole y2 pitch",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5y2Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Length L1",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5L1Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Text(
                                                "Length L2",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5L2Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Text(
                                                "Width w1",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5W1Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Width w2",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: Sample5W2Controller,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Enter the Detail's",
                                                  counterText: '',
                                                  fillColor: Color.fromARGB(
                                                      255, 215, 243, 207),
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Supplier",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

// ------------------------------------------------   END OF THE HEADER -----------------------------------------
                                              // Center(
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.all(8.0),
                                              //     child: InkWell(
                                              //       onTap: () {
                                              //         // Navigator.of(context).pushReplacement(
                                              //         //     MaterialPageRoute(
                                              //         //         builder: (BuildContext context) =>
                                              //         //             LoginPage(
                                              //         //                 appName: widget.appName)));
                                              //       },
                                              //       child: Text(
                                              //         "BACK",
                                              //         style: TextStyle(
                                              //           fontFamily: appFontFamily,
                                              //           fontSize: 16,
                                              //           fontWeight: FontWeight.w500,
                                              //           color: AppColors.redColor,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),

                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 0)),
                                              _isLoading
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                  : AppButton(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 16,
                                                      ),
                                                      onTap: () {
                                                        AppHelper.hideKeyboard(
                                                            context);
                                                        createData(); //400

                                                        // _registerFormKey.currentState!.save;
                                                        // if (_registerFormKey.currentState!
                                                        //     .validate()) {
                                                        //   sendDataToBackend();
                                                        // }
                                                        setState(() {
                                                          setPage =
                                                              "Done All Page's";
                                                        });
                                                        // print("Page set");
                                                        print(setPage);
                                                      },
                                                      label: "Save",
                                                      organization: '',
                                                    ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              // Back button
                                              // const SizedBox(
                                              //   height: 15,
                                              // ),
                                              // AppButton(
                                              //   textStyle: const TextStyle(
                                              //     fontWeight: FontWeight.w700,
                                              //     color: AppColors.white,
                                              //     fontSize: 16,
                                              //   ),
                                              //   onTap: () {
                                              //     AppHelper.hideKeyboard(
                                              //         context);

                                              //     setState(() {
                                              //       setPage = 'sample4';
                                              //     });
                                              //     print("Page set");
                                              //     print(setPage);
                                              //   },
                                              //   label: "Back",
                                              //   organization: '',
                                              // ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        setPage = 'sample4';
                                                      });
                                                      // Navigator.of(context).pushReplacement(
                                                      //     MaterialPageRoute(
                                                      //         builder: (BuildContext context) =>
                                                      //             LoginPage(
                                                      //                 appName: widget.appName)));
                                                    },
                                                    child: const Text(
                                                      "BACK",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              appFontFamily,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .redColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Powered By Gautam Solar Pvt. Ltd.",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            appFontFamily,
                                                        color:
                                                            AppColors.greyColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
          ),
          floatingActionButton: _getFAB(),
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 203, 19),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => WelcomePage()));
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
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) => AddEditProfile()));
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
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (BuildContext context) => Attendance()));
                    // },
                    child: Image.asset(
                        face
                            ? AppAssets.icSearchSelected
                            : AppAssets.icSearchUnSelected,
                        height: 25)),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (BuildContext context) => PublicDrawer()));
                    // },
                    child: Image.asset(
                        menu ? AppAssets.imgSelectedMenu : AppAssets.imgMenu,
                        height: 25)),
              ],
            ),
          ),
        );
      }),
    );
  }
}
