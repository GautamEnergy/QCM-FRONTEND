import 'dart:convert';

import 'package:QCM/Iqcp.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/constant/role_list_model.dart';
import 'package:QCM/dialogs/countrty_model.dart';

import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:logging_appenders/logging_appenders.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../components/appbar.dart';
import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_fonts.dart';
import '../constant/app_helper.dart';

import '../constant/app_styles.dart';

class SolarCell extends StatefulWidget {
  final String appName;
  SolarCell({required this.appName});
  _ScoreDetailsState createState() => _ScoreDetailsState();
}

class _ScoreDetailsState extends State<SolarCell> {
  int numberOfPackagingSampleFields = 1,
      numberOfVisualSampleFields = 0,
      numberOfPhysicalSampleFields = 0,
      numberOfFrontbusSampleFields = 0,
      numberOfVerificationSampleFields = 0,
      numberOfElectricalSampleFields = 0,
      numberOfPerformanceSampleFields = 0;
  List<TextEditingController> packagingBarcodeControllers = [];
  List<TextEditingController> packagingRemarksControllers = [];
  List<TextEditingController> visualBarcodeControllers = [];
  List<TextEditingController> visualRemarksControllers = [];
  List<TextEditingController> physicalBarcodeControllers = [];
  List<TextEditingController> physicalRemarksControllers = [];
  List<TextEditingController> frontbusBarcodeControllers = [];
  List<TextEditingController> frontbusRemarksControllers = [];
  List<TextEditingController> verificationBarcodeControllers = [];
  List<TextEditingController> verificationRemarksControllers = [];
  List<TextEditingController> electricalBarcodeControllers = [];
  List<TextEditingController> electricalRemarksControllers = [];
  List<TextEditingController> performanceBarcodeControllers = [];
  List<TextEditingController> performanceRemarksControllers = [];
  late List<bool> selectedPackagingTestValues,
      selectedVisualTestValues,
      selectedPhysicalTestValues,
      selectedFrontbusTestValues,
      selectedVerificationTestValues,
      selectedElectricalTestValues,
      selectedPerformanceTestValues; // Radio button values
  late GlobalKey<FormState> _formKey;
  String? invoiceDate,
      result = "Fail",
      receiptDate,
      dateOfQualityCheck,
      personid,
      firstname,
      lastname,
      pic,
      ImagePath,
      organizationName,
      // organizationtype,
      organizationid,
      logo,
      site,
      businessname,
      setPage = "heading",
      _genderType = 'M',
      choice = 'no',
      otp = '',
      otpexpiretime = '',
      _searchText = "",
      barcodeScanRes,
      // businessCategoryController,
      occupationotherid = '5e7b2657-119f-11ee-90da-fa163e3ffd3c'; // UAT/Prod
  //  occupationotherid = '230ffb80-119f-11ee-90da-fa163e3ffd3c'; // Dev
  bool menu = false, user = false, face = false, home = false;
  String? OccupationController,
      occupationname,
      Citycontroller,
      statecontroller,
      CountryController,
      ClubnameController;
  // OrganizationController;
  double padding = 10;
  bool _isSearching = false;
  bool selfvalue = false;
  int _genderValue = 0;
  RoleModel? businessData;
  CountryRoleModel? countrydata;
  // CityRoleModel Citydata;
  // StateRoleModel statename;
  // ..............Start..........................
  List packagingSampleData = [];
  List visualSampleData = [];
  List physicalSampleData = [];
  List frontbusSampleData = [];
  List verificationSampleData = [];
  List electricalSampleData = [];
  List performanceSampleData = [];

  bool packagingRejection = false,
      visualRejection = false,
      physicalRejection = false,
      frontbusRejection = false,
      verificationRejection = false,
      electricalRejection = false,
      performanceRejection = false;
  // .............End...........................

  bool _isLoading = false;
  final maskFormatter = new MaskTextInputFormatter(mask: '##### #####');

  TextEditingController supplierNameController = new TextEditingController();
  TextEditingController invoiceDateController = new TextEditingController();
  TextEditingController receiptDateController = new TextEditingController();
  TextEditingController rawMaterialSpecsController =
      new TextEditingController();
  TextEditingController dateOfQualityCheckController =
      new TextEditingController();
  TextEditingController rMBatchNoController = new TextEditingController();
  TextEditingController invoiceNoController = new TextEditingController();
  TextEditingController lotSizeController = new TextEditingController();
// Packaging
  TextEditingController rejectionReasonController = new TextEditingController();

  TextEditingController packagingCharactersticsController =
      new TextEditingController();
  TextEditingController packagingMeasuringMethodController =
      new TextEditingController();
  TextEditingController packagingSamplingController =
      new TextEditingController();
  TextEditingController packagingSampleSizeController =
      new TextEditingController();
  TextEditingController packagingReferenceDocController =
      new TextEditingController();
  TextEditingController packagingAcceptanceCriteriaController =
      new TextEditingController();
// Visual
  TextEditingController visualCharactersticsController =
      new TextEditingController();
  TextEditingController visualMeasuringMethodController =
      new TextEditingController();
  TextEditingController visualSamplingController = new TextEditingController();
  TextEditingController visualSampleSizeController =
      new TextEditingController();
  TextEditingController visualReferenceDocController =
      new TextEditingController();
  TextEditingController visualAcceptanceCriteriaController =
      new TextEditingController();

  // Physical
  TextEditingController physicalCharactersticsController =
      new TextEditingController();
  TextEditingController physicalMeasuringMethodController =
      new TextEditingController();
  TextEditingController physicalSamplingController =
      new TextEditingController();
  TextEditingController physicalSampleSizeController =
      new TextEditingController();
  TextEditingController physicalReferenceDocController =
      new TextEditingController();
  TextEditingController physicalAcceptanceCriteriaController =
      new TextEditingController();

  // Front Bus
  TextEditingController frontbusCharactersticsController =
      new TextEditingController();
  TextEditingController frontbusMeasuringMethodController =
      new TextEditingController();
  TextEditingController frontbusSamplingController =
      new TextEditingController();
  TextEditingController frontbusSampleSizeController =
      new TextEditingController();
  TextEditingController frontbusReferenceDocController =
      new TextEditingController();
  TextEditingController frontbusAcceptanceCriteriaController =
      new TextEditingController();

  // Verification
  TextEditingController verificationCharactersticsController =
      new TextEditingController();
  TextEditingController verificationMeasuringMethodController =
      new TextEditingController();
  TextEditingController verificationSamplingController =
      new TextEditingController();
  TextEditingController verificationSampleSizeController =
      new TextEditingController();
  TextEditingController verificationReferenceDocController =
      new TextEditingController();
  TextEditingController verificationAcceptanceCriteriaController =
      new TextEditingController();

  // Electrical
  TextEditingController electricalCharactersticsController =
      new TextEditingController();
  TextEditingController electricalMeasuringMethodController =
      new TextEditingController();
  TextEditingController electricalSamplingController =
      new TextEditingController();
  TextEditingController electricalSampleSizeController =
      new TextEditingController();
  TextEditingController electricalReferenceDocController =
      new TextEditingController();
  TextEditingController electricalAcceptanceCriteriaController =
      new TextEditingController();

  // Performance
  TextEditingController performanceCharactersticsController =
      new TextEditingController();
  TextEditingController performanceMeasuringMethodController =
      new TextEditingController();
  TextEditingController performanceSamplingController =
      new TextEditingController();
  TextEditingController performanceSampleSizeController =
      new TextEditingController();
  TextEditingController performanceReferenceDocController =
      new TextEditingController();
  TextEditingController performanceAcceptanceCriteriaController =
      new TextEditingController();
//....................End......................................

  GlobalKey<FormState> packagingFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _visualFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _visualsampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _physicalFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _physicalsampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _frontbusFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _frontbussampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _verificationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _verificationsampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _electricalFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _electricalsampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _performanceFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _performancesampleformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _resultFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    setState(() {
      // Packaging
      packagingCharactersticsController.text = "Packing (Make type and rating)";
      packagingMeasuringMethodController.text = "Visual Inspection";
      packagingSamplingController.text = "Whole Lot";
      packagingSampleSizeController.text = "100 %";
      packagingReferenceDocController.text = "PO/INVOICE";
      packagingAcceptanceCriteriaController.text =
          "No Physical Damage / No Mismatch against PO/Invoice";
// Visual
      visualCharactersticsController.text =
          "Color Variation, Cell Chip, Cell Crack, Grid Miss, Grid Line cut, Print Shift, Oxidation, Spot on cell";
      visualMeasuringMethodController.text = "Verner Calliper/Measuring Scale";
      visualSamplingController.text = "SIL S1 AQL 6.5";
      // visualSampleSizeController.text = "100 %";
      visualReferenceDocController.text =
          "GSPL Technical Specification / Supplier COC";
      visualAcceptanceCriteriaController.text =
          "As GSPL Technical Specification / Acceptance Criteria";

      //  Physical
      physicalCharactersticsController.text = "Dimension(L X W X T)";
      physicalMeasuringMethodController.text =
          "Verner Calliper/Measuring Scale";
      physicalSamplingController.text = "SIL S1 AQL 6.5";
      // physicalSampleSizeController.text = "100 %";
      physicalReferenceDocController.text =
          "GSPL Technical Specification / Supplier COC";
      physicalAcceptanceCriteriaController.text = "COC";

      //  Front Bus
      frontbusCharactersticsController.text = "Width";
      frontbusMeasuringMethodController.text =
          "Verner Calliper/Measuring Scale";
      frontbusSamplingController.text = "5 Pcs / Lot";
      // frontbusSampleSizeController.text = "100 %";
      frontbusReferenceDocController.text =
          "GSPL Technical Specification / Supplier COC";
      frontbusAcceptanceCriteriaController.text = "COC";

      //  Verification
      verificationCharactersticsController.text = "Electrical Paramiter";
      verificationMeasuringMethodController.text = "Cell Tester";
      verificationSamplingController.text = "SIL S1 AQL 6.5";
      // verificationSampleSizeController.text = "100 %";
      verificationReferenceDocController.text = "GSPL Technical Specification";
      verificationAcceptanceCriteriaController.text = "COC";

      //  Electrical
      electricalCharactersticsController.text =
          "LID(Light Inducted Degradation)/Preconditioning";
      electricalMeasuringMethodController.text = "Sunsimulator";
      electricalSamplingController.text = "One Module per supplier(each month)";
      // frontbusSampleSizeController.text = "100 %";
      electricalReferenceDocController.text = "GSPL Technical Specification";
      electricalAcceptanceCriteriaController.text = "COC";

      //  Performance
      performanceCharactersticsController.text = "Soidering Peel Test";
      performanceMeasuringMethodController.text = "Peel Tester";
      performanceSamplingController.text = "5 Cell/Lot";
      // performanceSampleSizeController.text = "100 %";
      performanceReferenceDocController.text = "GSPL Technical Specification";
      performanceAcceptanceCriteriaController.text =
          "1 N to 2N-Cell Frontside 1N to 4N Cell Back side";
    });
    _isSearching = false;

    super.initState();
  }

  Future createData() async {
    print('sampleeeeeeeeeeeeeeeeeeeeeeeee');
    print(packagingSampleData);
    var SolarCellDetails = {
      'LotNo': lotSizeController.text,
      'SupplierName': supplierNameController.text,
      'InvoiceNo': invoiceNoController.text,
      'InvoiceDate': invoiceDate,
      'RawMaterialSpecs': rawMaterialSpecsController.text,
      'DateOfQualityCheck': dateOfQualityCheck,
      'SupplierRMBatchNo': rMBatchNoController.text,
      'RecieptDate': receiptDate,
      'DocumentNo': 'GSPL/SC(IQC)/001',
      'RevNo': 'Ver2.0/13-03-2024'
    };

    var SolarCell = {
      'Packaging': {
        'Characterstics': packagingCharactersticsController.text,
        'MeasuringMethod': packagingMeasuringMethodController.text,
        'Sampling': packagingSamplingController.text,
        'SmapleSize': packagingSampleSizeController.text,
        'Reference': packagingReferenceDocController.text,
        'AcceptanceCriteria': packagingAcceptanceCriteriaController.text,
        'Samples': '$packagingSampleData'
      },
      'Visual': {
        'Characterstics': visualCharactersticsController.text,
        'MeasuringMethod': visualMeasuringMethodController.text,
        'Sampling': visualSamplingController.text,
        'Reference': visualReferenceDocController.text,
        'AcceptanceCriteria': visualAcceptanceCriteriaController.text,
        'Samples': '$visualSampleData'
      },
      'Physical': {
        'Characterstics': physicalCharactersticsController.text,
        'MeasuringMethod': physicalMeasuringMethodController.text,
        'Sampling': physicalSamplingController.text,
        'Reference': physicalReferenceDocController.text,
        'AcceptanceCriteria': physicalAcceptanceCriteriaController.text,
        'Samples': '$physicalSampleData'
      },
      'FrontBus': {
        'Characterstics': frontbusCharactersticsController.text,
        'MeasuringMethod': frontbusMeasuringMethodController.text,
        'Sampling': frontbusSamplingController.text,
        'Reference': frontbusReferenceDocController.text,
        'AcceptanceCriteria': frontbusAcceptanceCriteriaController.text,
        'Samples': '$frontbusSampleData'
      },
      'Verification': {
        'Characterstics': verificationCharactersticsController.text,
        'MeasuringMethod': verificationMeasuringMethodController.text,
        'Sampling': verificationSamplingController.text,
        'Reference': verificationReferenceDocController.text,
        'AcceptanceCriteria': verificationAcceptanceCriteriaController.text,
        'Samples': '$verificationSampleData'
      },
      'Electrical': {
        'Characterstics': electricalCharactersticsController.text,
        'MeasuringMethod': electricalMeasuringMethodController.text,
        'Sampling': electricalSamplingController.text,
        'Reference': electricalReferenceDocController.text,
        'AcceptanceCriteria': electricalAcceptanceCriteriaController.text,
        'Samples': '$electricalSampleData'
      },
      'Performance': {
        'Characterstics': performanceCharactersticsController.text,
        'MeasuringMethod': performanceMeasuringMethodController.text,
        'Sampling': performanceSamplingController.text,
        'Reference': performanceReferenceDocController.text,
        'AcceptanceCriteria': performanceAcceptanceCriteriaController.text,
        'Samples': '$performanceSampleData'
      }
    };

    var Rejected = {
      'CheckTypes': [
        {'Packaging': packagingRejection},
        {'Visual': visualRejection},
        {'Physical': physicalRejection},
        {'FrontBus': frontbusRejection},
        {'Verification': verificationRejection},
        {'Electrical': electricalRejection},
        {'Performance': performanceRejection},
      ],
      'Reason': rejectionReasonController
    };
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();

    final url =
        "https://fair-gray-gharial-wig.cyclic.app/IQCSolarCell/AddIQCSolarCell";
    // final prefs = await SharedPreferences.getInstance();
    var params = {
      "SolarCellDetails": SolarCellDetails,
      "SolarCell": SolarCell,
      "Rejected": Rejected
    };
    print(params);
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Resssssssss");
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
          otp = objData['data']['sentotp']['otp'].toString();
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
        "personid": personid != null ? (personid ?? '') : '',
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
        "Otp": (otp ?? ''),
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
            personid = responseData['data']['data'][0]['personid'];

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
                return IqcpPage();
              }));
            },
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: setPage == "heading"
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
                                    child: Text("Incoming Quality Control Plan",
                                        style: TextStyle(
                                            fontSize: 27,
                                            color: AppColors.black,
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700)))),
                            const Center(
                                child: Text("(Solar Cell)",
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
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'GSPL/SC(IQC)/001',
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
                                  'Ver.2.0 / 13-03-2024',
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lot Size",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: lotSizeController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration: AppStyles.textFieldInputDecoration
                                    .copyWith(
                                        hintText: "Please Enter Lot Size",
                                        counterText: ''),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Please Enter Lot Size")
                                ])),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Supplier Name",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: supplierNameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: AppStyles.textFieldInputDecoration
                                  .copyWith(
                                      hintText: "Please Enter Supplier Name",
                                      counterText: ''),
                              style: AppStyles.textInputTextStyle,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Supplier Name";
                                } else {
                                  return null;
                                }
                              },
                            ),

                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Invoice No.",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: invoiceNoController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Invoice No.",
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Please Enter Invoice No.")
                                ])),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Invoice Date",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                                controller: invoiceDateController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                        hintText: "Please Enter Invoice Date",
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
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime.now()))!;
                                  invoiceDateController.text =
                                      DateFormat("EEE MMM dd, yyyy").format(
                                          DateTime.parse(date.toString()));
                                  setState(() {
                                    invoiceDate = DateFormat("yyyy-MM-dd")
                                        .format(
                                            DateTime.parse(date.toString()));
                                  });
                                },
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Please Enter Invoice Date")
                                ])),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Raw Material Specs",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              controller: rawMaterialSpecsController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: AppStyles.textFieldInputDecoration
                                  .copyWith(
                                      hintText:
                                          "Please Enter Raw Material Specs",
                                      counterText: ''),
                              style: AppStyles.textInputTextStyle,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Raw Material Specs";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Date Of Quality Check",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                                controller: dateOfQualityCheckController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: AppStyles.textFieldInputDecoration
                                    .copyWith(
                                        hintText:
                                            "Please Enter Date Of Quality Check",
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
                                  dateOfQualityCheckController.text =
                                      DateFormat("EEE MMM dd, yyyy").format(
                                          DateTime.parse(date.toString()));
                                  setState(() {
                                    dateOfQualityCheck =
                                        DateFormat("yyyy-MM-dd").format(
                                            DateTime.parse(date.toString()));
                                  });
                                },
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                          "Please Enter Date Of Quality Check")
                                ])),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Supplier's RM Batch No.",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                controller: rMBatchNoController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Please Enter Supplier's RM Batch No.",
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                          "Please Enter Supplier's RM Batch No.")
                                ])),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Receipt Date",
                              style: AppStyles.textfieldCaptionTextStyle,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                                controller: receiptDateController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                        hintText: "Please Enter Receipt Date",
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
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime.now()))!;
                                  receiptDateController.text =
                                      DateFormat("EEE MMM dd, yyyy").format(
                                          DateTime.parse(date.toString()));
                                  setState(() {
                                    receiptDate = DateFormat("yyyy-MM-dd")
                                        .format(
                                            DateTime.parse(date.toString()));
                                  });
                                },
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Please Enter Receipt Date")
                                ])),
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
                                        fontSize: 16),
                                    onTap: () {
                                      AppHelper.hideKeyboard(context);
                                      _registerFormKey.currentState!.save;
                                      // if (_registerFormKey.currentState!
                                      //     .validate()) {
                                      //   setState(() {
                                      //     setPage = 'packaging';
                                      //   });
                                      // }
                                      setState(() {
                                        setPage = 'packaging';
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
                            //             fontFamily: appFontFamily,
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w500,
                            //             color: AppColors.redColor),
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
                                  Text("Powered By Gautam Solar Pvt. Ltd.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: appFontFamily,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  )
                : setPage == "packaging"
                    // Packaging
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            "Incoming Quality Control Plan",
                                            style: TextStyle(
                                                fontSize: 27,
                                                color: AppColors.black,
                                                fontFamily: appFontFamily,
                                                fontWeight: FontWeight.w700)))),
                                const Center(
                                    child: Text("(Solar Cell)",
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
                                      'GSPL/SC(IQC)/001',
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
                                      'Ver.2.0 / 13-03-2024',
                                      style:
                                          AppStyles.textfieldCaptionTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Center(
                                    child: Text("Packaging",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 13, 160, 0),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700))),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Characterstics",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: packagingCharactersticsController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
                                          ),
                                  style: AppStyles.textInputTextStyle,
                                  readOnly: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Measuring Method",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      packagingMeasuringMethodController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
                                          ),
                                  style: AppStyles.textInputTextStyle,
                                  readOnly: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Sampling",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: packagingSamplingController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
                                          ),
                                  style: AppStyles.textInputTextStyle,
                                  readOnly: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Sample Size",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: packagingSampleSizeController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
                                          ),
                                  style: AppStyles.textInputTextStyle,
                                  readOnly: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Reference Doc",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: packagingReferenceDocController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
                                          ),
                                  style: AppStyles.textInputTextStyle,
                                  readOnly: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Acceptance Criteria",
                                  style: AppStyles.textfieldCaptionTextStyle,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      packagingAcceptanceCriteriaController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          // hintText: "Please Enter Day Lot No.",
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
                                            fontSize: 16),
                                        onTap: () {
                                          AppHelper.hideKeyboard(context);
                                          // packagingFormkey.currentState!.save;
                                          // if (packagingFormkey.currentState!
                                          //     .validate()) {
                                          //   getdata(supplierNameController.text,
                                          //       context);
                                          // }

                                          setState(() {
                                            setPage = 'checkpackaging';
                                            numberOfPackagingSampleFields = 1;
                                          });

                                          // Dynamic Start......
                                          for (int i = 0;
                                              i < numberOfPackagingSampleFields;
                                              i++) {
                                            packagingBarcodeControllers
                                                .add(TextEditingController());
                                            packagingRemarksControllers
                                                .add(TextEditingController());
                                          }
                                          selectedPackagingTestValues = List<
                                                  bool>.generate(
                                              numberOfPackagingSampleFields,
                                              (index) =>
                                                  false); // Initialize all radio button values to false
                                          // selectedPackagingTestValues[0] = true; // Initially select the first option
                                          _formKey = GlobalKey<FormState>();

                                          // Dynamic  End......
                                        },
                                        label: "Check",
                                        organization: '',
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          setPage = "heading";
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Powered By Gautam Solar Pvt. Ltd.",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: appFontFamily,
                                              color: AppColors.greyColor,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                        ],
                      )
                    : setPage == "checkpackaging"
                        ? Scaffold(
                            body: Form(
                              key: _formKey,
                              child: ListView.builder(
                                itemCount: numberOfPackagingSampleFields,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "Sample ${index + 1}",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(height: 8),
                                        //  if (barcodeScanRes != '-1')
                                        TextFormField(
                                          controller:
                                              packagingBarcodeControllers[
                                                  index],
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                            hintText:
                                                "Please Scan Sample Barcode",
                                            counterText: '',
                                            contentPadding: EdgeInsets.all(10),
                                            suffixIcon: IconButton(
                                              onPressed: () async {
                                                barcodeScanRes =
                                                    await FlutterBarcodeScanner
                                                        .scanBarcode(
                                                  '#FF6666',
                                                  'Cancel',
                                                  true,
                                                  ScanMode.DEFAULT,
                                                );

                                                setState(() {
                                                  packagingBarcodeControllers[
                                                              index]
                                                          .text =
                                                      (barcodeScanRes != "-1"
                                                          ? barcodeScanRes
                                                          : '')!;
                                                });
                                              },
                                              icon: const Icon(Icons.qr_code),
                                            ),
                                          ),
                                          readOnly: true,
                                          style: AppStyles.textInputTextStyle,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Scan Sample Barcode.';
                                            }
                                            return null;
                                          },
                                        ),

                                        const SizedBox(
                                            height:
                                                8), // Add space between TextFormField and Radio Buttons
                                        Row(
                                          children: [
                                            Radio(
                                              value: true,
                                              groupValue:
                                                  selectedPackagingTestValues[
                                                      index],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  selectedPackagingTestValues[
                                                      index] = value!;
                                                });
                                              },
                                            ),
                                            Text(
                                              'True',
                                              style: AppStyles
                                                  .textfieldCaptionTextStyle,
                                            ),
                                            const SizedBox(width: 8),
                                            Radio(
                                              value: false,
                                              groupValue:
                                                  selectedPackagingTestValues[
                                                      index],
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  selectedPackagingTestValues[
                                                      index] = value!;
                                                });
                                              },
                                            ),
                                            Text(
                                              'False',
                                              style: AppStyles
                                                  .textfieldCaptionTextStyle,
                                            ),
                                          ],
                                        ),
                                        if (selectedPackagingTestValues[
                                                index] ==
                                            false)
                                          const SizedBox(height: 8),
                                        if (selectedPackagingTestValues[
                                                index] ==
                                            false)
                                          TextFormField(
                                            controller:
                                                packagingRemarksControllers[
                                                    index],
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Please Enter Remarks",
                                              counterText: '',
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Enter Remarks.';
                                              }
                                              return null;
                                            },
                                          ),

                                        const SizedBox(height: 8),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: AppColors.dividerColor,
                                          height: 1,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            floatingActionButton: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  numberOfPackagingSampleFields++; // Increment the number of fields
                                  packagingBarcodeControllers
                                      .add(TextEditingController());
                                  packagingRemarksControllers
                                      .add(TextEditingController());
                                  selectedPackagingTestValues.add(false);
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            bottomNavigationBar: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        setPage = "packaging";
                                      });
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
                                  ElevatedButton(
                                    onPressed: () {
                                      // Validate the form
                                      // if (_formKey.currentState!.validate()) {
                                      //   // Perform action on submit button press
                                      //   print('Text Field Values:');
                                      //   for (int i = 0;
                                      //       i < numberOfPackagingSampleFields;
                                      //       i++) {
                                      //     packagingSampleData.add(
                                      //         '{PackageSampleBarcode${i + 1}: ${packagingBarcodeControllers[i].text}, PackageSampleTest${i + 1}: ${selectedPackagingTestValues[i]}, {PackageSampleRemarks${i + 1}: ${packagingRemarksControllers[i].text}}');
                                      //   }
                                      //   print(packagingSampleData);
                                      //   setState(() {
                                      //     setPage = "packagingresult";
                                      //   });
                                      // }
                                      setState(() {
                                        setPage = "visual";
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255,
                                          134, 8, 4), // Set button color to red
                                    ),
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Set text color to white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : setPage == "visual"
                            // Start Visual Block.....................................................................
                            ? Stack(
                                alignment: Alignment.center,
                                fit: StackFit.expand,
                                children: [
                                  SingleChildScrollView(
                                      child: Form(
                                    key: _visualFormKey,
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
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                    "Incoming Quality Control Plan",
                                                    style: TextStyle(
                                                        fontSize: 27,
                                                        color: AppColors.black,
                                                        fontFamily:
                                                            appFontFamily,
                                                        fontWeight:
                                                            FontWeight.w700)))),
                                        const Center(
                                            child: Text("(Solar Cell)",
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
                                              'GSPL/SC(IQC)/001',
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
                                              'Ver.2.0 / 13-03-2024',
                                              style: AppStyles
                                                  .textfieldCaptionTextStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Center(
                                            child: Text("Visual",
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
                                          "Characterstics",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller:
                                              visualCharactersticsController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                                  // hintText: "Please Enter Day Lot No.",
                                                  ),
                                          maxLines: 2,
                                          style: AppStyles.textInputTextStyle,
                                          readOnly: true,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Measuring Method",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller:
                                              visualMeasuringMethodController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                                  // hintText: "Please Enter Day Lot No.",
                                                  ),
                                          style: AppStyles.textInputTextStyle,
                                          readOnly: true,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Sampling",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller: visualSamplingController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                                  // hintText: "Please Enter Day Lot No.",
                                                  ),
                                          style: AppStyles.textInputTextStyle,
                                          readOnly: true,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Sample Size*",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                            controller:
                                                visualSampleSizeController,
                                            keyboardType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Sample Size",
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: false,
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText:
                                                      "Please Enter Sample Size.")
                                            ])
                                            // bikki
                                            ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Reference Doc",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller:
                                              visualReferenceDocController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                                  // hintText: "Please Enter Day Lot No.",
                                                  ),
                                          style: AppStyles.textInputTextStyle,
                                          readOnly: true,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Acceptance Criteria",
                                          style: AppStyles
                                              .textfieldCaptionTextStyle,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller:
                                              visualAcceptanceCriteriaController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          decoration: AppStyles
                                              .textFieldInputDecoration
                                              .copyWith(
                                                  // hintText: "Please Enter Day Lot No.",
                                                  ),
                                          maxLines: 2,
                                          style: AppStyles.textInputTextStyle,
                                          readOnly: true,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0)),
                                        _isLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : AppButton(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.white,
                                                    fontSize: 16),
                                                onTap: () {
                                                  AppHelper.hideKeyboard(
                                                      context);
                                                  _visualFormKey
                                                      .currentState!.save;
                                                  if (_visualFormKey
                                                      .currentState!
                                                      .validate()) {
                                                    // ignore: unnecessary_null_comparison
                                                    if (visualSampleSizeController
                                                            .text !=
                                                        "") {
                                                      int num = int.parse(
                                                          visualSampleSizeController
                                                              .text);
                                                      setState(() {
                                                        setPage = 'checkvisual';
                                                        numberOfVisualSampleFields =
                                                            num;
                                                      });
                                                    }
                                                  }
                                                  print("Bhanuuuuuuuuuu");
                                                  print(
                                                      visualSampleSizeController
                                                          .text);

                                                  // Dynamic Start......
                                                  for (int i = 0;
                                                      i < numberOfVisualSampleFields;
                                                      i++) {
                                                    visualBarcodeControllers.add(
                                                        TextEditingController());
                                                    visualRemarksControllers.add(
                                                        TextEditingController());
                                                  }
                                                  selectedVisualTestValues = List<
                                                          bool>.generate(
                                                      numberOfVisualSampleFields,
                                                      (index) =>
                                                          false); // Initialize all radio button values to false
                                                  // selectedVisualTestValues[0] = true; // Initially select the first option

                                                  _visualFormKey =
                                                      GlobalKey<FormState>();

                                                  // Dynamic  End......
                                                },
                                                label: "Check",
                                                organization: '',
                                              ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  setPage = "checkpackaging";
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
                                                      color:
                                                          AppColors.greyColor,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ],
                              )
                            : setPage == "checkvisual"
                                ? Scaffold(
                                    body: Form(
                                      key: _visualsampleformKey,
                                      child: ListView.builder(
                                        itemCount: numberOfVisualSampleFields,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Text(
                                                  "Sample ${index + 1}",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(height: 8),
                                                //  if (barcodeScanRes != '-1')
                                                TextFormField(
                                                  controller:
                                                      visualBarcodeControllers[
                                                          index],
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                    hintText:
                                                        "Please Scan Sample Barcode",
                                                    counterText: '',
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    suffixIcon: IconButton(
                                                      onPressed: () async {
                                                        barcodeScanRes =
                                                            await FlutterBarcodeScanner
                                                                .scanBarcode(
                                                          '#FF6666',
                                                          'Cancel',
                                                          true,
                                                          ScanMode.DEFAULT,
                                                        );

                                                        setState(() {
                                                          visualBarcodeControllers[
                                                                      index]
                                                                  .text =
                                                              (barcodeScanRes !=
                                                                      "-1"
                                                                  ? barcodeScanRes
                                                                  : '')!;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.qr_code),
                                                    ),
                                                  ),
                                                  readOnly: true,
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Scan Sample Barcode.';
                                                    }
                                                    return null;
                                                  },
                                                ),

                                                const SizedBox(
                                                    height:
                                                        8), // Add space between TextFormField and Radio Buttons
                                                Row(
                                                  children: [
                                                    Radio(
                                                      value: true,
                                                      groupValue:
                                                          selectedVisualTestValues[
                                                              index],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          selectedVisualTestValues[
                                                              index] = value!;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'True',
                                                      style: AppStyles
                                                          .textfieldCaptionTextStyle,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Radio(
                                                      value: false,
                                                      groupValue:
                                                          selectedVisualTestValues[
                                                              index],
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          selectedVisualTestValues[
                                                              index] = value!;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      'False',
                                                      style: AppStyles
                                                          .textfieldCaptionTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                if (selectedVisualTestValues[
                                                        index] ==
                                                    false)
                                                  const SizedBox(height: 8),
                                                if (selectedVisualTestValues[
                                                        index] ==
                                                    false)
                                                  TextFormField(
                                                    controller:
                                                        visualRemarksControllers[
                                                            index],
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Remarks",
                                                      counterText: '',
                                                      contentPadding:
                                                          EdgeInsets.all(10),
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Enter Remarks.';
                                                      }
                                                      return null;
                                                    },
                                                  ),

                                                const SizedBox(height: 8),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: AppColors.dividerColor,
                                                  height: 1,
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    bottomNavigationBar: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                setPage = "visual";
                                              });
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
                                          ElevatedButton(
                                            onPressed: () {
                                              _visualsampleformKey
                                                  .currentState!.save;

                                              // Validate the form
                                              // if (_visualsampleformKey
                                              //     .currentState!
                                              //     .validate()) {
                                              //   // Perform action on submit button press
                                              //   print('Text Field Values:');
                                              //   for (int i = 0;
                                              //       i < numberOfVisualSampleFields;
                                              //       i++) {
                                              //     visualSampleData.add(
                                              //         '{VisualSampleBarcode${i + 1}: ${visualBarcodeControllers[i].text}, VisualSampleTest${i + 1}: ${selectedVisualTestValues[i]}, {VisualSampleRemarks${i + 1}: ${visualRemarksControllers[i].text}}');
                                              //   }
                                              //   print(visualSampleData);
                                              //   setState(() {
                                              //     setPage = "physical";
                                              //   });
                                              // }
                                              setState(() {
                                                setPage = "physical";
                                              });
                                              _visualsampleformKey =
                                                  GlobalKey<FormState>();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color
                                                  .fromARGB(255, 134, 8,
                                                  4), // Set button color to red
                                            ),
                                            child: const Text(
                                              'Next',
                                              style: TextStyle(
                                                color: Colors
                                                    .white, // Set text color to white
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : setPage == "physical"
                                    // Start Physical Block.....................................................................
                                    ? Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.expand,
                                        children: [
                                          SingleChildScrollView(
                                              child: Form(
                                            key: _physicalFormKey,
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
                                                const Center(
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: Text(
                                                            "Incoming Quality Control Plan",
                                                            style: TextStyle(
                                                                fontSize: 27,
                                                                color: AppColors
                                                                    .black,
                                                                fontFamily:
                                                                    appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)))),
                                                const Center(
                                                    child: Text("(Solar Cell)",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                AppColors.black,
                                                            fontFamily:
                                                                appFontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
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
                                                      'GSPL/SC(IQC)/001',
                                                      style: AppStyles
                                                          .textfieldCaptionTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
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
                                                      'Ver.2.0 / 13-03-2024',
                                                      style: AppStyles
                                                          .textfieldCaptionTextStyle,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Center(
                                                    child: Text("Physical",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    13,
                                                                    160,
                                                                    0),
                                                            fontFamily:
                                                                appFontFamily,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  "Characterstics",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      physicalCharactersticsController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                          // hintText: "Please Enter Day Lot No.",
                                                          ),
                                                  maxLines: 2,
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  readOnly: true,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Measuring Method",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      physicalMeasuringMethodController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                          // hintText: "Please Enter Day Lot No.",
                                                          ),
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  readOnly: true,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Sampling",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      physicalSamplingController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                          // hintText: "Please Enter Day Lot No.",
                                                          ),
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  readOnly: true,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Sample Size*",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                    controller:
                                                        physicalSampleSizeController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Sample Size",
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    readOnly: false,
                                                    validator: MultiValidator([
                                                      RequiredValidator(
                                                          errorText:
                                                              "Please Enter Sample Size.")
                                                    ])
                                                    // bikki
                                                    ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Reference Doc",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      physicalReferenceDocController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                          // hintText: "Please Enter Day Lot No.",
                                                          ),
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  readOnly: true,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Acceptance Criteria",
                                                  style: AppStyles
                                                      .textfieldCaptionTextStyle,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                TextFormField(
                                                  controller:
                                                      physicalAcceptanceCriteriaController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: AppStyles
                                                      .textFieldInputDecoration
                                                      .copyWith(
                                                          // hintText: "Please Enter Day Lot No.",
                                                          ),
                                                  maxLines: 2,
                                                  style: AppStyles
                                                      .textInputTextStyle,
                                                  readOnly: true,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 0)),
                                                _isLoading
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                    : AppButton(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppColors
                                                                    .white,
                                                                fontSize: 16),
                                                        onTap: () {
                                                          AppHelper
                                                              .hideKeyboard(
                                                                  context);
                                                          _physicalFormKey
                                                              .currentState!
                                                              .save;
                                                          if (_physicalFormKey
                                                              .currentState!
                                                              .validate()) {
                                                            // ignore: unnecessary_null_comparison
                                                            if (physicalSampleSizeController
                                                                    .text !=
                                                                "") {
                                                              int num = int.parse(
                                                                  physicalSampleSizeController
                                                                      .text);
                                                              setState(() {
                                                                setPage =
                                                                    'checkphysical';
                                                                numberOfPhysicalSampleFields =
                                                                    num;
                                                              });
                                                            }
                                                          }

                                                          // Dynamic Start......
                                                          for (int i = 0;
                                                              i < numberOfPhysicalSampleFields;
                                                              i++) {
                                                            physicalBarcodeControllers
                                                                .add(
                                                                    TextEditingController());
                                                            physicalRemarksControllers
                                                                .add(
                                                                    TextEditingController());
                                                          }
                                                          selectedPhysicalTestValues = List<
                                                                  bool>.generate(
                                                              numberOfPhysicalSampleFields,
                                                              (index) =>
                                                                  false); // Initialize all radio button values to false
                                                          // selectedPhysicalTestValues[0] = true; // Initially select the first option

                                                          _physicalFormKey =
                                                              GlobalKey<
                                                                  FormState>();

                                                          // Dynamic  End......
                                                        },
                                                        label: "Check",
                                                        organization: '',
                                                      ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          setPage =
                                                              "checkvisual";
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                          "Powered By Gautam Solar Pvt. Ltd.",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  appFontFamily,
                                                              color: AppColors
                                                                  .greyColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                        ],
                                      )
                                    : setPage == "checkphysical"
                                        ? Scaffold(
                                            body: Form(
                                              key: _physicalsampleformKey,
                                              child: ListView.builder(
                                                itemCount:
                                                    numberOfPhysicalSampleFields,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          "Sample ${index + 1}",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        //  if (barcodeScanRes != '-1')
                                                        TextFormField(
                                                          controller:
                                                              physicalBarcodeControllers[
                                                                  index],
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                            hintText:
                                                                "Please Scan Sample Barcode",
                                                            counterText: '',
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            suffixIcon:
                                                                IconButton(
                                                              onPressed:
                                                                  () async {
                                                                barcodeScanRes =
                                                                    await FlutterBarcodeScanner
                                                                        .scanBarcode(
                                                                  '#FF6666',
                                                                  'Cancel',
                                                                  true,
                                                                  ScanMode
                                                                      .DEFAULT,
                                                                );

                                                                setState(() {
                                                                  physicalBarcodeControllers[
                                                                          index]
                                                                      .text = (barcodeScanRes !=
                                                                          "-1"
                                                                      ? barcodeScanRes
                                                                      : '')!;
                                                                });
                                                              },
                                                              icon: const Icon(
                                                                  Icons
                                                                      .qr_code),
                                                            ),
                                                          ),
                                                          readOnly: true,
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please Scan Sample Barcode.';
                                                            }
                                                            return null;
                                                          },
                                                        ),

                                                        const SizedBox(
                                                            height:
                                                                8), // Add space between TextFormField and Radio Buttons
                                                        Row(
                                                          children: [
                                                            Radio(
                                                              value: true,
                                                              groupValue:
                                                                  selectedPhysicalTestValues[
                                                                      index],
                                                              onChanged: (bool?
                                                                  value) {
                                                                setState(() {
                                                                  selectedPhysicalTestValues[
                                                                          index] =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              'True',
                                                              style: AppStyles
                                                                  .textfieldCaptionTextStyle,
                                                            ),
                                                            const SizedBox(
                                                                width: 8),
                                                            Radio(
                                                              value: false,
                                                              groupValue:
                                                                  selectedPhysicalTestValues[
                                                                      index],
                                                              onChanged: (bool?
                                                                  value) {
                                                                setState(() {
                                                                  selectedPhysicalTestValues[
                                                                          index] =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                            Text(
                                                              'False',
                                                              style: AppStyles
                                                                  .textfieldCaptionTextStyle,
                                                            ),
                                                          ],
                                                        ),

                                                        if (selectedPhysicalTestValues[
                                                                index] ==
                                                            false)
                                                          const SizedBox(
                                                              height: 8),
                                                        if (selectedPhysicalTestValues[
                                                                index] ==
                                                            false)
                                                          TextFormField(
                                                            controller:
                                                                physicalRemarksControllers[
                                                                    index],
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Remarks",
                                                              counterText: '',
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please Enter Remarks.';
                                                              }
                                                              return null;
                                                            },
                                                          ),

                                                        const SizedBox(
                                                            height: 8),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: AppColors
                                                              .dividerColor,
                                                          height: 1,
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            bottomNavigationBar: Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        setPage = "physical";
                                                      });
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
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      _physicalsampleformKey
                                                          .currentState!.save;

                                                      // Validate the form
                                                      // if (_physicalsampleformKey
                                                      //     .currentState!
                                                      //     .validate()) {
                                                      //   // Perform action on submit button press
                                                      //   print(
                                                      //       'Text Field Values:');
                                                      //   for (int i = 0;
                                                      //       i < numberOfPhysicalSampleFields;
                                                      //       i++) {
                                                      //     physicalSampleData
                                                      //         .add(
                                                      //             '{PhysicalSampleBarcode${i + 1}: ${physicalBarcodeControllers[i].text}, PhysicalSampleTest${i + 1}: ${selectedPhysicalTestValues[i]}, {PhysicalSampleRemarks${i + 1}: ${physicalRemarksControllers[i].text}}');
                                                      //   }
                                                      //   print(
                                                      //       physicalSampleData);
                                                      //   setState(() {
                                                      //     setPage =
                                                      //         "frontbus";
                                                      //   });
                                                      // }
                                                      setState(() {
                                                        setPage = "frontbus";
                                                      });
                                                      _physicalsampleformKey =
                                                          GlobalKey<
                                                              FormState>();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: const Color
                                                          .fromARGB(255, 134, 8,
                                                          4), // Set button color to red
                                                    ),
                                                    child: const Text(
                                                      'Next',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .white, // Set text color to white
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : setPage == "frontbus"
                                            // Start Front Bus Block.....................................................................
                                            ? Stack(
                                                alignment: Alignment.center,
                                                fit: StackFit.expand,
                                                children: [
                                                  SingleChildScrollView(
                                                      child: Form(
                                                    key: _frontbusFormKey,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
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
                                                                AppAssets
                                                                    .imgLogo,
                                                                height: 100,
                                                                width: 230,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Center(
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10),
                                                                child: Text(
                                                                    "Incoming Quality Control Plan",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            27,
                                                                        color: AppColors
                                                                            .black,
                                                                        fontFamily:
                                                                            appFontFamily,
                                                                        fontWeight:
                                                                            FontWeight.w700)))),
                                                        const Center(
                                                            child: Text(
                                                                "(Solar Cell)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: AppColors
                                                                        .black,
                                                                    fontFamily:
                                                                        appFontFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700))),
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
                                                              'GSPL/SC(IQC)/001',
                                                              style: AppStyles
                                                                  .textfieldCaptionTextStyle,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
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
                                                              'Ver.2.0 / 13-03-2024',
                                                              style: AppStyles
                                                                  .textfieldCaptionTextStyle,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                "Front Bus Bar Width and Back Bus Bar Width",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            13,
                                                                            160,
                                                                            0),
                                                                    fontFamily:
                                                                        appFontFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700))),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Text(
                                                          "Characterstics",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              frontbusCharactersticsController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                                  // hintText: "Please Enter Day Lot No.",
                                                                  ),
                                                          maxLines: 2,
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          readOnly: true,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Measuring Method",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              frontbusMeasuringMethodController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                                  // hintText: "Please Enter Day Lot No.",
                                                                  ),
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          readOnly: true,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Sampling",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              frontbusSamplingController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                                  // hintText: "Please Enter Day Lot No.",
                                                                  ),
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          readOnly: true,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Sample Size*",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                            controller:
                                                                frontbusSampleSizeController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Sample Size",
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: false,
                                                            validator:
                                                                MultiValidator([
                                                              RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Sample Size.")
                                                            ])
                                                            // bikki
                                                            ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Reference Doc",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              frontbusReferenceDocController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                                  // hintText: "Please Enter Day Lot No.",
                                                                  ),
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          readOnly: true,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "Acceptance Criteria",
                                                          style: AppStyles
                                                              .textfieldCaptionTextStyle,
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              frontbusAcceptanceCriteriaController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          decoration: AppStyles
                                                              .textFieldInputDecoration
                                                              .copyWith(
                                                                  // hintText: "Please Enter Day Lot No.",
                                                                  ),
                                                          maxLines: 2,
                                                          style: AppStyles
                                                              .textInputTextStyle,
                                                          readOnly: true,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 0)),
                                                        _isLoading
                                                            ? const Center(
                                                                child:
                                                                    CircularProgressIndicator())
                                                            : AppButton(
                                                                textStyle: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: AppColors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                                onTap: () {
                                                                  AppHelper
                                                                      .hideKeyboard(
                                                                          context);
                                                                  _frontbusFormKey
                                                                      .currentState!
                                                                      .save;
                                                                  if (_frontbusFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    // ignore: unnecessary_null_comparison
                                                                    if (frontbusSampleSizeController
                                                                            .text !=
                                                                        "") {
                                                                      int num =
                                                                          int.parse(
                                                                              frontbusSampleSizeController.text);
                                                                      setState(
                                                                          () {
                                                                        setPage =
                                                                            'checkfrontbus';
                                                                        numberOfFrontbusSampleFields =
                                                                            num;
                                                                      });
                                                                    }
                                                                  }

                                                                  // Dynamic Start......
                                                                  for (int i =
                                                                          0;
                                                                      i < numberOfFrontbusSampleFields;
                                                                      i++) {
                                                                    frontbusBarcodeControllers
                                                                        .add(
                                                                            TextEditingController());
                                                                    frontbusRemarksControllers
                                                                        .add(
                                                                            TextEditingController());
                                                                  }
                                                                  selectedFrontbusTestValues = List<
                                                                          bool>.generate(
                                                                      numberOfFrontbusSampleFields,
                                                                      (index) =>
                                                                          false); // Initialize all radio button values to false
                                                                  // selectedPhysicalTestValues[0] = true; // Initially select the first option

                                                                  _frontbusFormKey =
                                                                      GlobalKey<
                                                                          FormState>();

                                                                  // Dynamic  End......
                                                                },
                                                                label: "Check",
                                                                organization:
                                                                    '',
                                                              ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  setPage =
                                                                      "checkphysical";
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
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
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
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                  "Powered By Gautam Solar Pvt. Ltd.",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          appFontFamily,
                                                                      color: AppColors
                                                                          .greyColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400)),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                                ],
                                              )
                                            : setPage == "checkfrontbus"
                                                ? Scaffold(
                                                    body: Form(
                                                      key:
                                                          _frontbussampleformKey,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            numberOfFrontbusSampleFields,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Text(
                                                                  "Sample ${index + 1}",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                //  if (barcodeScanRes != '-1')
                                                                TextFormField(
                                                                  controller:
                                                                      frontbusBarcodeControllers[
                                                                          index],
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                    hintText:
                                                                        "Please Scan Sample Barcode",
                                                                    counterText:
                                                                        '',
                                                                    contentPadding:
                                                                        EdgeInsets.all(
                                                                            10),
                                                                    suffixIcon:
                                                                        IconButton(
                                                                      onPressed:
                                                                          () async {
                                                                        barcodeScanRes =
                                                                            await FlutterBarcodeScanner.scanBarcode(
                                                                          '#FF6666',
                                                                          'Cancel',
                                                                          true,
                                                                          ScanMode
                                                                              .DEFAULT,
                                                                        );

                                                                        setState(
                                                                            () {
                                                                          frontbusBarcodeControllers[index]
                                                                              .text = (barcodeScanRes !=
                                                                                  "-1"
                                                                              ? barcodeScanRes
                                                                              : '')!;
                                                                        });
                                                                      },
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .qr_code),
                                                                    ),
                                                                  ),
                                                                  readOnly:
                                                                      true,
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty) {
                                                                      return 'Please Scan Sample Barcode.';
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),

                                                                const SizedBox(
                                                                    height:
                                                                        8), // Add space between TextFormField and Radio Buttons
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      value:
                                                                          true,
                                                                      groupValue:
                                                                          selectedFrontbusTestValues[
                                                                              index],
                                                                      onChanged:
                                                                          (bool?
                                                                              value) {
                                                                        setState(
                                                                            () {
                                                                          selectedFrontbusTestValues[index] =
                                                                              value!;
                                                                        });
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      'True',
                                                                      style: AppStyles
                                                                          .textfieldCaptionTextStyle,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            8),
                                                                    Radio(
                                                                      value:
                                                                          false,
                                                                      groupValue:
                                                                          selectedFrontbusTestValues[
                                                                              index],
                                                                      onChanged:
                                                                          (bool?
                                                                              value) {
                                                                        setState(
                                                                            () {
                                                                          selectedFrontbusTestValues[index] =
                                                                              value!;
                                                                        });
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      'False',
                                                                      style: AppStyles
                                                                          .textfieldCaptionTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (selectedFrontbusTestValues[
                                                                        index] ==
                                                                    false)
                                                                  const SizedBox(
                                                                      height:
                                                                          8),
                                                                if (selectedFrontbusTestValues[
                                                                        index] ==
                                                                    false)
                                                                  TextFormField(
                                                                    controller:
                                                                        frontbusRemarksControllers[
                                                                            index],
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Remarks",
                                                                      counterText:
                                                                          '',
                                                                      contentPadding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please Enter Remarks.';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  color: AppColors
                                                                      .dividerColor,
                                                                  height: 1,
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    bottomNavigationBar:
                                                        Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                setPage =
                                                                    "frontbus";
                                                              });
                                                            },
                                                            child: const Text(
                                                              "BACK",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      appFontFamily,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .redColor),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              _frontbussampleformKey
                                                                  .currentState!
                                                                  .save;

                                                              // Validate the form
                                                              // if (_frontbussampleformKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   // Perform action on submit button press
                                                              //   print(
                                                              //       'Text Field Values:');
                                                              //   for (int i =
                                                              //           0;
                                                              //       i < numberOfFrontbusSampleFields;
                                                              //       i++) {
                                                              //     frontbusSampleData
                                                              //         .add(
                                                              //             '{FrontbusSampleBarcode${i + 1}: ${frontbusBarcodeControllers[i].text}, FrontbusSampleTest${i + 1}: ${selectedFrontbusTestValues[i]}, {FrontbusSampleRemarks${i + 1}: ${frontbusRemarksControllers[i].text}}');
                                                              //   }

                                                              //   setState(
                                                              //       () {
                                                              //     setPage =
                                                              //         "verification";
                                                              //   });
                                                              // }

                                                              setState(() {
                                                                setPage =
                                                                    "verification";
                                                              });
                                                              _frontbussampleformKey =
                                                                  GlobalKey<
                                                                      FormState>();
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      134,
                                                                      8,
                                                                      4), // Set button color to red
                                                            ),
                                                            child: const Text(
                                                              'Next',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white, // Set text color to white
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : setPage == "verification"
                                                    // Start Verification Block.....................................................................
                                                    ? Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        fit: StackFit.expand,
                                                        children: [
                                                          SingleChildScrollView(
                                                              child: Form(
                                                            key:
                                                                _verificationFormKey,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .onUserInteraction,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <Widget>[
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        AppAssets
                                                                            .imgLogo,
                                                                        height:
                                                                            100,
                                                                        width:
                                                                            230,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const Center(
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                10),
                                                                        child: Text(
                                                                            "Incoming Quality Control Plan",
                                                                            style: TextStyle(
                                                                                fontSize: 27,
                                                                                color: AppColors.black,
                                                                                fontFamily: appFontFamily,
                                                                                fontWeight: FontWeight.w700)))),
                                                                const Center(
                                                                    child: Text(
                                                                        "(Solar Cell)",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color: AppColors
                                                                                .black,
                                                                            fontFamily:
                                                                                appFontFamily,
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
                                                                      'GSPL/SC(IQC)/001',
                                                                      style: AppStyles
                                                                          .textfieldCaptionTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
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
                                                                      'Ver.2.0 / 13-03-2024',
                                                                      style: AppStyles
                                                                          .textfieldCaptionTextStyle,
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                const Center(
                                                                    child: Text(
                                                                        "Verification",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                13,
                                                                                160,
                                                                                0),
                                                                            fontFamily:
                                                                                appFontFamily,
                                                                            fontWeight:
                                                                                FontWeight.w700))),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Text(
                                                                  "Characterstics",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      verificationCharactersticsController,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                          // hintText: "Please Enter Day Lot No.",
                                                                          ),
                                                                  maxLines: 2,
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Measuring Method",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      verificationMeasuringMethodController,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                          // hintText: "Please Enter Day Lot No.",
                                                                          ),
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Sampling",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      verificationSamplingController,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                          // hintText: "Please Enter Day Lot No.",
                                                                          ),
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Sample Size*",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                    controller:
                                                                        verificationSampleSizeController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Sample Size",
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        false,
                                                                    validator:
                                                                        MultiValidator([
                                                                      RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Sample Size.")
                                                                    ])
                                                                    // bikki
                                                                    ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Reference Doc",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      verificationReferenceDocController,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                          // hintText: "Please Enter Day Lot No.",
                                                                          ),
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Text(
                                                                  "Acceptance Criteria",
                                                                  style: AppStyles
                                                                      .textfieldCaptionTextStyle,
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                TextFormField(
                                                                  controller:
                                                                      verificationAcceptanceCriteriaController,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .next,
                                                                  decoration: AppStyles
                                                                      .textFieldInputDecoration
                                                                      .copyWith(
                                                                          // hintText: "Please Enter Day Lot No.",
                                                                          ),
                                                                  maxLines: 2,
                                                                  style: AppStyles
                                                                      .textInputTextStyle,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                const Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0)),
                                                                _isLoading
                                                                    ? const Center(
                                                                        child:
                                                                            CircularProgressIndicator())
                                                                    : AppButton(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color: AppColors.white,
                                                                            fontSize: 16),
                                                                        onTap:
                                                                            () {
                                                                          AppHelper.hideKeyboard(
                                                                              context);
                                                                          _verificationFormKey
                                                                              .currentState!
                                                                              .save;
                                                                          if (_verificationFormKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            // ignore: unnecessary_null_comparison
                                                                            if (verificationSampleSizeController.text !=
                                                                                "") {
                                                                              int num = int.parse(verificationSampleSizeController.text);
                                                                              setState(() {
                                                                                setPage = 'checkverification';
                                                                                numberOfVerificationSampleFields = num;
                                                                              });
                                                                            }
                                                                          }

                                                                          // Dynamic Start......
                                                                          for (int i = 0;
                                                                              i < numberOfVerificationSampleFields;
                                                                              i++) {
                                                                            verificationBarcodeControllers.add(TextEditingController());
                                                                            verificationRemarksControllers.add(TextEditingController());
                                                                          }
                                                                          selectedVerificationTestValues = List<bool>.generate(
                                                                              numberOfVerificationSampleFields,
                                                                              (index) => false); // Initialize all radio button values to false
                                                                          // selectedPhysicalTestValues[0] = true; // Initially select the first option

                                                                          _verificationFormKey =
                                                                              GlobalKey<FormState>();

                                                                          // Dynamic  End......
                                                                        },
                                                                        label:
                                                                            "Check",
                                                                        organization:
                                                                            '',
                                                                      ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Center(
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          setPage =
                                                                              "checkfrontbus";
                                                                        });
                                                                        // Navigator.of(context).pushReplacement(
                                                                        //     MaterialPageRoute(
                                                                        //         builder: (BuildContext context) =>
                                                                        //             LoginPage(
                                                                        //                 appName: widget.appName)));
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "BACK",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                appFontFamily,
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: AppColors.redColor),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 25,
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          "Powered By Gautam Solar Pvt. Ltd.",
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: appFontFamily,
                                                                              color: AppColors.greyColor,
                                                                              fontWeight: FontWeight.w400)),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )),
                                                        ],
                                                      )
                                                    : setPage ==
                                                            "checkverification"
                                                        ? Scaffold(
                                                            body: Form(
                                                              key:
                                                                  _verificationsampleformKey,
                                                              child: ListView
                                                                  .builder(
                                                                itemCount:
                                                                    numberOfVerificationSampleFields,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        Text(
                                                                          "Sample ${index + 1}",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                8),

                                                                        TextFormField(
                                                                          controller:
                                                                              verificationBarcodeControllers[index],
                                                                          decoration: AppStyles
                                                                              .textFieldInputDecoration
                                                                              .copyWith(
                                                                            hintText:
                                                                                "Please Scan Sample Barcode",
                                                                            counterText:
                                                                                '',
                                                                            contentPadding:
                                                                                EdgeInsets.all(10),
                                                                            suffixIcon:
                                                                                IconButton(
                                                                              onPressed: () async {
                                                                                barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                                                  '#FF6666',
                                                                                  'Cancel',
                                                                                  true,
                                                                                  ScanMode.DEFAULT,
                                                                                );

                                                                                setState(() {
                                                                                  verificationBarcodeControllers[index].text = (barcodeScanRes != "-1" ? barcodeScanRes : '')!;
                                                                                });
                                                                              },
                                                                              icon: const Icon(Icons.qr_code),
                                                                            ),
                                                                          ),
                                                                          readOnly:
                                                                              true,
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          validator:
                                                                              (value) {
                                                                            if (value == null ||
                                                                                value.isEmpty) {
                                                                              return 'Please Scan Sample Barcode.';
                                                                            }
                                                                            return null;
                                                                          },
                                                                        ),

                                                                        const SizedBox(
                                                                            height:
                                                                                8), // Add space between TextFormField and Radio Buttons
                                                                        Row(
                                                                          children: [
                                                                            Radio(
                                                                              value: true,
                                                                              groupValue: selectedVerificationTestValues[index],
                                                                              onChanged: (bool? value) {
                                                                                setState(() {
                                                                                  selectedVerificationTestValues[index] = value!;
                                                                                });
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              'True',
                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                            ),
                                                                            const SizedBox(width: 8),
                                                                            Radio(
                                                                              value: false,
                                                                              groupValue: selectedVerificationTestValues[index],
                                                                              onChanged: (bool? value) {
                                                                                setState(() {
                                                                                  selectedVerificationTestValues[index] = value!;
                                                                                });
                                                                              },
                                                                            ),
                                                                            Text(
                                                                              'False',
                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (selectedVerificationTestValues[index] ==
                                                                            false)
                                                                          const SizedBox(
                                                                              height: 8),
                                                                        if (selectedVerificationTestValues[index] ==
                                                                            false)
                                                                          TextFormField(
                                                                            controller:
                                                                                verificationRemarksControllers[index],
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Remarks",
                                                                              counterText: '',
                                                                              contentPadding: EdgeInsets.all(10),
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                (value) {
                                                                              if (value == null || value.isEmpty) {
                                                                                return 'Please Enter Remarks.';
                                                                              }
                                                                              return null;
                                                                            },
                                                                          ),
                                                                        const SizedBox(
                                                                            height:
                                                                                8),
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          color:
                                                                              AppColors.dividerColor,
                                                                          height:
                                                                              1,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            bottomNavigationBar:
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      14.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        setPage =
                                                                            "verification";
                                                                      });
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "BACK",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              appFontFamily,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.redColor),
                                                                    ),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      _verificationsampleformKey
                                                                          .currentState!
                                                                          .save;

                                                                      // Validate the form
                                                                      // if (_verificationsampleformKey
                                                                      //     .currentState!
                                                                      //     .validate()) {
                                                                      //   // Perform action on submit button press
                                                                      //   print('Text Field Values:');
                                                                      //   for (int i = 0;
                                                                      //       i < numberOfVerificationSampleFields;
                                                                      //       i++) {
                                                                      //     verificationSampleData.add('{VerificationSampleBarcode${i + 1}: ${verificationBarcodeControllers[i].text}, VerificationSampleTest${i + 1}: ${selectedVerificationTestValues[i]}, {VerificationSampleRemarks${i + 1}: ${verificationRemarksControllers[i].text}}');
                                                                      //   }

                                                                      //   setState(() {
                                                                      //     setPage = "electrical";
                                                                      //   });
                                                                      // }
                                                                      setState(
                                                                          () {
                                                                        setPage =
                                                                            "electrical";
                                                                      });
                                                                      _verificationsampleformKey =
                                                                          GlobalKey<
                                                                              FormState>();
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          134,
                                                                          8,
                                                                          4), // Set button color to red
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      'Next',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white, // Set text color to white
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        : setPage ==
                                                                "electrical"
                                                            // Start Electrical Block.....................................................................
                                                            ? Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                fit: StackFit
                                                                    .expand,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                      child:
                                                                          Form(
                                                                    key:
                                                                        _electricalFormKey,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Column(
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
                                                                            child:
                                                                                Padding(padding: EdgeInsets.only(top: 10), child: Text("Incoming Quality Control Plan", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                        const Center(
                                                                            child:
                                                                                Text("(Solar Cell)", style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                        const SizedBox(
                                                                          height:
                                                                              35,
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
                                                                              'GSPL/SC(IQC)/001',
                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              8,
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
                                                                              'Ver.2.0 / 13-03-2024',
                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        const Center(
                                                                            child:
                                                                                Text("Electrical", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 13, 160, 0), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        Text(
                                                                          "Characterstics",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              electricalCharactersticsController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                              // hintText: "Please Enter Day Lot No.",
                                                                              ),
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          readOnly:
                                                                              true,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Text(
                                                                          "Measuring Method",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              electricalMeasuringMethodController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                              // hintText: "Please Enter Day Lot No.",
                                                                              ),
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          readOnly:
                                                                              true,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Text(
                                                                          "Sampling",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              electricalSamplingController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                              // hintText: "Please Enter Day Lot No.",
                                                                              ),
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          readOnly:
                                                                              true,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Text(
                                                                          "Sample Size*",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                            controller:
                                                                                electricalSampleSizeController,
                                                                            keyboardType: TextInputType
                                                                                .number,
                                                                            textInputAction: TextInputAction
                                                                                .next,
                                                                            decoration: AppStyles.textFieldInputDecoration
                                                                                .copyWith(
                                                                              hintText: "Please Enter Sample Size",
                                                                            ),
                                                                            style: AppStyles
                                                                                .textInputTextStyle,
                                                                            readOnly:
                                                                                false,
                                                                            validator:
                                                                                MultiValidator([
                                                                              RequiredValidator(errorText: "Please Enter Sample Size.")
                                                                            ])
                                                                            // bikki
                                                                            ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Text(
                                                                          "Reference Doc",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              electricalReferenceDocController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                              // hintText: "Please Enter Day Lot No.",
                                                                              ),
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          readOnly:
                                                                              true,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Text(
                                                                          "Acceptance Criteria",
                                                                          style:
                                                                              AppStyles.textfieldCaptionTextStyle,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        TextFormField(
                                                                          controller:
                                                                              electricalAcceptanceCriteriaController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                              // hintText: "Please Enter Day Lot No.",
                                                                              ),
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              AppStyles.textInputTextStyle,
                                                                          readOnly:
                                                                              true,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        const Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                10,
                                                                                0,
                                                                                0)),
                                                                        _isLoading
                                                                            ? const Center(child: CircularProgressIndicator())
                                                                            : AppButton(
                                                                                textStyle: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 16),
                                                                                onTap: () {
                                                                                  AppHelper.hideKeyboard(context);
                                                                                  _electricalFormKey.currentState!.save;
                                                                                  if (_electricalFormKey.currentState!.validate()) {
                                                                                    // ignore: unnecessary_null_comparison
                                                                                    if (electricalSampleSizeController.text != "") {
                                                                                      int num = int.parse(electricalSampleSizeController.text);
                                                                                      setState(() {
                                                                                        setPage = 'checkelectrical';
                                                                                        numberOfElectricalSampleFields = num;
                                                                                      });
                                                                                    }
                                                                                  }

                                                                                  // Dynamic Start......
                                                                                  for (int i = 0; i < numberOfElectricalSampleFields; i++) {
                                                                                    electricalBarcodeControllers.add(TextEditingController());
                                                                                    electricalRemarksControllers.add(TextEditingController());
                                                                                  }
                                                                                  selectedElectricalTestValues = List<bool>.generate(numberOfElectricalSampleFields, (index) => false); // Initialize all radio button values to false
                                                                                  // selectedPhysicalTestValues[0] = true; // Initially select the first option

                                                                                  _electricalFormKey = GlobalKey<FormState>();

                                                                                  // Dynamic  End......
                                                                                },
                                                                                label: "Check",
                                                                                organization: '',
                                                                              ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  setPage = "checkverification";
                                                                                });
                                                                                // Navigator.of(context).pushReplacement(
                                                                                //     MaterialPageRoute(
                                                                                //         builder: (BuildContext context) =>
                                                                                //             LoginPage(
                                                                                //                 appName: widget.appName)));
                                                                              },
                                                                              child: const Text(
                                                                                "BACK",
                                                                                style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              25,
                                                                        ),
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              const Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text("Powered By Gautam Solar Pvt. Ltd.", style: TextStyle(fontSize: 14, fontFamily: appFontFamily, color: AppColors.greyColor, fontWeight: FontWeight.w400)),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )),
                                                                ],
                                                              )
                                                            : setPage ==
                                                                    "checkelectrical"
                                                                ? Scaffold(
                                                                    body: Form(
                                                                      key:
                                                                          _electricalsampleformKey,
                                                                      child: ListView
                                                                          .builder(
                                                                        itemCount:
                                                                            numberOfElectricalSampleFields,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                              children: [
                                                                                Text(
                                                                                  "Sample ${index + 1}",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(height: 8),

                                                                                TextFormField(
                                                                                  controller: electricalBarcodeControllers[index],
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                    hintText: "Please Scan Sample Barcode",
                                                                                    counterText: '',
                                                                                    contentPadding: EdgeInsets.all(10),
                                                                                    suffixIcon: IconButton(
                                                                                      onPressed: () async {
                                                                                        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                                                          '#FF6666',
                                                                                          'Cancel',
                                                                                          true,
                                                                                          ScanMode.DEFAULT,
                                                                                        );

                                                                                        setState(() {
                                                                                          electricalBarcodeControllers[index].text = (barcodeScanRes != "-1" ? barcodeScanRes : '')!;
                                                                                        });
                                                                                      },
                                                                                      icon: const Icon(Icons.qr_code),
                                                                                    ),
                                                                                  ),
                                                                                  readOnly: true,
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  validator: (value) {
                                                                                    if (value == null || value.isEmpty) {
                                                                                      return 'Please Scan Sample Barcode.';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                ),

                                                                                const SizedBox(height: 8), // Add space between TextFormField and Radio Buttons
                                                                                Row(
                                                                                  children: [
                                                                                    Radio(
                                                                                      value: true,
                                                                                      groupValue: selectedElectricalTestValues[index],
                                                                                      onChanged: (bool? value) {
                                                                                        setState(() {
                                                                                          selectedElectricalTestValues[index] = value!;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Text(
                                                                                      'True',
                                                                                      style: AppStyles.textfieldCaptionTextStyle,
                                                                                    ),
                                                                                    const SizedBox(width: 8),
                                                                                    Radio(
                                                                                      value: false,
                                                                                      groupValue: selectedElectricalTestValues[index],
                                                                                      onChanged: (bool? value) {
                                                                                        setState(() {
                                                                                          selectedElectricalTestValues[index] = value!;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Text(
                                                                                      'False',
                                                                                      style: AppStyles.textfieldCaptionTextStyle,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (selectedElectricalTestValues[index] == false) const SizedBox(height: 8),
                                                                                if (selectedElectricalTestValues[index] == false)
                                                                                  TextFormField(
                                                                                    controller: electricalRemarksControllers[index],
                                                                                    decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      hintText: "Please Enter Remarks",
                                                                                      counterText: '',
                                                                                      contentPadding: EdgeInsets.all(10),
                                                                                    ),
                                                                                    style: AppStyles.textInputTextStyle,
                                                                                    validator: (value) {
                                                                                      if (value == null || value.isEmpty) {
                                                                                        return 'Please Enter Remarks.';
                                                                                      }
                                                                                      return null;
                                                                                    },
                                                                                  ),
                                                                                const SizedBox(height: 8),
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  color: AppColors.dividerColor,
                                                                                  height: 1,
                                                                                )
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    bottomNavigationBar:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          14.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                setPage = "electrical";
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "BACK",
                                                                              style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                            ),
                                                                          ),
                                                                          ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              _electricalsampleformKey.currentState!.save;

                                                                              // Validate the form
                                                                              // if (_electricalsampleformKey.currentState!.validate()) {
                                                                              //   // Perform action on submit button press
                                                                              //   print('Text Field Values:');
                                                                              //   for (int i = 0; i < numberOfElectricalSampleFields; i++) {
                                                                              //     electricalSampleData.add('{ElectricalSampleBarcode${i + 1}: ${electricalBarcodeControllers[i].text}, ElectricalSampleTest${i + 1}: ${selectedElectricalTestValues[i]}, {ElectricalSampleRemarks${i + 1}: ${electricalRemarksControllers[i].text}}');
                                                                              //   }

                                                                              //   setState(() {
                                                                              //     setPage = "performance";
                                                                              //   });
                                                                              // }
                                                                              setState(() {
                                                                                setPage = "performance";
                                                                              });
                                                                              _electricalsampleformKey = GlobalKey<FormState>();
                                                                            },
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: const Color.fromARGB(255, 134, 8, 4), // Set button color to red
                                                                            ),
                                                                            child:
                                                                                const Text(
                                                                              'Next',
                                                                              style: TextStyle(
                                                                                color: Colors.white, // Set text color to white
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                : setPage ==
                                                                        "performance"
                                                                    // Start Performance Block.....................................................................
                                                                    ? Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        fit: StackFit
                                                                            .expand,
                                                                        children: [
                                                                          SingleChildScrollView(
                                                                              child: Form(
                                                                            key:
                                                                                _performanceFormKey,
                                                                            autovalidateMode:
                                                                                AutovalidateMode.onUserInteraction,
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
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
                                                                                const Center(child: Padding(padding: EdgeInsets.only(top: 10), child: Text("Incoming Quality Control Plan", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                                const Center(child: Text("(Solar Cell)", style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
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
                                                                                      'GSPL/SC(IQC)/001',
                                                                                      style: AppStyles.textfieldCaptionTextStyle,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                const SizedBox(
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
                                                                                      'Ver.2.0 / 13-03-2024',
                                                                                      style: AppStyles.textfieldCaptionTextStyle,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                const Center(child: Text("Performance", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 13, 160, 0), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                                const SizedBox(
                                                                                  height: 20,
                                                                                ),
                                                                                Text(
                                                                                  "Characterstics",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                  controller: performanceCharactersticsController,
                                                                                  keyboardType: TextInputType.text,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      // hintText: "Please Enter Day Lot No.",
                                                                                      ),
                                                                                  maxLines: 2,
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  readOnly: true,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  "Measuring Method",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                  controller: performanceMeasuringMethodController,
                                                                                  keyboardType: TextInputType.text,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      // hintText: "Please Enter Day Lot No.",
                                                                                      ),
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  readOnly: true,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  "Sampling",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                  controller: performanceSamplingController,
                                                                                  keyboardType: TextInputType.text,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      // hintText: "Please Enter Day Lot No.",
                                                                                      ),
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  readOnly: true,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  "Sample Size*",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                    controller:
                                                                                        performanceSampleSizeController,
                                                                                    keyboardType: TextInputType
                                                                                        .number,
                                                                                    textInputAction: TextInputAction
                                                                                        .next,
                                                                                    decoration: AppStyles.textFieldInputDecoration
                                                                                        .copyWith(
                                                                                      hintText: "Please Enter Sample Size",
                                                                                    ),
                                                                                    style: AppStyles
                                                                                        .textInputTextStyle,
                                                                                    readOnly:
                                                                                        false,
                                                                                    validator: MultiValidator([
                                                                                      RequiredValidator(errorText: "Please Enter Sample Size.")
                                                                                    ])
                                                                                    // bikki
                                                                                    ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  "Reference Doc",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                  controller: performanceReferenceDocController,
                                                                                  keyboardType: TextInputType.text,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      // hintText: "Please Enter Day Lot No.",
                                                                                      ),
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  readOnly: true,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Text(
                                                                                  "Acceptance Criteria",
                                                                                  style: AppStyles.textfieldCaptionTextStyle,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 5,
                                                                                ),
                                                                                TextFormField(
                                                                                  controller: performanceAcceptanceCriteriaController,
                                                                                  keyboardType: TextInputType.text,
                                                                                  textInputAction: TextInputAction.next,
                                                                                  decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                      // hintText: "Please Enter Day Lot No.",
                                                                                      ),
                                                                                  maxLines: 2,
                                                                                  style: AppStyles.textInputTextStyle,
                                                                                  readOnly: true,
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                                                                _isLoading
                                                                                    ? const Center(child: CircularProgressIndicator())
                                                                                    : AppButton(
                                                                                        textStyle: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 16),
                                                                                        onTap: () {
                                                                                          AppHelper.hideKeyboard(context);
                                                                                          _performanceFormKey.currentState!.save;
                                                                                          if (_performanceFormKey.currentState!.validate()) {
                                                                                            // ignore: unnecessary_null_comparison
                                                                                            if (performanceSampleSizeController.text != "") {
                                                                                              int num = int.parse(performanceSampleSizeController.text);
                                                                                              setState(() {
                                                                                                setPage = 'checkperformance';
                                                                                                numberOfPerformanceSampleFields = num;
                                                                                              });
                                                                                            }
                                                                                          }

                                                                                          // Dynamic Start......
                                                                                          for (int i = 0; i < numberOfPerformanceSampleFields; i++) {
                                                                                            performanceBarcodeControllers.add(TextEditingController());
                                                                                            performanceRemarksControllers.add(TextEditingController());
                                                                                          }
                                                                                          selectedPerformanceTestValues = List<bool>.generate(numberOfPerformanceSampleFields, (index) => false); // Initialize all radio button values to false
                                                                                          // selectedPhysicalTestValues[0] = true; // Initially select the first option

                                                                                          _performanceFormKey = GlobalKey<FormState>();

                                                                                          // Dynamic  End......
                                                                                        },
                                                                                        label: "Check",
                                                                                        organization: '',
                                                                                      ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Center(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          setPage = "checkelectrical";
                                                                                        });
                                                                                        // Navigator.of(context).pushReplacement(
                                                                                        //     MaterialPageRoute(
                                                                                        //         builder: (BuildContext context) =>
                                                                                        //             LoginPage(
                                                                                        //                 appName: widget.appName)));
                                                                                      },
                                                                                      child: const Text(
                                                                                        "BACK",
                                                                                        style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
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
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Text("Powered By Gautam Solar Pvt. Ltd.", style: TextStyle(fontSize: 14, fontFamily: appFontFamily, color: AppColors.greyColor, fontWeight: FontWeight.w400)),
                                                                                      SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )),
                                                                        ],
                                                                      )
                                                                    : setPage ==
                                                                            "checkperformance"
                                                                        ? Scaffold(
                                                                            body:
                                                                                Form(
                                                                              key: _performancesampleformKey,
                                                                              child: ListView.builder(
                                                                                itemCount: numberOfPerformanceSampleFields,
                                                                                itemBuilder: (context, index) {
                                                                                  return Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Sample ${index + 1}",
                                                                                          style: AppStyles.textfieldCaptionTextStyle,
                                                                                        ),
                                                                                        const SizedBox(height: 8),

                                                                                        TextFormField(
                                                                                          controller: performanceBarcodeControllers[index],
                                                                                          decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                            hintText: "Please Scan Sample Barcode",
                                                                                            counterText: '',
                                                                                            contentPadding: EdgeInsets.all(10),
                                                                                            suffixIcon: IconButton(
                                                                                              onPressed: () async {
                                                                                                barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                                                                  '#FF6666',
                                                                                                  'Cancel',
                                                                                                  true,
                                                                                                  ScanMode.DEFAULT,
                                                                                                );

                                                                                                setState(() {
                                                                                                  performanceBarcodeControllers[index].text = (barcodeScanRes != "-1" ? barcodeScanRes : '')!;
                                                                                                });
                                                                                              },
                                                                                              icon: const Icon(Icons.qr_code),
                                                                                            ),
                                                                                          ),
                                                                                          readOnly: true,
                                                                                          style: AppStyles.textInputTextStyle,
                                                                                          validator: (value) {
                                                                                            if (value == null || value.isEmpty) {
                                                                                              return 'Please Scan Sample Barcode.';
                                                                                            }
                                                                                            return null;
                                                                                          },
                                                                                        ),

                                                                                        const SizedBox(height: 8), // Add space between TextFormField and Radio Buttons
                                                                                        Row(
                                                                                          children: [
                                                                                            Radio(
                                                                                              value: true,
                                                                                              groupValue: selectedPerformanceTestValues[index],
                                                                                              onChanged: (bool? value) {
                                                                                                setState(() {
                                                                                                  selectedPerformanceTestValues[index] = value!;
                                                                                                });
                                                                                              },
                                                                                            ),
                                                                                            Text(
                                                                                              'True',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                            const SizedBox(width: 8),
                                                                                            Radio(
                                                                                              value: false,
                                                                                              groupValue: selectedPerformanceTestValues[index],
                                                                                              onChanged: (bool? value) {
                                                                                                setState(() {
                                                                                                  selectedPerformanceTestValues[index] = value!;
                                                                                                });
                                                                                              },
                                                                                            ),
                                                                                            Text(
                                                                                              'False',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        if (selectedPerformanceTestValues[index] == false) const SizedBox(height: 8),
                                                                                        if (selectedPerformanceTestValues[index] == false)
                                                                                          TextFormField(
                                                                                            controller: performanceRemarksControllers[index],
                                                                                            decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                              hintText: "Please Enter Remarks",
                                                                                              counterText: '',
                                                                                              contentPadding: EdgeInsets.all(10),
                                                                                            ),
                                                                                            style: AppStyles.textInputTextStyle,
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return 'Please Enter Remarks.';
                                                                                              }
                                                                                              return null;
                                                                                            },
                                                                                          ),
                                                                                        const SizedBox(height: 8),
                                                                                        Container(
                                                                                          width: MediaQuery.of(context).size.width,
                                                                                          color: AppColors.dividerColor,
                                                                                          height: 1,
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            bottomNavigationBar:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(14.0),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                children: [
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        setPage = "performance";
                                                                                      });
                                                                                    },
                                                                                    child: const Text(
                                                                                      "BACK",
                                                                                      style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                                    ),
                                                                                  ),
                                                                                  ElevatedButton(
                                                                                    onPressed: () {
                                                                                      _performancesampleformKey.currentState!.save;

                                                                                      // Validate the form
                                                                                      // if (_performancesampleformKey.currentState!.validate()) {
                                                                                      //   // Perform action on submit button press
                                                                                      //   print('Text Field Values:');
                                                                                      //   for (int i = 0; i < numberOfPerformanceSampleFields; i++) {
                                                                                      //     performanceSampleData.add('{PerformanceSampleBarcode${i + 1}: ${performanceBarcodeControllers[i].text}, PerformanceSampleTest${i + 1}: ${selectedPerformanceTestValues[i]}, {PerformanceSampleRemarks${i + 1}: ${performanceRemarksControllers[i].text}}');
                                                                                      //   }

                                                                                      //   // setState(() {
                                                                                      //   //   setPage = "visual";
                                                                                      //   // });
                                                                                      // }
                                                                                      setState(() {
                                                                                        setPage = "result";
                                                                                      });
                                                                                      _performancesampleformKey = GlobalKey<FormState>();
                                                                                    },
                                                                                    style: ElevatedButton.styleFrom(
                                                                                      backgroundColor: const Color.fromARGB(255, 134, 8, 4), // Set button color to red
                                                                                    ),
                                                                                    child: const Text(
                                                                                      'Next',
                                                                                      style: TextStyle(
                                                                                        color: Colors.white, // Set text color to white
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : setPage ==
                                                                                "result"
                                                                            ? Stack(
                                                                                alignment: Alignment.center,
                                                                                fit: StackFit.expand,
                                                                                children: [
                                                                                  SingleChildScrollView(
                                                                                      child: Form(
                                                                                    key: _resultFormKey,
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
                                                                                              Image.asset(
                                                                                                AppAssets.imgLogo,
                                                                                                height: 100,
                                                                                                width: 230,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        const Center(child: Padding(padding: EdgeInsets.only(top: 10), child: Text("Incoming Quality Control Plan", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                                        const Center(child: Text("(Solar Cell)", style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
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
                                                                                              'GSPL/SC(IQC)/001',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
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
                                                                                              'Ver.2.0 / 13-03-2024',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        const SizedBox(
                                                                                          height: 15,
                                                                                        ),
                                                                                        const Center(child: Text("Result", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 6, 2, 240), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                                        Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: <Widget>[
                                                                                            Radio(
                                                                                              value: "Pass",
                                                                                              groupValue: result,
                                                                                              onChanged: (val) {
                                                                                                setState(() {
                                                                                                  result = val;
                                                                                                });
                                                                                              },
                                                                                            ),
                                                                                            Text(
                                                                                              'Pass',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                            const SizedBox(
                                                                                              width: 10,
                                                                                            ),
                                                                                            Radio(
                                                                                              value: "Fail",
                                                                                              groupValue: result,
                                                                                              onChanged: (val) {
                                                                                                setState(() {
                                                                                                  result = val;
                                                                                                });
                                                                                              },
                                                                                            ),
                                                                                            Text(
                                                                                              'Fail',
                                                                                              style: AppStyles.textfieldCaptionTextStyle,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        if (result == "Fail")
                                                                                          const SizedBox(
                                                                                            height: 10,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Checkbox(
                                                                                                value: packagingRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    packagingRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Packaging',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                              Checkbox(
                                                                                                value: visualRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    visualRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Visual',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                              Checkbox(
                                                                                                value: physicalRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    physicalRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Physical',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          const SizedBox(
                                                                                            height: 5,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Checkbox(
                                                                                                value: frontbusRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    frontbusRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Front Bus',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                              Checkbox(
                                                                                                value: verificationRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    verificationRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Verification',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                              Checkbox(
                                                                                                value: electricalRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    electricalRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Electrical',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          const SizedBox(
                                                                                            height: 5,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Checkbox(
                                                                                                value: performanceRejection,
                                                                                                onChanged: (value) {
                                                                                                  setState(() {
                                                                                                    performanceRejection = value!;
                                                                                                  });
                                                                                                },
                                                                                              ),
                                                                                              Text(
                                                                                                'Performance',
                                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          const SizedBox(
                                                                                            height: 5,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          Text(
                                                                                            'Rejection Reason',
                                                                                            style: AppStyles.textfieldCaptionTextStyle,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          const SizedBox(
                                                                                            height: 5,
                                                                                          ),
                                                                                        if (result == "Fail")
                                                                                          TextFormField(
                                                                                            controller: rejectionReasonController,
                                                                                            keyboardType: TextInputType.text,
                                                                                            textInputAction: TextInputAction.next,
                                                                                            decoration: AppStyles.textFieldInputDecoration.copyWith(hintText: "Please Enter Rejection Reason", counterText: ''),
                                                                                            style: AppStyles.textInputTextStyle,
                                                                                            maxLines: 3,
                                                                                            validator: (value) {
                                                                                              if (value!.isEmpty) {
                                                                                                return "Please Enter Rejection Reason";
                                                                                              } else {
                                                                                                return null;
                                                                                              }
                                                                                            },
                                                                                          ),
                                                                                        const SizedBox(
                                                                                          height: 15,
                                                                                        ),
                                                                                        const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                                                                        _isLoading
                                                                                            ? const Center(child: CircularProgressIndicator())
                                                                                            : AppButton(
                                                                                                textStyle: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.white, fontSize: 16),
                                                                                                onTap: () {
                                                                                                  AppHelper.hideKeyboard(context);
                                                                                                  _resultFormKey.currentState!.save;
                                                                                                  if (_resultFormKey.currentState!.validate()) {
                                                                                                    print("GGG");
                                                                                                    createData();
                                                                                                  }
                                                                                                  // setState(() {
                                                                                                  //   setPage = 'visual';
                                                                                                  // });
                                                                                                },
                                                                                                label: "Save",
                                                                                                organization: '',
                                                                                              ),
                                                                                        const SizedBox(
                                                                                          height: 10,
                                                                                        ),
                                                                                        Center(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                            child: InkWell(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  _isLoading = false;
                                                                                                  setPage = "checkperformance";
                                                                                                });
                                                                                                // Navigator.of(context).pushReplacement(
                                                                                                //     MaterialPageRoute(
                                                                                                //         builder: (BuildContext context) =>
                                                                                                //             LoginPage(
                                                                                                //                 appName: widget.appName)));
                                                                                              },
                                                                                              child: const Text(
                                                                                                "BACK",
                                                                                                style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
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
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Text("Powered By Gautam Solar Pvt. Ltd.", style: TextStyle(fontSize: 14, fontFamily: appFontFamily, color: AppColors.greyColor, fontWeight: FontWeight.w400)),
                                                                                              SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  )),
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
    // return
    // }
  }
}
