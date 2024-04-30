import 'dart:convert';
// import 'dart:html';
import 'dart:io';

import 'package:QCM/CommonDrawer.dart';
import 'package:QCM/Ipqc.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_loader.dart';
import 'package:QCM/components/appbar.dart';
import 'package:QCM/ipqcTestList.dart';
import 'package:http_parser/http_parser.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:QCM/testingCard.dart';
import 'package:http/http.dart' as http;
import 'package:dio/src/response.dart' as Response;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_fonts.dart';
import 'package:QCM/constant/app_helper.dart';
import 'package:QCM/constant/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class solderingPeel extends StatefulWidget {
  final String? id;
  solderingPeel({this.id});
  @override
  _solderingPeelState createState() => _solderingPeelState();
}

class _solderingPeelState extends State<solderingPeel> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController LineController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController ribbonSizeController = TextEditingController();
  TextEditingController cellSizeController = TextEditingController();
  TextEditingController ribbonMakeController = TextEditingController();
  TextEditingController cellMakeController = TextEditingController();
  TextEditingController machineController = TextEditingController();
  TextEditingController ribbonController = TextEditingController();
  TextEditingController referencePdfController = new TextEditingController();

  List<TextEditingController> frontControllers = [];
  List<TextEditingController> backControllers = [];

  bool menu = false, user = false, face = false, home = false;
  int numberOfStringers = 0;
  bool _isLoading = false;
  String setPage = '', pic = '', site = '', personid = '';
  String invoiceDate = '';
  String date = '';
  String dateOfQualityCheck = '';
  List<int>? referencePdfFileBytes;
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;
  String? selectedShift;
  String? selectedtype;
  List Sample1Controllers = [];
  List Sample2Controllers = [];
  late String sendStatus;
  String status = '',
      jobCarId = '',
      approvalStatus = "Approved",
      designation = '',
      token = '',
      department = '';
  final _dio = Dio();
  List data = [];

  Response.Response? _response;

  void addfrontControllers(int count) {
    for (int i = 0; i < count; i++) {
      frontControllers.add(TextEditingController());
    }
  }

  void addbackControllers(int count) {
    for (int i = 0; i < count; i++) {
      backControllers.add(TextEditingController());
    }
  }

  @override
  void initState() {
    super.initState();
    isCycleTimeTrue = true; // Set initial value
    // setState(() {

    // });
  }

  Future<void> createData1() async {
    print(Sample1Controllers);
    print("kuch bhi");
    print(Sample2Controllers);

    final data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'line': LineController.text,
      'operator': operatorController.text,
      'ribbonSize': ribbonSizeController.text,
      'cellSize': cellSizeController.text,
      'ribbonMake': ribbonMakeController.text,
      'cellMake': cellMakeController.text,
      'machine': machineController.text,
      'ribbon': ribbonController.text,
    };

    print('$data');
  }

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
    print("Bhanuuuuuuuuuuuuuuuuuuuuuu");
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

          // // invoiceDateController.text = DateFormat("EEE MMM dd, yyyy").format(
          // //         DateTime.parse(dataMap[0]['InvoiceDate'].toString())) ??
          // //     '';
          // matrixSizeController.text = resBody['response']['MatrixSize'] ?? '';
          // moduleNoController.text = resBody['response']['ModuleNo'] ?? '';
          // lotNoController.text =
          //     resBody['response']['Glass Washing Description']["Lot_No"] ?? '';
          // lotSizeController.text =
          //     resBody['response']['Glass Washing Description']["size"] ?? '';
          // glassCommentController.text =
          //     resBody['response']['Glass Washing Comments'] ?? '';
          // evaLotNoController.text = resBody['response']
          //         ['Foil cutterr Description']["EVA_Lot_No"] ??
          //     '';
          // evaSizeController.text =
          //     resBody['response']['Foil cutterr Description']["EVA_Size"] ?? '';
          // backsheetLotController.text = resBody['response']
          //         ['Foil cutterr Description']["Backsheet_Lot"] ??
          //     '';

          // backsheetSizeController.text = resBody['response']
          //         ['Foil cutterr Description']["Backsheet_size"] ??
          //     '';
          // foilCommentController.text =
          //     resBody['response']['Foil cutterr Comments'] ?? '';
          // cellLotNoController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Cell_Lot_No"] ??
          //     '';
          // cellTypeController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Cell_Type"] ??
          //     '';
          // cellSyzeController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Cell_Size"] ??
          //     '';
          // cellEffController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Cell_Eff"] ??
          //     '';
          // interconnectRibbonSizeController.text = resBody['response']
          //             ['Tabbing & Stringing Description']
          //         ["Interconnect_Ribbon_Size"] ??
          //     '';
          // busbarSizeController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Busbar_Size"] ??
          //     '';
          // fluxController.text = resBody['response']
          //         ['Tabbing & Stringing Description']["Flux"] ??
          //     '';
          // tabbingCommentController.text =
          //     resBody['response']['Tabbing & Stringing Comments'] ?? '';
          // cellToCellGapController.text = resBody['response']
          //         ['Bussing/InterConnection Description']["Cell_To_Cell_Gap"] ??
          //     '';
          // stringToStringGapController.text = resBody['response']
          //             ['Bussing/InterConnection Description']
          //         ["String_To_String_Gap"] ??
          //     '';
          // solderingTempController.text = resBody['response']
          //         ['Bussing/InterConnection Description']["Soldering_Temp"] ??
          //     '';
          // bussingCommentController.text =
          //     resBody['response']['Bussing/InterConnection Comments'] ?? '';
          // tempreatureController.text = resBody['response']
          //             ['Visual Inspection & Laminator Description']
          //         ["Temperature"] ??
          //     '';
          // cycleTimeController.text = resBody['response']
          //         ['Visual Inspection & Laminator Description']["Cycle_Time"] ??
          //     '';
          // isCycleTimeTrue = resBody['response']
          //             ['Visual Inspection & Laminator Description']
          //         ["Laminate_Quality"] ??
          //     '';
          // visualCommentController.text = resBody['response']
          //         ['Visual Inspection & Laminator Comments'] ??
          //     '';
          // isBacksheetCuttingTrue = resBody['response']
          //         ['Edge Triming Description']["BackSheet_Cutting"] ??
          //     '';

          // edgeCommentController.text =
          //     resBody['response']['Edge Triming Comments'] ?? '';
          // frameTypeController.text =
          //     resBody['response']['Framing Description']["Frame_Type"] ?? '';
          // frameSizeController.text =
          //     resBody['response']['Framing Description']["Frame_Size"] ?? '';
          // sliconGlueLotController.text = resBody['response']
          //         ['Framing Description']["Silicon_Glue_Lot_No"] ??
          //     '';

          // framingCommentController.text =
          //     resBody['response']['Framing Comments'] ?? '';
          // jBLotNoController.text = resBody['response']
          //         ['J/B Assembly Description']["JB_Lot_No"] ??
          //     '';
          // jBTypeController.text =
          //     resBody['response']['J/B Assembly Description']["JB_Type"] ?? '';
          // siliconGlueLotNoController.text = resBody['response']
          //         ['J/B Assembly Description']["Silicon_Glue_Lot_No"] ??
          //     '';

          // jbCommentController.text =
          //     resBody['response']['J/B Assembly Comments'] ?? '';
          // pmaxController.text =
          //     resBody['response']['Sun Simulator Description']["Pmax"] ?? '';

          // sunCommentController.text =
          //     resBody['response']['Sun Simulator Comments'] ?? '';
          // referencePdfController.text =
          //     resBody['response']['ReferencePdf'] ?? '';
        }
      });
    }
  }

  Future setApprovalStatus() async {
    print("kyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(approvalStatus);
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();
    print("goooooooooooooooooooooooooooooooooooooooooooooooo");

    final url = (site! + "IPQC/UpdateJobCardStatus");

    var params = {
      "token": token,
      "CurrentUser": personid,
      "ApprovalStatus": approvalStatus,
      "JobCardDetailId": widget.id ?? ""
    };

    var response = await http.post(
      Uri.parse(url),
      body: json.encode(params),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      var objData = json.decode(response.body);
      if (objData['success'] == false) {
        Toast.show("Please Try Again.",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      } else {
        Toast.show("Job Card Test $approvalStatus .",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IpqcTestList()));
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
  }

  Future<void> _pickReferencePDF() async {
    print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // File pdffile = File(result.files.single.path!);
      setState(() {
        //referencePdfFileBytes = pdffile.readAsBytesSync();
        referencePdfController.text = result.files.single.name;
      });
    } else {
      // User canceled the file picker
    }
  }

  Future createData() async {
    print("Naveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeen");
    // print(jobCardDate);
    var data = [
      // {
      //   "JobCardDetails": {
      //     "Type": "Job Card",
      //     "JobCardDetailId": jobCarId != '' && jobCarId != null
      //         ? jobCarId
      //         : widget.id != '' && widget.id != null
      //             ? widget.id
      //             : '',
      //     "date": jobCardDate,
      //     "moduleType": moduleTypeController.text,
      //     "matrixSize": matrixSizeController.text,
      //     "moduleNo": moduleNoController.text,
      //     "DocNo": "GSPL/IPQC/BM/024",
      //     "RevisionNo": "1.0",
      //     "RevisionDate": "12.08.2023",
      //     "Status": sendStatus,
      //     "CreatedBy": personid
      //   }
      // },
      // {
      //   "JobCard": [
      //     {
      //       "Process": 'Glass Washing',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "Lot_No": lotNoController.text,
      //         "size": lotSizeController.text
      //       },
      //       "Comment": glassCommentController.text
      //     },
      //     {
      //       "Process": 'Foil cutterr',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "EVA_Lot_No": evaLotNoController.text,
      //         "EVA_Size": evaSizeController.text,
      //         "Backsheet_Lot": backsheetLotController.text,
      //         "Backsheet_size": backsheetSizeController.text
      //       },
      //       "Comment": foilCommentController.text
      //     },
      //     {
      //       "Process": 'Tabbing & Stringing',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "Cell_Lot_No": cellLotNoController.text,
      //         "Cell_Type": cellTypeController.text,
      //         "Cell_Size": cellSyzeController.text,
      //         "Cell_Eff": cellEffController.text,
      //         "Interconnect_Ribbon_Size": interconnectRibbonSizeController.text,
      //         "Busbar_Size": busbarSizeController.text,
      //         "Flux": fluxController.text
      //       },
      //       "Comment": tabbingCommentController.text
      //     },
      //     {
      //       "Process": 'Bussing/InterConnection',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "Cell_To_Cell_Gap": cellToCellGapController.text,
      //         "String_To_String_Gap": stringToStringGapController.text,
      //         "Soldering_Temp": solderingTempController.text
      //       },
      //       "Comment": bussingCommentController.text
      //     },
      //     {
      //       "Process": 'Visual Inspection & Laminator',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "Temperature": tempreatureController.text,
      //         "Cycle_Time": cycleTimeController.text,
      //         "Laminate_Quality": isCycleTimeTrue
      //       },
      //       "Comment": visualCommentController.text
      //     },
      //     {
      //       "Process": 'Edge Triming',
      //       "EmployeeID": personid,
      //       "Description": {"BackSheet_Cutting": isBacksheetCuttingTrue},
      //       "Comment": edgeCommentController.text
      //     },
      //     {
      //       "Process": 'Framing',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "Frame_Type": frameTypeController.text,
      //         "Frame_Size": frameSizeController.text,
      //         "Silicon_Glue_Lot_No": sliconGlueLotController.text
      //       },
      //       "Comment": framingCommentController.text
      //     },
      //     {
      //       "Process": 'J/B Assembly',
      //       "EmployeeID": personid,
      //       "Description": {
      //         "JB_Lot_No": jBLotNoController.text,
      //         "JB_Type": jBTypeController.text,
      //         "Silicon_Glue_Lot_No": siliconGlueLotNoController.text
      //       },
      //       "Comment": jbCommentController.text
      //     },
      //     {
      //       "Process": 'Sun Simulator',
      //       "EmployeeID": personid,
      //       "Description": {"Pmax": pmaxController.text},
      //       "Comment": sunCommentController.text
      //     }
      //   ]
      // }
    ];
    print('Sending data to backend: $data');

    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    final url = (site! + "IPQC/AddJobCard");

    final prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Bhanuu bhai");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var objData = json.decode(response.body);
      setState(() {
        jobCarId = objData['UUID'];

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
          uploadPDF((referencePdfFileBytes ?? []));
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

  uploadPDF(List<int> referenceBytes) async {
    setState(() {
      _isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site')!;

    var currentdate = DateTime.now().microsecondsSinceEpoch;
    var formData = FormData.fromMap({
      "JobCardDetailId": jobCarId,
      "Reference": MultipartFile.fromBytes(
        referenceBytes,
        filename:
            (referencePdfController.text + (currentdate.toString()) + '.pdf'),
        contentType: MediaType("application", 'pdf'),
      ),
    });

    _response = await _dio.post((site! + 'IPQC/UploadPdf'),
        options: Options(
          contentType: 'multipart/form-data',
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        data: formData);

    try {
      if (_response?.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });

        Toast.show("Job Card Test Completed.",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IpqcTestList()));
      } else {
        Toast.show("Error In Server",
            duration: Toast.lengthLong, gravity: Toast.center);
      }
    } catch (err) {
      print("Error");
    }
  }

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

  // *********** Done Send the Data ***************

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
                return widget.id != "" && widget.id != null
                    ? IpqcTestList()
                    : IpqcPage();
              }));
            },
          ),
          body: _isLoading
              ? AppLoader()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: setPage == ''
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
                                          "Soldering Peel Test Report",
                                          style: TextStyle(
                                            fontSize: 27,
                                            color:
                                                Color.fromARGB(255, 56, 57, 56),
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
                                          'GSPL/IPQC/SP/006',
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

                                    // ****************** Date ***********************
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Date",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: dateController,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Please Enter Date",
                                        counterText: '',
                                        fillColor:
                                            Color.fromARGB(255, 215, 243, 207),
                                        suffixIcon: Icon(Icons.calendar_month),
                                      ),
                                      style: AppStyles.textInputTextStyle,
                                      readOnly: status == 'Pending' &&
                                              designation != "QC"
                                          ? true
                                          : false,
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
                                            DateFormat("EEE MMM dd, yyyy")
                                                .format(
                                          DateTime.parse(date.toString()),
                                        );
                                        setState(() {
                                          dateOfQualityCheck =
                                              DateFormat("yyyy-MM-dd").format(
                                            DateTime.parse(date.toString()),
                                          );
                                        });
                                      },
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
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
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
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Select Shift",
                                        counterText: '',
                                        fillColor:
                                            Color.fromARGB(255, 215, 243, 207),
                                      ),
                                      style: AppStyles.textInputTextStyle,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Select Shift";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    // ********** Line *********

                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Line.",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: LineController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Please Enter Line.",
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
                                            errorText: "Please Enter Line.",
                                          ),
                                        ],
                                      ),
                                    ),

                                    //***************   Operator Name   ********************
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Operator Name",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: operatorController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the Operator Name",
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
                                            errorText:
                                                "Please fill the required Operator Name",
                                          ),
                                        ],
                                      ),
                                    ),

                                    //***************   Ribbon Size  ********************
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Ribbon Size",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: ribbonSizeController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the Ribbon Size",
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
                                            errorText:
                                                "Please fill the required Ribbon Size",
                                          ),
                                        ],
                                      ),
                                    ),
                                    //***************   Cell Size  ********************
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Cell Size",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: cellSizeController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the Cell Size",
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
                                            errorText:
                                                "Please fill the required Cell Size",
                                          ),
                                        ],
                                      ),
                                    ),
                                    //***************   Ribbon Make  ********************
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Ribbon Make",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: ribbonMakeController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the Ribbon Make",
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
                                            errorText:
                                                "Please fill the required Ribbon Make",
                                          ),
                                        ],
                                      ),
                                    ),
                                    //***************   Cell Make  ********************
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Cell Make",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: cellMakeController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the Cell Make",
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
                                            errorText:
                                                "Please fill the required Cell Make",
                                          ),
                                        ],
                                      ),
                                    ),

                                    // *********** Machine Number ************

                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Machine Number",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: machineController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Please Machine Number",
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
                                            errorText: "Please Machine Number",
                                          ),
                                        ],
                                      ),
                                    ),

                                    //***************   Ribbon  ********************
                                    SizedBox(height: 25),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Ribbon",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      controller: ribbonController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          numberOfStringers =
                                              int.tryParse(value) ?? 0;
                                          addfrontControllers(
                                              numberOfStringers * 5);
                                          addbackControllers(
                                              numberOfStringers * 5);
                                        });
                                      },
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                        hintText: "Enter the number of Ribbon",
                                        fillColor:
                                            Color.fromARGB(255, 248, 226, 217),
                                      ),
                                      style: AppStyles.textInputTextStyle,
                                      readOnly: status == 'Pending' &&
                                              designation != "QC"
                                          ? true
                                          : false,
                                    ),
                                    SizedBox(height: 20),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    Visibility(
                                      visible: numberOfStringers > 0,
                                      child: Center(
                                        child: Text(
                                          "Stringer Track",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 250, 4, 4),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 5),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: numberOfStringers,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ribbon${index + 1}",
                                              style: AppStyles
                                                  .textInputTextStyle
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            TextFormField(
                                              controller:
                                                  frontControllers[index],
                                              decoration: AppStyles
                                                  .textFieldInputDecoration
                                                  .copyWith(
                                                hintText: "Front Peel ",
                                                counterText: '',
                                                fillColor: Color.fromARGB(
                                                    255, 215, 243, 207),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                              ),
                                              style:
                                                  AppStyles.textInputTextStyle,
                                              readOnly: status == 'Pending' &&
                                                      designation != "QC"
                                                  ? true
                                                  : false,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Enter Correct Stringer';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              controller:
                                                  backControllers[index],
                                              decoration: AppStyles
                                                  .textFieldInputDecoration
                                                  .copyWith(
                                                hintText: "Back Peel ",
                                                counterText: '',
                                                fillColor: Color.fromARGB(
                                                    255, 215, 243, 207),
                                                contentPadding:
                                                    EdgeInsets.all(10),
                                              ),
                                              style:
                                                  AppStyles.textInputTextStyle,
                                              readOnly: status == 'Pending' &&
                                                      designation != "QC"
                                                  ? true
                                                  : false,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Enter Correct Stringer';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    // ********  Functionality  ************
                                    Text(
                                      "Reference PDF Document ",
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: referencePdfController,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      decoration: AppStyles
                                          .textFieldInputDecoration
                                          .copyWith(
                                              hintText:
                                                  "Please Select Reference Pdf",
                                              suffixIcon: IconButton(
                                                onPressed: () async {
                                                  if (widget.id != null &&
                                                      widget.id != '' &&
                                                      referencePdfController
                                                              .text !=
                                                          '') {
                                                    UrlLauncher.launch(
                                                        referencePdfController
                                                            .text);
                                                  } else if (status !=
                                                      'Pending') {
                                                    _pickReferencePDF();
                                                  }
                                                },
                                                icon: widget.id != null &&
                                                        widget.id != '' &&
                                                        referencePdfController
                                                                .text !=
                                                            ''
                                                    ? const Icon(Icons.download)
                                                    : const Icon(
                                                        Icons.upload_file),
                                              ),
                                              counterText: ''),
                                      style: AppStyles.textInputTextStyle,
                                      maxLines: 1,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Select Reference Pdf";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                    _isLoading
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : (widget.id == "" ||
                                                    widget.id == null) ||
                                                (status == 'Inprogress' &&
                                                    widget.id != null)
                                            ? AppButton(
                                                textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.white,
                                                  fontSize: 16,
                                                ),
                                                onTap: () {
                                                  AppHelper.hideKeyboard(
                                                      context);

                                                  Sample1Controllers = [];

                                                  for (int i = 0;
                                                      i < numberOfStringers;
                                                      i++) {
                                                    Sample1Controllers.add({
                                                      "frontControllers${i + 1}":
                                                          frontControllers[i]
                                                              .text,
                                                    });
                                                  }
                                                  Sample2Controllers = [];

                                                  for (int i = 0;
                                                      i < numberOfStringers;
                                                      i++) {
                                                    Sample2Controllers.add({
                                                      "backControllers${i + 1}":
                                                          backControllers[i]
                                                              .text,
                                                    });
                                                  }

                                                  _registerFormKey
                                                      .currentState!.save;
                                                  if (_registerFormKey
                                                      .currentState!
                                                      .validate()) {
                                                    setState(() {
                                                      sendStatus = "Pending";
                                                    });
                                                    createData();
                                                  }

                                                  // _registerFormKey.currentState!.save;
                                                  // if (_registerFormKey.currentState!
                                                  //     .validate()) {
                                                  //   createData();
                                                  // }
                                                  setState(() {
                                                    setPage = "NextPage";
                                                  });
                                                  // print("Page set");
                                                  print(setPage);
                                                },
                                                label: "Save",
                                                organization: '',
                                              )
                                            : Container(),

                                    const SizedBox(
                                      height: 15,
                                    ),
                                    if (widget.id != "" &&
                                        widget.id != null &&
                                        status == 'Pending')
                                      Container(
                                        color:
                                            Color.fromARGB(255, 191, 226, 187),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Divider(),
                                            SizedBox(height: 15),
                                            AppButton(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.white,
                                                  fontSize: 16),
                                              onTap: () {
                                                AppHelper.hideKeyboard(context);
                                                setApprovalStatus();
                                              },
                                              label: "Approve",
                                              organization: '',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Divider(),
                                          ],
                                        ),
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
                      : Container(),
                ),
          floatingActionButton: (status == "Pending") ? null : _getFAB(),
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
                          builder: (BuildContext context) =>
                              department == 'IPQC' &&
                                      designation != 'Super Admin'
                                  ? IpqcPage()
                                  : WelcomePage()));
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
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => PublicDrawer()));
                    },
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
