import 'package:QCM/Ipqc.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/appbar.dart';
import 'package:QCM/machineCard.dart';
import 'package:QCM/stringerCards.dart';
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
import 'package:toast/toast.dart';

class stringer1 extends StatefulWidget {
  @override
  _stringer1State createState() => _stringer1State();
}

class _stringer1State extends State<stringer1> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();

  TextEditingController ASet1Controller = TextEditingController();
  TextEditingController AS1TackAs1Controller = TextEditingController();

  TextEditingController ASet2Controller = TextEditingController();
  TextEditingController AS1TackAs2Controller = TextEditingController();

  TextEditingController AWtime1Controller = TextEditingController();
  TextEditingController AS1TrackAW1Controller = TextEditingController();

  TextEditingController AWtime2Controller = TextEditingController();
  TextEditingController AS1TrackAW2Controller = TextEditingController();

  TextEditingController AWtime3Controller = TextEditingController();
  TextEditingController AS1TrackAW3Controller = TextEditingController();

  TextEditingController AWtime4Controller = TextEditingController();
  TextEditingController AS1TrackAW4Controller = TextEditingController();

  TextEditingController AWtime5Controller = TextEditingController();
  TextEditingController AS1TrackAW5Controller = TextEditingController();

  TextEditingController AWtime6Controller = TextEditingController();
  TextEditingController AS1TrackAW6Controller = TextEditingController();

  TextEditingController AHeating1Controller = TextEditingController();
  TextEditingController AS1TrackAH1Controller = TextEditingController();

  TextEditingController AHeating2Controller = TextEditingController();
  TextEditingController AS1TrackAH2Controller = TextEditingController();

  TextEditingController AHeating3Controller = TextEditingController();
  TextEditingController AS1TrackAH3Controller = TextEditingController();

  TextEditingController AHeating4Controller = TextEditingController();
  TextEditingController AS1TrackAH4Controller = TextEditingController();

  TextEditingController AHeating5Controller = TextEditingController();
  TextEditingController AS1TrackAH5Controller = TextEditingController();

  TextEditingController AHeating6Controller = TextEditingController();
  TextEditingController AS1TrackAH6Controller = TextEditingController();

  TextEditingController ALowestController = TextEditingController();
  TextEditingController AS1TrackALController = TextEditingController();

  TextEditingController AHighestController = TextEditingController();
  TextEditingController AS1TrackAHController = TextEditingController();

  TextEditingController BSet1Controller = TextEditingController();
  TextEditingController BS1TackAs1Controller = TextEditingController();
  TextEditingController BSet2Controller = TextEditingController();
  TextEditingController BS1TackAs2Controller = TextEditingController();
  TextEditingController BWtime1Controller = TextEditingController();
  TextEditingController BS1TrackAW1Controller = TextEditingController();
  TextEditingController BWtime2Controller = TextEditingController();
  TextEditingController BS1TrackAW2Controller = TextEditingController();
  TextEditingController BWtime3Controller = TextEditingController();
  TextEditingController BS1TrackAW3Controller = TextEditingController();
  TextEditingController BWtime4Controller = TextEditingController();
  TextEditingController BS1TrackAW4Controller = TextEditingController();
  TextEditingController BWtime5Controller = TextEditingController();
  TextEditingController BS1TrackAW5Controller = TextEditingController();
  TextEditingController BWtime6Controller = TextEditingController();
  TextEditingController BS1TrackAW6Controller = TextEditingController();
  TextEditingController BHeating1Controller = TextEditingController();
  TextEditingController BS1TrackAH1Controller = TextEditingController();
  TextEditingController BHeating2Controller = TextEditingController();
  TextEditingController BS1TrackAH2Controller = TextEditingController();
  TextEditingController BHeating3Controller = TextEditingController();
  TextEditingController BS1TrackAH3Controller = TextEditingController();
  TextEditingController BHeating4Controller = TextEditingController();
  TextEditingController BS1TrackAH4Controller = TextEditingController();
  TextEditingController BHeating5Controller = TextEditingController();
  TextEditingController BS1TrackAH5Controller = TextEditingController();
  TextEditingController BHeating6Controller = TextEditingController();
  TextEditingController BS1TrackAH6Controller = TextEditingController();
  TextEditingController BLowestController = TextEditingController();
  TextEditingController BS1TrackALController = TextEditingController();
  TextEditingController BHighestController = TextEditingController();
  TextEditingController BS1TrackAHController = TextEditingController();

  bool menu = false, user = false, face = false, home = false;
  int numberOfStringers = 0;
  bool _isLoading = false;
  String setPage = '', pic = '';
  String invoiceDate = '';
  String date = '';
  String dateOfQualityCheck = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;
  String? selectedShift;

  @override
  void initState() {
    super.initState();
    isCycleTimeTrue = true;
    setState(() {
      ASet1Controller.text = "Set Temperature1 | 230+-30  | °C";
      ASet2Controller.text = "Set Temperature2 | 230+-30  | °C";
      AWtime1Controller.text = "Welding Time1 | 1.7-2.5  | sec.";
      AWtime2Controller.text = "Welding Time2 | 1.7-2.5  | sec.";
      AWtime3Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      AWtime4Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      AWtime5Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      AWtime6Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      AHeating1Controller.text = "Heating Platform 1 | 80+-30 | °C ";
      AHeating2Controller.text = "Heating Platform 2 | 90+-30 | °C ";
      AHeating3Controller.text = "Heating Platform 3 | 110+-30 | °C ";
      AHeating4Controller.text = "Heating Platform 4 | 100+-30 | °C ";
      AHeating5Controller.text = "Heating Platform 5 | 90+-30 | °C ";
      AHeating6Controller.text = "Heating Platform 6 | 80+-30 | °C ";
      ALowestController.text = "Lowest Temp.setting |  30  |  °C ";
      AHighestController.text = "Highest Temp.setting |  150  |  °C ";

      BSet1Controller.text = "Set Temperature1 | 230+-30  | °C";
      BSet2Controller.text = "Set Temperature2 | 230+-30  | °C";
      BWtime1Controller.text = "Welding Time1 | 1.7-2.5  | sec.";
      BWtime2Controller.text = "Welding Time2 | 1.7-2.5  | sec.";
      BWtime3Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      BWtime4Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      BWtime5Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      BWtime6Controller.text = "Welding Time3 | 1.7-2.5  | sec.";
      BHeating1Controller.text = "Heating Platform 1 | 80+-30 | °C ";
      BHeating2Controller.text = "Heating Platform 2 | 90+-30 | °C ";
      BHeating3Controller.text = "Heating Platform 3 | 110+-30 | °C ";
      BHeating4Controller.text = "Heating Platform 4 | 100+-30 | °C ";
      BHeating5Controller.text = "Heating Platform 5 | 90+-30 | °C ";
      BHeating6Controller.text = "Heating Platform 6 | 80+-30 | °C ";
      BLowestController.text = "Lowest Temp.setting |  30  |  °C ";
      BHighestController.text = "Highest Temp.setting |  150  |  °C ";
    });
  }

  // ------- Send the Data where will be Used to Backend -----------
  Future<void> sendDataToBackend() async {
    var data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'Track-A': [
        {
          'ASet1': ASet1Controller.text,
          'AS1TackAs1': AS1TackAs1Controller.text,
          'ASet2': ASet2Controller.text,
          'AS1TackAs2': AS1TackAs2Controller.text,
          'AWtime1': AWtime1Controller.text,
          'AS1TrackAW1': AS1TrackAW1Controller.text,
          'AWtime2': AWtime2Controller.text,
          'AS1TrackAW2': AS1TrackAW2Controller.text,
          'AWtime3': AWtime3Controller.text,
          'AS1TrackAW3': AS1TrackAW3Controller.text,
          'AWtime4': AWtime4Controller.text,
          'AS1TrackAW4': AS1TrackAW4Controller.text,
          'AWtime5': AWtime5Controller.text,
          'AS1TrackAW5': AS1TrackAW5Controller.text,
          'AWtime6': AWtime6Controller.text,
          'AS1TrackAW6': AS1TrackAW6Controller.text,
          'AHeating1': AHeating1Controller.text,
          'AS1TrackAH1': AS1TrackAH1Controller.text,
          'AHeating2': AHeating2Controller.text,
          'AS1TrackAH2': AS1TrackAH2Controller.text,
          'AHeating3': AHeating3Controller.text,
          'AS1TrackAH3': AS1TrackAH3Controller.text,
          'AHeating4': AHeating4Controller.text,
          'AS1TrackAH4': AS1TrackAH4Controller.text,
          'AHeating5': AHeating5Controller.text,
          'AS1TrackAH5': AS1TrackAH5Controller.text,
          'AHeating6': AHeating6Controller.text,
          'AS1TrackAH6': AS1TrackAH6Controller.text,
          'ALowest': ALowestController.text,
          'AS1TrackAL': AS1TrackALController.text,
          'AHighest': AHighestController.text,
          'AS1TrackAH': AS1TrackAHController.text,
        }
      ],
      'Track-B': [
        {
          'BSet1': BSet1Controller.text,
          'BS1TackAs1': BS1TackAs1Controller.text,
          'BSet2': BSet2Controller.text,
          'BS1TackAs2': BS1TackAs2Controller.text,
          'BWtime1': BWtime1Controller.text,
          'BS1TrackAW1': BS1TrackAW1Controller.text,
          'BWtime2': BWtime2Controller.text,
          'BS1TrackAW2': BS1TrackAW2Controller.text,
          'BWtime3': BWtime3Controller.text,
          'BS1TrackAW3': BS1TrackAW3Controller.text,
          'BWtime4': BWtime4Controller.text,
          'BS1TrackAW4': BS1TrackAW4Controller.text,
          'BWtime5': BWtime5Controller.text,
          'BS1TrackAW5': BS1TrackAW5Controller.text,
          'BWtime6': BWtime6Controller.text,
          'BS1TrackAW6': BS1TrackAW6Controller.text,
          'BHeating1': BHeating1Controller.text,
          'BS1TrackAH1': BS1TrackAH1Controller.text,
          'BHeating2': BHeating2Controller.text,
          'BS1TrackAH2': BS1TrackAH2Controller.text,
          'BHeating3': BHeating3Controller.text,
          'BS1TrackAH3': BS1TrackAH3Controller.text,
          'BHeating4': BHeating4Controller.text,
          'BS1TrackAH4': BS1TrackAH4Controller.text,
          'BHeating5': BHeating5Controller.text,
          'BS1TrackAH5': BS1TrackAH5Controller.text,
          'BHeating6': BHeating6Controller.text,
          'BS1TrackAH6': BS1TrackAH6Controller.text,
          'BLowest': BLowestController.text,
          'BS1TrackAL': BS1TrackALController.text,
          'BHighest': BHighestController.text,
          'BS1TrackAH': BS1TrackAHController.text,
        }
      ]
    };
    print('$data');
  }
// ***************** Done Send the Data *******************************

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
                return StringersCard();
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
                                    "Monitoring For Tabber & Stringer Machine",
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Color.fromARGB(255, 56, 57, 56),
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
                                    'GSPL/IPQC/ST/004',
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Select Shift";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

//  *******************************************   Monitoring For tabber & Stringer Machine ********************

                              const SizedBox(
                                height: 15,
                              ),

                              const Center(
                                child: Text(
                                  "Track A",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 250, 4, 4),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              const Center(
                                child: Text(
                                  "PARAMETER",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 86, 104, 243),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              // ***************  Temperature's  ****************

                              TextFormField(
                                controller: ASet1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Set Temperature1 | 230+-30  | °C",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TackAs1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: ASet2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Set Temperature2 | 230+-30  | °C",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TackAs2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                controller: AWtime1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time1 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                controller: AWtime2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time2 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AWtime3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time3 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AWtime4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time4 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AWtime5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time5 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                controller: AWtime6Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Welding Time6 | 1.7-2.5  | sec.",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAW6Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                controller: AHeating1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Heating Platform 1 | 80+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHeating2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Heating Platform 2 | 90+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHeating3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Heating Platform 3 | 110+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHeating4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Heating Platform 4 | 100+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHeating5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Heating Platform 5 | 90+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHeating6Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Heating Platform 6 | 80+-30 | °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAH6Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: ALowestController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Lowest Temp.setting |  30  |  °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackALController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: AHighestController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Highest Temp.setting |  150  |  °C ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: AS1TrackAHController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Track-A Data",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct Track A Data";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
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
                                        sendDataToBackend(); //400

                                        // _registerFormKey.currentState!.save;
                                        // if (_registerFormKey.currentState!
                                        //     .validate()) {
                                        //   sendDataToBackend();
                                        // }
                                        setState(() {
                                          setPage = "TrackB";
                                        });
                                        // print("Page set");
                                        print(setPage);
                                      },
                                      label: "Next",
                                      organization: '',
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
                              //       setPage = 'backpage';
                              //     });
                              //     print("Page set");
                              //     print(setPage);
                              //   },
                              //   label: "Back",
                              //   organization: '',
                              // ),
                              // const SizedBox(
                              //   height: 10,
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
                : setPage == "TrackB"
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
                                        "Monitoring For Tabber & Stringer Machine",
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
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'GSPL/IPQC/ST/004',
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

                                  //  ***************   Monitoring For tabber & Stringer Machine ****************

                                  const SizedBox(
                                    height: 15,
                                  ),

                                  const Center(
                                    child: Text(
                                      "Track B",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 250, 4, 4),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                    child: Text(
                                      "PARAMETER",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 86, 104, 243),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  // *********************  Temperature's  ************************

                                  TextFormField(
                                    controller: BSet1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Set Temperature1 | 230+-30  | °C",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TackAs1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BSet2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Set Temperature2 | 230+-30  | °C",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TackAs2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    controller: BWtime1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time1 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    controller: BWtime2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time2 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BWtime3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time3 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BWtime4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time4 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BWtime5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time5 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    controller: BWtime6Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Welding Time6 | 1.7-2.5  | sec.",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAW6Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextFormField(
                                    controller: BHeating1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 1 | 80+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHeating2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 2 | 90+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHeating3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 3 | 110+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHeating4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 4 | 100+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHeating5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 5 | 90+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHeating6Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Heating Platform 6 | 80+-30 | °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAH6Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BLowestController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Lowest Temp.setting |  30  |  °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackALController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: BHighestController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Highest Temp.setting |  150  |  °C ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: BS1TrackAHController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Track-B Data",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Track A Data";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // -------------------------  It's Working End point's -----------------------------

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
                                            sendDataToBackend(); //400

                                            // _registerFormKey.currentState!.save;
                                            // if (_registerFormKey.currentState!
                                            //     .validate()) {
                                            //   sendDataToBackend();
                                            // }
                                            setState(() {
                                              setPage =
                                                  "Successful Save the Data";
                                            });
                                            // print("Page set");
                                            print(setPage);
                                            print("Kul bhushan Singh");
                                          },
                                          label: "SAVE",
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
