import 'dart:convert';

import 'package:QCM/Ipqc.dart';
import 'package:QCM/Iqcp.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_button_widget.dart';

import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../components/appbar.dart';
import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_fonts.dart';
import '../constant/app_helper.dart';

import '../constant/app_styles.dart';

class Jobcard extends StatefulWidget {
  @override
  _JobcardState createState() => _JobcardState();
}

class _JobcardState extends State<Jobcard> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController dateOfQualityCheckController = TextEditingController();
  TextEditingController lotNoController = TextEditingController();
  TextEditingController evaLotNoController = TextEditingController();
  TextEditingController evaSizeController = TextEditingController();
  TextEditingController backsheetLotController = TextEditingController();
  TextEditingController backsheetSizeController = TextEditingController();
  TextEditingController cellLotNoController = TextEditingController();
  TextEditingController cellTypeController = TextEditingController();
  TextEditingController cellSyzeController = TextEditingController();
  TextEditingController cellEffController = TextEditingController();
  TextEditingController interconnectRibbonSizeController =
      TextEditingController();
  TextEditingController busbarSizeController = TextEditingController();
  TextEditingController fluxController = TextEditingController();
  TextEditingController cellToCellGapController = TextEditingController();
  TextEditingController stringToStringGapController = TextEditingController();
  TextEditingController solderingTempController = TextEditingController();
  TextEditingController tempreatureController = TextEditingController();
  TextEditingController cycleTimeController = TextEditingController();
  TextEditingController frameTypeController = TextEditingController();
  TextEditingController frameSizeController = TextEditingController();
  TextEditingController sliconGlueLotController = TextEditingController();
  TextEditingController jBLotNoController = TextEditingController();
  TextEditingController jBTypeController = TextEditingController();
  TextEditingController siliconGlueLotNoController = TextEditingController();
  TextEditingController pmaxController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController matrixSizeController = TextEditingController();
  TextEditingController moduleTypeController = TextEditingController();
  TextEditingController moduleNoController = TextEditingController();
  TextEditingController glassCommentController = TextEditingController();
  TextEditingController foilCommentController = TextEditingController();
  TextEditingController tabbingCommentController = TextEditingController();
  TextEditingController bussingCommentController = TextEditingController();
  TextEditingController visualCommentController = TextEditingController();
  TextEditingController edgeCommentController = TextEditingController();
  TextEditingController framingCommentController = TextEditingController();
  TextEditingController jbCommentController = TextEditingController();
  TextEditingController sunCommentController = TextEditingController();
  bool menu = false, user = false, face = false, home = false;
  bool _isLoading = false;
  String setPage = '', pic = '';
  String invoiceDate = '';
  String date = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;

  @override
  void initState() {
    super.initState();
  }

  void sendDataToBackend() async {
    print(lotNoController.text);
    var data = {
      'date': dateController.text,
      'moduleType': moduleTypeController.text,
      'matrixSize': matrixSizeController.text,
      'moduleNo': moduleNoController.text,
      'lotSize': lotSizeController.text,
      'lotNo': lotNoController.text,
      'evaLotNo': evaLotNoController.text,
      'evaSize': evaSizeController.text,
      'backsheetLot': backsheetLotController.text,
      'backsheetSize': backsheetSizeController.text,
      'cellLotNo': cellLotNoController.text,
      'cellType': cellTypeController.text,
      'cellSize': cellSyzeController.text,
      'cellEff': cellEffController.text,
      'interconnectRibbonSize': interconnectRibbonSizeController.text,
      'busbarSize': busbarSizeController.text,
      'flux': fluxController.text,
      'cellToCellGap': cellToCellGapController.text,
      'stringToStringGap': stringToStringGapController.text,
      'solderingTemp': solderingTempController.text,
      'temperature': tempreatureController.text,
      'cycleTime': cycleTimeController.text,

      'frameType': frameTypeController.text,
      'frameSize': frameSizeController.text,
      'siliconGlueLot': sliconGlueLotController.text,
      'jBLotNo': jBLotNoController.text,
      'jBType': jBTypeController.text,
      'siliconGlueLotNo': siliconGlueLotNoController.text,
      'pmax': pmaxController.text,

      'glassComment': glassCommentController.text,
      'foilComment': foilCommentController.text,
      'tabbingComment': tabbingCommentController.text,
      'bussingComment': bussingCommentController.text,
      'visualComment': visualCommentController.text,
      'edgeComment': edgeCommentController.text,
      'framingComment': framingCommentController.text,
      'jbComment': jbCommentController.text,
      'sunComment': sunCommentController.text,
      // Add more fields as needed
    };
    var d = [
      {
        "JobCardDetails": {
          "date": dateController.text,
          "moduleType": moduleTypeController.text,
          "matrixSize": matrixSizeController.text,
          "moduleNo": moduleNoController.text
        }
      },
      {
        "JobCard": [
          {
            "Process": 'Glass Washing',
            "EmployeeID": '',
            "Description": {
              "Lot_No": lotNoController.text,
              "size": lotSizeController.text
            },
            "Comment": glassCommentController.text
          },
          {
            "Process": 'Foil cutterr',
            "EmployeeID": '',
            "Description": {
              "EVA_Lot_No": evaLotNoController.text,
              "EVA_Size": evaSizeController.text,
              "Backsheet_Lot": backsheetLotController.text,
              "Backsheet_size": backsheetSizeController.text
            },
            "Comment": foilCommentController.text
          },
          {
            "Process": 'Tabbing & Stringing',
            "EmployeeID": '',
            "Description": {
              "Cell_Lot_No": cellLotNoController.text,
              "Cell_Type": cellTypeController.text,
              "Cell_Size": cellSyzeController.text,
              "Cell_Eff": cellEffController.text,
              "Interconnect_Ribbon_Size": interconnectRibbonSizeController.text,
              "Busbar_Size": busbarSizeController.text,
              "Flux": fluxController.text
            },
            "Comment": tabbingCommentController.text
          },
          {
            "Process": 'Bussing/InterConnection',
            "EmployeeID": '',
            "Description": {
              "Cell_To_Cell_Gap": cellToCellGapController.text,
              "String_To_String_Gap": stringToStringGapController.text,
              "Soldering_Temp": solderingTempController.text
            },
            "Comment": bussingCommentController.text
          },
          {
            "Process": 'Visual Inspection & Laminator',
            "EmployeeID": '',
            "Description": {
              "Temperature": tempreatureController.text,
              "Cycle_Time": cycleTimeController.text,
              "Laminate_Quality": isCycleTimeTrue
            },
            "Comment": visualCommentController.text
          },
          {
            "Process": 'Edge Triming',
            "EmployeeID": '',
            "Description": {"BackSheet_Cutting": isBacksheetCuttingTrue},
            "Comment": edgeCommentController.text
          },
          {
            "Process": 'Framing',
            "EmployeeID": '',
            "Description": {
              "Frame_Type": frameTypeController.text,
              "Frame_Size": frameSizeController.text,
              "Silicon_Glue_Lot_No": sliconGlueLotController.text
            },
            "Comment": framingCommentController.text
          },
          {
            "Process": 'J/B Assembly',
            "EmployeeID": '',
            "Description": {
              "JB_Lot_No": jBLotNoController.text,
              "JB_Type": jBTypeController.text,
              "Silicon_Glue_Lot_No": siliconGlueLotNoController.text
            },
            "Comment": jbCommentController.text
          },
          {
            "Process": 'Sun Simulator',
            "EmployeeID": '',
            "Description": {"Pmax": pmaxController.text},
            "Comment": sunCommentController.text
          }
        ]
      }
    ];
    print('Sending data to backend: $data');
  }

  Future getdata(String phone, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();
    if (lotSizeController.text.isEmpty || phone.isEmpty) {
      Toast.show("Please enter required details !",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.redColor);
      return;
    }
    final url = "AppStrings.path" + 'login/RegistersendOTP';
    final prefs = await SharedPreferences.getInstance();
    var params = {"Mobile": phone};
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
        Toast.show(objData['message'],
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      } else {
        Toast.show(objData['data']['message'],
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);
        setState(() {
          setPage = 'second';
          //  otp = objData['data']['sentotp']['otp'].toString();
        });
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
  }

  Future register(List Data) async {
    print("Bhhhhhhhhhhhhh");
    print(Data);
    final url = "AppStrings.path" + 'login/Registermember';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        // "personid": personid != null ? (personid ?? '') : '',
        // "Firstname": fname,
        // "Lastname": lname,
        // "Phonenum": phone,
        // "Organization": organization,
        // "AppType": widget.appName,
        // "Country": country == null ? '' : country,
        // "State": state == null ? '' : state,
        // "City": city == null ? '' : city,
        // "Gender": gender == null ? '' : gender,
        // "Referred": referral == null ? '' : referral,
        // "Occupation": occupation == null ? '' : occupation,
        // "businesscategory": businessscategory == null ? '' : businessscategory,
        // "businessname": companyname == null ? '' : companyname,
        // "designation": desigation == null ? '' : desigation,
        // "Otp": (otp ?? ''),
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      var responseData = json.decode(response.body);

      if (responseData['success'] == true) {
        Toast.show('Provide Some More Information',
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);

        if (mounted) {
          setState(() {
            _isLoading = false;
            // personid = responseData['data']['data'][0]['personid'];

            if (responseData['data']['data'][0]['Response'] ==
                'Registration successfull') {
              Toast.show(responseData['data']['data'][0]['Response'],
                  duration: Toast.lengthLong,
                  gravity: Toast.center,
                  backgroundColor: AppColors.blueColor);
              setPage = "fourth";
            } else {
              setPage = "third";
            }
          });
        }
      } else {
        Toast.show("OTP is Invalid",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
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
            child: Stack(
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
                            ],
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "JOB CARD",
                              style: TextStyle(
                                fontSize: 27,
                                color: AppColors.black,
                                fontFamily: appFontFamily,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        // const Center(
                        //   child: Text(
                        //     "(Solar Cell)",
                        //     style: TextStyle(
                        //       fontSize: 20,
                        //       color: AppColors.black,
                        //       fontFamily: appFontFamily,
                        //       fontWeight: FontWeight.w700,
                        //     ),
                        //   ),
                        // ),
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
                              'GSPL/IPQC/BM/024',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rev.No. / Rev. Date : ',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Ver.1.0 / 12-08-2024',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Date",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration:
                                AppStyles.textFieldInputDecoration.copyWith(
                                    hintText: "Please Enter Date",
                                    counterText: '',
                                    suffixIcon: Image.asset(
                                      AppAssets.icCalenderBlue,
                                      color: AppColors.primaryColor,
                                    )),
                            style: AppStyles.textInputTextStyle,
                            onTap: () async {
                              DateTime date = DateTime(2021);
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              date = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()))!;
                              dateController.text =
                                  DateFormat("EEE MMM dd, yyyy")
                                      .format(DateTime.parse(date.toString()));
                              setState(() {
                                date = DateFormat("yyyy-MM-dd")
                                        .format(DateTime.parse(date.toString()))
                                    as DateTime;
                              });
                            },
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Please Enter Date")
                            ])),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Module Type",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: moduleTypeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Module Type",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Module Type";
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Matrix Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: matrixSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Matrix Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Matrix Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Module No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: moduleNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Module No.",
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Module No.",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        const Center(
                          child: Text(
                            "Glass Washing",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: lotNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: lotSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: glassCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Foil Cutter
                        const Center(
                          child: Text(
                            "Foil Cutter",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "EVA Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: evaLotNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter EVA Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter EVA Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "EVA Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: evaSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter EVA Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter EVA Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Backsheet Lot",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: backsheetLotController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Backsheet Lot",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Backsheet Lot",
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Backsheet Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: backsheetSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Backsheet Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Backsheet Size",
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: foilCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Tabbing and stringing
                        const Center(
                          child: Text(
                            "Tabbing and stringing",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Cell Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cellLotNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cell Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cell Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Cell Type",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cellTypeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cell Type",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cell Type",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Cell Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cellSyzeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cell Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cell Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Cell Eff./wattage",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cellEffController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cell Eff./wattage",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cell Eff./wattage",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Interconnect Ribbon Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: interconnectRibbonSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Interconnect Ribbon Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Interconnect Ribbon Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Busbar",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: busbarSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Busbar",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Busbar",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Flux",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: fluxController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Flux",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Flux",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: tabbingCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Bussing Inter Connection
                        const Center(
                          child: Text(
                            "Bussing/Inter Connection",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Cell to Cell Gap",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cellToCellGapController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cell to Cell Gap",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cell to Cell Gap",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "String to String Gap",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: stringToStringGapController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter String to String Gap",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter String to String Gap",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Soldering Temp",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: solderingTempController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Soldering Temp",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Soldering Temp",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: bussingCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Visual Inspection And Laminator
                        const Center(
                          child: Text(
                            "Visual Inspection And Laminator",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Tempreture",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: tempreatureController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Tempreture",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Tempreture",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Cycle Time",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: cycleTimeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Cycle Time",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Cycle Time",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Laminate Quality",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue:
                                  isCycleTimeTrue, // You need to define isCycleTimeTrue in your State class
                              onChanged: (value) {
                                setState(() {
                                  isCycleTimeTrue = value;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            SizedBox(width: 20), // Adjust spacing as needed
                            Radio<bool>(
                              value: false,
                              groupValue:
                                  isCycleTimeTrue, // You need to define isCycleTimeTrue in your State class
                              onChanged: (value) {
                                setState(() {
                                  isCycleTimeTrue = value;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: visualCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Edge Trimming
                        const Center(
                          child: Text(
                            "Edge Trimming",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Backsheet Cutting",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue:
                                  isBacksheetCuttingTrue, // You need to define isCycleTimeTrue in your State class
                              onChanged: (value) {
                                setState(() {
                                  isBacksheetCuttingTrue = value;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            SizedBox(width: 20), // Adjust spacing as needed
                            Radio<bool>(
                              value: false,
                              groupValue:
                                  isBacksheetCuttingTrue, // You need to define isCycleTimeTrue in your State class
                              onChanged: (value) {
                                setState(() {
                                  isBacksheetCuttingTrue = value;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                          ],
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: edgeCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        //Framing
                        const Center(
                          child: Text(
                            "Framing",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Frame Type",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: frameTypeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Frame Type",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Frame Type",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Text(
                          "Frame Size",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: frameSizeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Frame Size",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Frame Size",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Silicon Glue Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: sliconGlueLotController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Frame Silicon Glue Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Frame Silicon Glue Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: framingCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // J/B Assembly
                        const Center(
                          child: Text(
                            "J/B Assembly",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "J/B Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: jBLotNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter J/B Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter J/B Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "J/B Type",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: jBTypeController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter J/B Type",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter J/B Type",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Silicon Glue Lot No",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: siliconGlueLotNoController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Silicon Glue Lot No",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Silicon Glue Lot No",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: jbCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Sun Simulator
                        const Center(
                          child: Text(
                            "Sun Simulator",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "pmax(Wattage)",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: pmaxController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter pmax(Wattage)",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter pmax(Wattage)",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Comments",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: sunCommentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Add your comments here",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          maxLines: 3,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Comment",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
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
                                  // sendDataToBackend();

                                  _registerFormKey.currentState!.save;
                                  if (_registerFormKey.currentState!
                                      .validate()) {
                                    sendDataToBackend();
                                  }
                                },
                                label: "Save",
                                organization: '',
                              ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          height: 25,
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
            ),
          ),
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
