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

class laminator1 extends StatefulWidget {
  @override
  _laminator1State createState() => _laminator1State();
}

class _laminator1State extends State<laminator1> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();

  TextEditingController specification1Controller = TextEditingController();
  TextEditingController evaController = TextEditingController();
  TextEditingController evaBController = TextEditingController();

  TextEditingController Specification2Controller = TextEditingController();
  TextEditingController evaMoController = TextEditingController();
  TextEditingController evaMoBController = TextEditingController();

  TextEditingController Specification3Controller = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController totalBController = TextEditingController();

  TextEditingController Specification4Controller = TextEditingController();
  TextEditingController upperVa1Controller = TextEditingController();
  TextEditingController upperVa1BController = TextEditingController();

  TextEditingController Specification5Controller = TextEditingController();
  TextEditingController upper1Controller = TextEditingController();
  TextEditingController upper1BController = TextEditingController();

  TextEditingController specification6Controller = TextEditingController();
  TextEditingController laminator1Controller = TextEditingController();
  TextEditingController laminator1BController = TextEditingController();

  TextEditingController specification7Controller = TextEditingController();
  TextEditingController upper2Controller = TextEditingController();
  TextEditingController upper2BController = TextEditingController();

  TextEditingController specification8Controller = TextEditingController();
  TextEditingController laminator2Controller = TextEditingController();
  TextEditingController laminator2BController = TextEditingController();

  TextEditingController specification9Controller = TextEditingController();
  TextEditingController upper3Controller = TextEditingController();
  TextEditingController upper3BController = TextEditingController();

  TextEditingController specification10Controller = TextEditingController();
  TextEditingController laminator3Controller = TextEditingController();
  TextEditingController laminator3BController = TextEditingController();

  TextEditingController specification11Controller = TextEditingController();
  TextEditingController defaultController = TextEditingController();
  TextEditingController defaultBController = TextEditingController();

  TextEditingController specification12Controller = TextEditingController();
  TextEditingController ventController = TextEditingController();
  TextEditingController ventBController = TextEditingController();

  TextEditingController specification13Controller = TextEditingController();
  TextEditingController tempSController = TextEditingController();
  TextEditingController tempSBController = TextEditingController();

  TextEditingController specification14Controller = TextEditingController();
  TextEditingController tempUController = TextEditingController();
  TextEditingController tempUBController = TextEditingController();

  TextEditingController specification15Controller = TextEditingController();
  TextEditingController tempLController = TextEditingController();
  TextEditingController tempLBController = TextEditingController();

  TextEditingController specification16Controller = TextEditingController();
  TextEditingController lamController = TextEditingController();
  TextEditingController lamBController = TextEditingController();

  TextEditingController position1Controller = TextEditingController();
  TextEditingController position2Controller = TextEditingController();
  TextEditingController position3Controller = TextEditingController();
  TextEditingController position4Controller = TextEditingController();
  TextEditingController position5Controller = TextEditingController();
  TextEditingController position6Controller = TextEditingController();

  bool menu = false, user = false, face = false, home = false;
  int numberOfStringers = 0;
  bool _isLoading = false;
  String setPage = 'home', pic = '';
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
      specification1Controller.text = "Specification | Tolerance | None";
      Specification2Controller.text = "Specification | Tolerance | None";
      Specification3Controller.text = "Specification 300 | Tolerance (+40,-20)";
      Specification4Controller.text = "Specification  0-10| Tolerance -None";
      Specification5Controller.text = "Specification(-60 to 0)|Tolerance -None";
      specification6Controller.text = "Specification (0-10)| Tolerance None";
      specification7Controller.text = "Specification(-40 to 0)|Tolerance None";
      specification8Controller.text = "Specification (0-10)| Tolerance None";
      specification9Controller.text = "Specification(-20 to 0)|Tolerance None";
      specification10Controller.text = "Specification 100| Tolerance +50,0";
      specification11Controller.text = "Specification 9999| Tolerance 0";
      specification12Controller.text = "Specification 20| Tolerance 0+-5";
      specification13Controller.text = "Specification 150| Tolerance None";
      specification14Controller.text = "Specification 160| Tolerance None";
      specification15Controller.text = "Specification 140| Tolerance None";
      specification16Controller.text =
          "Specification (max 15000-20000)| Tolerance None";
    });
  }

  Future<void> sendDataToBackend() async {
    var data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'Laminator1': [
        {
          'specification1': specification1Controller.text,
          'eva': evaController.text,
          'evaB': evaBController.text,
        },
        {
          'specification2': Specification2Controller.text,
          'evaMo': evaMoController.text,
          'evaMoB': evaMoBController.text,
        },
        {
          'specification3': Specification3Controller.text,
          'total': totalController.text,
          'totalB': totalBController.text,
        },
        {
          'specification4': Specification4Controller.text,
          'upperVa1': upperVa1Controller.text,
          'upperVa1B': upperVa1BController.text,
        },
        {
          'specification5': Specification5Controller.text,
          'upper1': upper1Controller.text,
          'upper1B': upper1BController.text,
        },
        {
          'specification6': specification6Controller.text,
          'laminator1': laminator1Controller.text,
          'laminator1B': laminator1BController.text,
        },
        {
          'specification7': specification7Controller.text,
          'upper2': upper2Controller.text,
          'upper2B': upper2BController.text,
        },
        {
          'specification8': specification8Controller.text,
          'laminator2': laminator2Controller.text,
          'laminator2B': laminator2BController.text,
        },
        {
          'specification9': specification9Controller.text,
          'upper3': upper3Controller.text,
          'upper3B': upper3BController.text,
        },
        {
          'specification10': specification10Controller.text,
          'laminator3': laminator3Controller.text,
          'laminator3B': laminator3BController.text,
        },
        {
          'specification11': specification11Controller.text,
          'default': defaultController.text,
          'defaultB': defaultBController.text,
        },
        {
          'specification12': specification12Controller.text,
          'vent': ventController.text,
          'ventB': ventBController.text,
        },
        {
          'specification13': specification13Controller.text,
          'tempS': tempSController.text,
          'tempSB': tempSBController.text,
        },
        {
          'specification14': specification14Controller.text,
          'tempU': tempUController.text,
          'tempUB': tempUBController.text,
        },
        {
          'specification15': specification15Controller.text,
          'tempL': tempLController.text,
          'tempLB': tempLBController.text,
        },
        {
          'specification16': specification16Controller.text,
          'lam': lamController.text,
          'lamB': lamBController.text,
        },
      ],
      'positions': {
        'position1': position1Controller.text,
        'position2': position2Controller.text,
        'position3': position3Controller.text,
        'position4': position4Controller.text,
        'position5': position5Controller.text,
        'position6': position6Controller.text,
      },
    };
    print('$data');
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
                return MachineCard();
              }));
            },
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: setPage == 'home'
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
                                    "Monitoring Of Laminator Process Parameter",
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
                                    'GSPL/IPQC/LM/008',
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

                              // ****************** Date *********
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
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
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
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
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
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Select Shift";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              //  ****************  Monitoring Of Laminator Process Parameter ******

                              const SizedBox(
                                height: 15,
                              ),

                              const Center(
                                child: Text(
                                  "Laminator 1",
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

                              // ***************  Specification Tolerance   ****************
                              Text(
                                "EVA Make",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification | Tolerance | None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: evaController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: evaBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "EVA Model/Type",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Specification2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification | Tolerance | None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: evaMoController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: evaMoBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Total Vacuum Time(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Specification3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification 300 | Tolerance (+40,-20)",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: totalController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: totalBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Upper Vaccum Delay(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Specification4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification  0-10| Tolerance -None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upperVa1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upperVa1BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Upper Vent-1(kpa)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: Specification5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification(-60 to 0)|Tolerance -None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper1BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Laminator-1(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification6Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification (0-10)| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator1BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Upper Vent-2(kpa)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification7Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification(-40 to 0)|Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper2BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Laminator-2(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification8Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification (0-10)| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator2BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Upper Vent-3(kpa)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification9Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification(-20 to 0)|Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: upper3BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Laminator-3(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification10Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification 100| Tolerance +50,0",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: laminator3BController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Default Low Vacuum Time(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification11Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification 9999| Tolerance 0",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: defaultController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: defaultBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Vent Time(sec)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification12Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification 20| Tolerance 0+-5",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: ventController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: ventBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Temp Setting(°C)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification13Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification 150| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempSController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempSBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Temp Upper limit(°C)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification14Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification 160| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempUController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempUBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Temp Lower limit(°C)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification15Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Specification 140| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempLController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: tempLBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Lam Count(Membrane cycle)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: specification16Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Specification (max 15000-20000)| Tolerance None",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: lamController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine A ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine A ";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: lamBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Machine B ",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Correct  Machine B ";
                                  } else {
                                    return null;
                                  }
                                },
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
                                          setPage = "location";
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
                : setPage == "location"
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
                                        "Monitoring Of Laminator Process Parameter",
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
                                        'GSPL/IPQC/LM/008',
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

                                  //  ****************  Monitoring Of Laminator Process Parameter ******

                                  const SizedBox(
                                    height: 25,
                                  ),

                                  const Center(
                                    child: Text(
                                      "Laminator Thermocouple Reading",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 250, 4, 4),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Center(
                                    child: Text(
                                      "Location ",
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

                                  // ***************  position's  ****************
                                  Text(
                                    "1st Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter First position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct  First position";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "2nd Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter Second position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct Second position";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "3rd Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter Third position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct  Third position";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "4th Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter Fourth position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct  Fourth position";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "5th Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter Fifth position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct  Fifth position";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "6th Position",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  TextFormField(
                                    controller: position6Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter sixth position",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    // readOnly: status == 'Pending' &&
                                    //         designation != "QC"
                                    //     ? true
                                    //     : false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Correct  sixth position";
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
                                              setPage = "#####";
                                            });
                                            // print("Page set");
                                            print(setPage);
                                          },
                                          label: "Submit",
                                          organization: '',
                                        ),

                                  const SizedBox(
                                    height: 15,
                                  ),

                                  // Back button
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            setPage = 'home';
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
