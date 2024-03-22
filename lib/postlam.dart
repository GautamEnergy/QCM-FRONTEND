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

class Postlam extends StatefulWidget {
  @override
  _PostlamState createState() => _PostlamState();
}

class _PostlamState extends State<Postlam> {
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController lineController = TextEditingController();
  TextEditingController poController = TextEditingController();

  /******Trimming **********/
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController trimmingWiCrieteriaController = TextEditingController();
  TextEditingController trimmingWiFrequencyController = TextEditingController();
  TextEditingController trimmingWiController = TextEditingController();
  TextEditingController trimmingPhysicalCriteriaController =
      TextEditingController();
  TextEditingController trimmingPhysicalFrequencyController =
      TextEditingController();
  TextEditingController trimmingPhysicalObs1Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs2Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs3Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs4Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs5Controller =
      TextEditingController();
  /**************Post LAM Visual Inspection*********** */
  TextEditingController postLamWiCrieteriaController = TextEditingController();
  TextEditingController postLamWiFrequencyController = TextEditingController();
  TextEditingController postLamWiController = TextEditingController();
  TextEditingController postLamVisualCrieteriaController =
      TextEditingController();
  TextEditingController postLamVisualFrequencyController =
      TextEditingController();
  TextEditingController postLamVisualObs1Controller = TextEditingController();
  TextEditingController postLamVisualObs2Controller = TextEditingController();
  TextEditingController postLamVisualObs3Controller = TextEditingController();
  TextEditingController postLamVisualObs4Controller = TextEditingController();
  TextEditingController postLamVisualObs5Controller = TextEditingController();
  /////////// Framing/////////////////////
  TextEditingController framingWiCrieteriaController = TextEditingController();
  TextEditingController framingWiFrequencyController = TextEditingController();
  TextEditingController framingWiController = TextEditingController();
  TextEditingController framingGlueUniCrieteriaController =
      TextEditingController();
  TextEditingController framingGlueUniFrequencyController =
      TextEditingController();
  TextEditingController framingGlueUniObs1Controller = TextEditingController();
  TextEditingController framingGlueUniObs2Controller = TextEditingController();
  TextEditingController framingGlueUniObs3Controller = TextEditingController();
  TextEditingController framingGlueUniObs4Controller = TextEditingController();
  TextEditingController framingGlueUniObs5Controller = TextEditingController();
  TextEditingController framingGlueWeightCrieteriaController =
      TextEditingController();
  TextEditingController framingGlueWeightFrequencyController =
      TextEditingController();
  TextEditingController framingGlueWeightController = TextEditingController();
  TextEditingController framingCornerCrieteriaController =
      TextEditingController();
  TextEditingController framingCornerFrequencyController =
      TextEditingController();
  TextEditingController framingCornerObs1Controller = TextEditingController();
  TextEditingController framingCornerObs2Controller = TextEditingController();
  TextEditingController framingCornerObs3Controller = TextEditingController();
  TextEditingController framingCornerObs4Controller = TextEditingController();
  TextEditingController framingCornerObs5Controller = TextEditingController();
  TextEditingController framingTopCrieteriaController = TextEditingController();
  TextEditingController framingTopFrequencyController = TextEditingController();
  TextEditingController framingTopController = TextEditingController();
  TextEditingController framingMountingCrieteriaController =
      TextEditingController();
  TextEditingController framingMountingFrequencyController =
      TextEditingController();
  TextEditingController framingMountingController = TextEditingController();
  TextEditingController framingAnodizingCrieteriaController =
      TextEditingController();
  TextEditingController framingAnodizingFrequencyController =
      TextEditingController();
  TextEditingController framingAnodizingController = TextEditingController();
  bool menu = false, user = false, face = false, home = false;
  bool _isLoading = false;
  String setPage = 'trimming', pic = '';
  String invoiceDate = '';
  String date = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;

  @override
  void initState() {
    super.initState();
  }

  // void sendDataToBackend() async {
  //   print(lotNoController.text);
  //   var data = {
  //     'date': dateController.text,
  //     'moduleType': moduleTypeController.text,
  //     'matrixSize': matrixSizeController.text,
  //     'moduleNo': moduleNoController.text,
  //     'lotSize': lotSizeController.text,
  //     'lotNo': lotNoController.text,
  //     'evaLotNo': evaLotNoController.text,
  //     'evaSize': evaSizeController.text,
  //     'backsheetLot': backsheetLotController.text,
  //     'backsheetSize': backsheetSizeController.text,
  //     'cellLotNo': cellLotNoController.text,
  //     'cellType': cellTypeController.text,
  //     'cellSize': cellSyzeController.text,
  //     'cellEff': cellEffController.text,
  //     'interconnectRibbonSize': interconnectRibbonSizeController.text,
  //     'busbarSize': busbarSizeController.text,
  //     'flux': fluxController.text,
  //     'cellToCellGap': cellToCellGapController.text,
  //     'stringToStringGap': stringToStringGapController.text,
  //     'solderingTemp': solderingTempController.text,
  //     'temperature': tempreatureController.text,
  //     'cycleTime': cycleTimeController.text,

  //     'frameType': frameTypeController.text,
  //     'frameSize': frameSizeController.text,
  //     'siliconGlueLot': sliconGlueLotController.text,
  //     'jBLotNo': jBLotNoController.text,
  //     'jBType': jBTypeController.text,
  //     'siliconGlueLotNo': siliconGlueLotNoController.text,
  //     'pmax': pmaxController.text,

  //     'glassComment': glassCommentController.text,
  //     'foilComment': foilCommentController.text,
  //     'tabbingComment': tabbingCommentController.text,
  //     'bussingComment': bussingCommentController.text,
  //     'visualComment': visualCommentController.text,
  //     'edgeComment': edgeCommentController.text,
  //     'framingComment': framingCommentController.text,
  //     'jbComment': jbCommentController.text,
  //     'sunComment': sunCommentController.text,
  //     // Add more fields as needed
  //   };
  // let data = [
  //   {
  //     Process:'Glass Washing',
  //     EmployeeID:'',
  //     Description:{
  //       LotNo:'xyx',
  //       size:'yz'
  //     },
  //   Comment:'comment'
  //   },
  //   {
  //     Process:'Foil cutterr',
  //     EmployeeID:'',
  //     Description:{
  //      EVA_Lot_No:'',
  //      EVA_Size:'',
  //      Backsheet_Lot:'',
  //      Backsheet_size:''
  //     },
  //   Comment:'comment'
  //   },

  // ]
  //   print('Sending data to backend: $data');
  // }

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
            child: setPage == "trimming"
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
                                    "Incoming Production Quality Plan",
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: AppColors.black,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "(Post Lam IPQC Checklist)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.black,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
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
                                    'GSPL/IPQC/IP/003',
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
                                    'Ver.1.0 / 20-08-2024',
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
                                  // controller: dateController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
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
                                        DateFormat("EEE MMM dd, yyyy").format(
                                            DateTime.parse(date.toString()));
                                    setState(() {
                                      date = DateFormat("yyyy-MM-dd").format(
                                              DateTime.parse(date.toString()))
                                          as DateTime;
                                    });
                                  },
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Please Enter Date")
                                  ])),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Shift",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                controller: shiftController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Shift",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Shift";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Line",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: lineController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Line",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Line",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Po.No",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: poController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Po.No",
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Po.No",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
/************************************Trimming**************************************** */
                              const Center(
                                child: Text(
                                  "Trimming",
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
                                "Frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiFrequencyController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Once a Shift",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Avaibility of Wi",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Avaibility of Wi",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please Enter Avaibility of Wi",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Crieteria",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiCrieteriaController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Must be present",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 2.0,
                                  thickness: 2.0,
                                ),
                              ),

                              Text(
                                "Frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalFrequencyController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "5 Piece per Shift ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Physical verification of union trimming & Blade replacing frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 1 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 1",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 2 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 2 ",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 3 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 3",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 4 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 4",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 5 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 5",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Criteria",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalCriteriaController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Uniform Trimming Without any burr & residue ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
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
                                        print(
                                            trimmingPhysicalFrequencyController
                                                .text);
                                        // sendDataToBackend();

                                        _registerFormKey.currentState!.save;
                                        if (_registerFormKey.currentState!
                                            .validate()) {}
                                        setState(() {
                                          setPage = 'postlamvisualinspection';
                                        });
                                      },
                                      label: "Next",
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
                  )
                : setPage == "postlamvisualinspection"
                    /************Post Lam Visual Inspection****************** */
                    ? Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            child: Form(
                              //  key: _registerFormKey,
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
                                        Image.asset(
                                          AppAssets.imgLogo,
                                          height: 100,
                                          width: 230,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Center(
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                              "Incoming Production Quality Control",
                                              style: TextStyle(
                                                  fontSize: 27,
                                                  color: AppColors.black,
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                  const Center(
                                      child: Text("(Post Lam IPQC Checklist)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black,
                                              fontFamily: appFontFamily,
                                              fontWeight: FontWeight.w700))),
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
                                        'GSPL/IPQC/IPC/003',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
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
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Ver.2.0 / 20-03-2024',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                      child: Text("Post Lam Visual Inspection",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 13, 160, 0),
                                              fontFamily: appFontFamily,
                                              fontWeight: FontWeight.w700))),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Text(
                                    "Frequency",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiFrequencyController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Once a Shift",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Avaibility of Wi & Crieteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Please Enter Avaibility of Wi & Crieteria",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Avaibility of Wi & Crieteria",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Crieteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiCrieteriaController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Must be present",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 2.0,
                                      thickness: 2.0,
                                    ),
                                  ),

                                  Text(
                                    "Frequency",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        postLamVisualFrequencyController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "5 Piece per Shift ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Visual Defects",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 1 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 1",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 2 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 2",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 3 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 3",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 4 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 4",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 5 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter 5",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Criteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        postLamVisualCrieteriaController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "As per Visual inspection crieteria:GSPI/IPQC/VI/021 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
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
                                      : AppButton(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                          onTap: () {
                                            AppHelper.hideKeyboard(context);
                                            // sendDataToBackend();

                                            // _registerFormKey.currentState!.save;
                                            // if (_registerFormKey.currentState!
                                            //     .validate()) {
                                            //   sendDataToBackend();
                                            // }
                                            setState(() {
                                              setPage = "framing";
                                            });
                                            print("Page set");
                                            print(setPage);
                                          },
                                          label: "Next",
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
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            setPage = "trimming";
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
                    : setPage == "framing"
                        /******************Framing********************* */
                        ? Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              SingleChildScrollView(
                                child: Form(
                                  //  key: _registerFormKey,
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
                                            Image.asset(
                                              AppAssets.imgLogo,
                                              height: 100,
                                              width: 230,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Center(
                                          child: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                  "Incoming Production Quality Control",
                                                  style: TextStyle(
                                                      fontSize: 27,
                                                      color: AppColors.black,
                                                      fontFamily: appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700)))),
                                      const Center(
                                          child: Text(
                                              "(Post Lam IPQC Checklist)",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.black,
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700))),
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
                                            'GSPL/IPQC/IPC/003',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
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
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Ver.2.0 / 20-03-2024',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Center(
                                          child: Text("Framing",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 13, 160, 0),
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingWiFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Avaibility of Wi & Sealant Weight Specification",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingWiController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingWiCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Must be present",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // glue uniformely

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "5 Piece per Shift ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Glue uniformity & continuty in frame group",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 1 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 1",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 2 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 2",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs3Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 3 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 3",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs4Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 4",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 4",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs5Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 5 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 5",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Criteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Should be continuos & uniform , No gap between frame & backsheet ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // Glue Weight

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueWeightFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                        "Glue Wieght",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingGlueWeightController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueWeightCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "As Per GSPL/IPQC/FG/013",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // Corner Gap

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingCornerFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "5 piece per Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Corner Gap",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 1",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 1",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 2",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 2 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs3Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 3",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 3 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs4Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 4",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 4 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs5Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 5",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 5 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingCornerCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "No Corner Gap,No overlapping",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Top & Button cut length

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingTopFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Top & Button cut Length side cut length",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingTopController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingTopCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "As per PO or process card",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Mounting hole x,y pitch

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingMountingFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting hole x,y pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingMountingController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingMountingCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "+-1mm",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Anodizing thickness

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingAnodizingFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Anodizing Thickness",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingAnodizingController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingAnodizingCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: ">=15 micron",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
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
                                                // sendDataToBackend();

                                                _registerFormKey
                                                    .currentState!.save;
                                                if (_registerFormKey
                                                    .currentState!
                                                    .validate()) {
                                                  // sendDataToBackend();
                                                }
                                                setState(() {
                                                  setPage =
                                                      'postlamvisualinspection';
                                                });
                                              },
                                              label: "Next",
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
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                setPage =
                                                    "postlamvisiualinspection";
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
                        : Container(),
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
                        face ? AppAssets.imgSelectedFace : AppAssets.imgFace,
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
