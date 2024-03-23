import 'dart:convert';

import 'package:QCM/Ipqc.dart';
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

class PreLam extends StatefulWidget {
  const PreLam({super.key});

  @override
  _PrelamState createState() => _PrelamState();
}

class _PrelamState extends State<PreLam> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController LineController = TextEditingController();
  TextEditingController poController = TextEditingController();

  TextEditingController solarCellSupplierController = TextEditingController();
  TextEditingController solarCellSpecificationController =
      TextEditingController();
  TextEditingController solarCellLotBatchController = TextEditingController();
  TextEditingController solarCellremarkController = TextEditingController();

  TextEditingController fluxLotBatchController = TextEditingController();
  TextEditingController fluxSpecificationController = TextEditingController();
  TextEditingController fluxSupplierController = TextEditingController();
  TextEditingController fluxremarkController = TextEditingController();

  TextEditingController ribbonSupplierController = TextEditingController();
  TextEditingController ribbonSpecificationController = TextEditingController();
  TextEditingController ribbonLotBatchController = TextEditingController();
  TextEditingController ribbonremarkController = TextEditingController();

  TextEditingController InterconnectorSupplierController =
      TextEditingController();
  TextEditingController InterconnectorLotBatchController =
      TextEditingController();
  TextEditingController InterconnectorSpecificationController =
      TextEditingController();
  TextEditingController InterconnectorremarkController =
      TextEditingController();

  TextEditingController GlassSupplierController = TextEditingController();
  TextEditingController GlassSpecificationController = TextEditingController();
  TextEditingController GlassLotBatchController = TextEditingController();
  TextEditingController GlassremarkController = TextEditingController();

  TextEditingController EvaGlassSupplierController = TextEditingController();
  TextEditingController EvaGlassSpecificationController =
      TextEditingController();
  TextEditingController EvaGlassLotBatchController = TextEditingController();
  TextEditingController EvaGlassremarkController = TextEditingController();

  TextEditingController EvaGlassSideSupplierController =
      TextEditingController();
  TextEditingController EvaGlassSideSpecificationController =
      TextEditingController();
  TextEditingController EvaGlassSideLotBatchController =
      TextEditingController();
  TextEditingController EvaGlassSideremarkController = TextEditingController();

  TextEditingController BackSheetSupplierController = TextEditingController();
  TextEditingController BackSheetSpecificationController =
      TextEditingController();
  TextEditingController BackSheetLotBatchController = TextEditingController();
  TextEditingController BackSheetremarkController = TextEditingController();

  TextEditingController FrameSupplierController = TextEditingController();
  TextEditingController FrameSpecificationController = TextEditingController();
  TextEditingController FrameLotBatchController = TextEditingController();
  TextEditingController FrameremarkController = TextEditingController();

  TextEditingController JunctionBoxSupplierController = TextEditingController();
  TextEditingController JunctionBoxSpecificationController =
      TextEditingController();
  TextEditingController JunctionBoxLotBatchController = TextEditingController();
  TextEditingController JunctionBoxremarkController = TextEditingController();

  TextEditingController pottingJBSupplierController = TextEditingController();
  TextEditingController pottingJBSpecificationController =
      TextEditingController();
  TextEditingController pottingJBLotBatchController = TextEditingController();
  TextEditingController pottingJBremarkController = TextEditingController();

  TextEditingController FrameAdhesiveSupplierController =
      TextEditingController();
  TextEditingController FrameAdhesiveSpecificationController =
      TextEditingController();
  TextEditingController FrameAdhesiveLotBatchController =
      TextEditingController();
  TextEditingController FrameAdhesiveremarkController = TextEditingController();

  TextEditingController RfidSupplierController = TextEditingController();
  TextEditingController RfidSpecificationController = TextEditingController();
  TextEditingController RfidLotBatchController = TextEditingController();
  TextEditingController RfidremarkController = TextEditingController();
  bool menu = false, user = false, face = false, home = false;
  bool _isLoading = false;
  String setPage = '', pic = '';
  String invoiceDate = '';
  late String dateOfQualityCheck;
  String date = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;

  @override
  void initState() {
    super.initState();
  }

  void sendDataToBackend() async {
    var data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'line': LineController.text,
      'po': poController.text,
      'solarCellSupplier': solarCellSupplierController.text,
      'solarCellSpecification': solarCellSpecificationController.text,
      'solarCellLotBatch': solarCellLotBatchController.text,
      'solarCellRemark': solarCellremarkController.text,
      'fluxLotBatch': fluxLotBatchController.text,
      'fluxSpecification': fluxSpecificationController.text,
      'fluxSupplier': fluxSupplierController.text,
      'fluxRemark': fluxremarkController.text,
      'ribbonSupplier': ribbonSupplierController.text,
      'ribbonSpecification': ribbonSpecificationController.text,
      'ribbonLotBatch': ribbonLotBatchController.text,
      'ribbonRemark': ribbonremarkController.text,
      'interconnectorSupplier': InterconnectorSupplierController.text,
      'interconnectorLotBatch': InterconnectorLotBatchController.text,
      'interconnectorSpecification': InterconnectorSpecificationController.text,
      'interconnectorRemark': InterconnectorremarkController.text,
      'glassSupplier': GlassSupplierController.text,
      'glassSpecification': GlassSpecificationController.text,
      'glassLotBatch': GlassLotBatchController.text,
      'glassRemark': GlassremarkController.text,
      'evaGlassSupplier': EvaGlassSupplierController.text,
      'evaGlassSpecification': EvaGlassSpecificationController.text,
      'evaGlassLotBatch': EvaGlassLotBatchController.text,
      'evaGlassRemark': EvaGlassremarkController.text,
      'evaGlassSideSupplier': EvaGlassSideSupplierController.text,
      'evaGlassSideSpecification': EvaGlassSideSpecificationController.text,
      'evaGlassSideLotBatch': EvaGlassSideLotBatchController.text,
      'evaGlassSideRemark': EvaGlassSideremarkController.text,
      'backSheetSupplier': BackSheetSupplierController.text,
      'backSheetSpecification': BackSheetSpecificationController.text,
      'backSheetLotBatch': BackSheetLotBatchController.text,
      'backSheetRemark': BackSheetremarkController.text,
      'frameSupplier': FrameSupplierController.text,
      'frameSpecification': FrameSpecificationController.text,
      'frameLotBatch': FrameLotBatchController.text,
      'frameRemark': FrameremarkController.text,
      'junctionBoxSupplier': JunctionBoxSupplierController.text,
      'junctionBoxSpecification': JunctionBoxSpecificationController.text,
      'junctionBoxLotBatch': JunctionBoxLotBatchController.text,
      'junctionBoxRemark': JunctionBoxremarkController.text,
      'pottingJBSupplier': pottingJBSupplierController.text,
      'pottingJBSpecification': pottingJBSpecificationController.text,
      'pottingJBLotBatch': pottingJBLotBatchController.text,
      'pottingJBRemark': pottingJBremarkController.text,
      'frameAdhesiveSupplier': FrameAdhesiveSupplierController.text,
      'frameAdhesiveSpecification': FrameAdhesiveSpecificationController.text,
      'frameAdhesiveLotBatch': FrameAdhesiveLotBatchController.text,
      'frameAdhesiveRemark': FrameAdhesiveremarkController.text,
      'rfidSupplier': RfidSupplierController.text,
      'rfidSpecification': RfidSpecificationController.text,
      'rfidLotBatch': RfidLotBatchController.text,
      'rfidRemark': RfidremarkController.text,
      // Add more fields as needed
    };
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
    print('Sending data to backend: $data');
  }

  Future getdata(String phone, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    const url = "AppStrings.path" 'login/RegistersendOTP';
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
    const url = "AppStrings.path" 'login/Registermember';
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
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

                        //  ***************************?

                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Pre Lamb IPQC Checksheet",
                              style: TextStyle(
                                fontSize: 27,
                                color: AppColors.black,
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
                              'GSPL/IPQC/BM/002',
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                          ],
                        ),

                        // *************************** Revisional Number ********************
                        const SizedBox(
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
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: dateController,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Date",
                            counterText: '',
                            suffixIcon: const Icon(Icons.calendar_month),
                          ),
                          style: AppStyles.textInputTextStyle,
                          onTap: () async {
                            DateTime date = DateTime(2021);
                            FocusScope.of(context).requestFocus(FocusNode());
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

                        // ********************************* Line *******************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Line.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: LineController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Line.",
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Line.",
                              ),
                            ],
                          ),
                        ),

// *******************************  PO Number ***********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Po Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: poController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Po Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Po Number",
                              ),
                            ],
                          ),
                        ),

//  *******************************************   BOM Verification Check sheet ********************

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Solar Cell",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: solarCellSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: solarCellSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: solarCellLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: solarCellremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Remark",
                              ),
                            ],
                          ),
                        ),

// *************************** Flux *********************

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Flux ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  Flux-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: fluxSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter flux-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter flux-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** Flux-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: fluxSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter flux-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter flux-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Flux- Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: fluxLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter flux-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter flux-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: fluxremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  flux-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter flux-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################   Ribbon ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Ribbon ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  ribbon-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: ribbonSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter ribbon-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter ribbon-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** ribbon-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: ribbonSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter ribbon-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter ribbon-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** ribbon-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: ribbonLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter ribbon-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter ribbon-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** ribbon-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: ribbonremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  ribbon-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter ribbon-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################   Interconnector-Bus-bar ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Interconnector Bus-bar",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  Interconnector-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: InterconnectorSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Interconnector-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Interconnector-Supplier",
                              ),
                            ],
                          ),
                        ),

// ***************************  Interconnector-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: InterconnectorSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Interconnector-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Interconnector-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// ***************************  Interconnector-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: InterconnectorLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Interconnector-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Interconnector-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Interconnector-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: InterconnectorremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  Interconnector-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Interconnector-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################   Glass ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Glass ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  Glass-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: GlassSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Glass-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Glass-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** Glass-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: GlassSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Glass-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Glass-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Glass-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: GlassLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Glass-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Glass-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Glass-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: GlassremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  Glass-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Glass-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  Eva Glass side(FrontEVA)  ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "EVA Glass side(frontEVA) ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// *********************  Eva-Glass-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Eva-Glass-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Eva-Glass-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** Eva-Glass-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Eva-Glass-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Eva-Glass-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Eva-Glass-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Eva-Glass-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Eva-Glass-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** EvaGlass-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  EvaGlass-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter EvaGlass-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  Eva Glass side(rear EVA)  ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "EVA Glass Side(rearEVA)",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* EvaGlassSide-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSideSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter EvaGlassSide-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter EvaGlassSide-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** EvaGlassSide-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSideSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter EvaGlassSide-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter EvaGlassSide-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** EvaGlassSide-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSideLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter EvaGlassSide-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter EvaGlassSide-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** EvaGlassSide-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: EvaGlassSideremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  EvaGlassSide-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter EvaGlassSide-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  Back Sheet  ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Back Sheet",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* BackSheet-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BackSheetSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter BackSheet-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter BackSheet-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** BackSheet-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BackSheetSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter BackSheet-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter BackSheet-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** BackSheet-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BackSheetLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter BackSheet-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter BackSheet-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** BackSheet-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: BackSheetremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  BackSheet-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter BackSheet-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  Frame  ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Frame ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* Frame-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Frame-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Frame-Supplier",
                              ),
                            ],
                          ),
                        ),

// ***************************Frame-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Frame-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Frame-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Frame-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Frame-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Frame-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Frame-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  Frame-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Frame-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  JunctionBox  ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Junction Box ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* JunctionBox-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: JunctionBoxSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter JunctionBox-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter JunctionBox-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** JunctionBox-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: JunctionBoxSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter JunctionBox-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter JunctionBox-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** JunctionBox-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: JunctionBoxLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter JunctionBox-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter JunctionBox-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** JunctionBox-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: JunctionBoxremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  JunctionBox-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter JunctionBox-Remark",
                              ),
                            ],
                          ),
                        ),

// ####################################  Potting JB Sealant(A-B)   ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Potting JB Sealant(A-B) ",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* pottingJB-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: JunctionBoxSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter pottingJB-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter pottingJB-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** pottingJB-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: pottingJBSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter pottingJB-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter pottingJB-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** pottingJB-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: pottingJBLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter pottingJB-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter pottingJB-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** JunctionBox-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: pottingJBremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  pottingJB-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter pottingJB-Remark",
                              ),
                            ],
                          ),
                        ),

// #################################### Frame Adhesive Sealant   ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "Frame Adhesive Sealant",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* FrameAdhesive-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameAdhesiveSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter FrameAdhesive-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter FrameAdhesive-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** FrameAdhesive-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameAdhesiveSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter FrameAdhesive-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter FrameAdhesive-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** FrameAdhesive-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameAdhesiveLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter FrameAdhesive-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter FrameAdhesive-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** FrameAdhesive-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: FrameAdhesiveremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  FrameAdhesive-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter FrameAdhesive-Remark",
                              ),
                            ],
                          ),
                        ),

// #################################### RFID   ########################################

                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            "RFID",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                              fontFamily: appFontFamily,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

// ********************* Rfid-Supplier ************************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Supplier",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: RfidSupplierController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Rfid-Supplier",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Rfid-Supplier",
                              ),
                            ],
                          ),
                        ),

// *************************** Rfid-Specification / Model No. *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specification / Model No.",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: RfidSpecificationController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText:
                                "Please Enter Rfid-Specification / Model No.",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText:
                                    "Please Enter Rfid-Specification / Model No.",
                              ),
                            ],
                          ),
                        ),

// *************************** Rfid-Lot/Batch Number *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lot/Batch Number",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: RfidLotBatchController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter Rfid-Lot/Batch Number",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Rfid-Lot/Batch Number",
                              ),
                            ],
                          ),
                        ),

// *************************** Rfid-Remark *********************

                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Remark",
                          style: AppStyles.textfieldCaptionTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: RfidremarkController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration:
                              AppStyles.textFieldInputDecoration.copyWith(
                            hintText: "Please Enter  Rfid-Remark",
                            counterText: '',
                          ),
                          style: AppStyles.textInputTextStyle,
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                errorText: "Please Enter Rfid-Remark",
                              ),
                            ],
                          ),
                        ),

// *************************** Some style for the All Data *********************

                        const SizedBox(
                          height: 15,
                        ),

// ****************** ****** *********

                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
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
