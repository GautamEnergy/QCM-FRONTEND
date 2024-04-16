import 'package:QCM/Ipqc.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:QCM/components/app_button_widget.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_fonts.dart';
import 'package:QCM/constant/app_helper.dart';
import 'package:QCM/constant/app_styles.dart';
import 'package:toast/toast.dart';

class Selant extends StatefulWidget {
  @override
  _SelantcState createState() => _SelantcState();
}

class _SelantcState extends State<Selant> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();

  TextEditingController LongAController = TextEditingController();
  TextEditingController LongBController = TextEditingController();
  TextEditingController LongDController = TextEditingController();

  TextEditingController ShortAController = TextEditingController();
  TextEditingController ShortBController = TextEditingController();
  TextEditingController ShortDController = TextEditingController();

  TextEditingController JunctionAController = TextEditingController();
  TextEditingController JunctionBController = TextEditingController();
  TextEditingController JunctionDController = TextEditingController();

  TextEditingController BaseAController = TextEditingController();
  TextEditingController CatalystBController = TextEditingController();
  TextEditingController RatioController = TextEditingController();

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

    LongAController.addListener(calculateDifference);
    LongBController.addListener(calculateDifference);

    ShortAController.addListener(calculateDifference);
    ShortBController.addListener(calculateDifference);

    JunctionAController.addListener(calculateDifference);
    JunctionBController.addListener(calculateDifference);
    // setState(() {

    // });
  }

  void calculateDifference() {
    // Get values from controllers
    double a = double.tryParse(LongAController.text) ?? 0;
    double b = double.tryParse(LongBController.text) ?? 0;

    double c = double.tryParse(ShortAController.text) ?? 0;
    double d = double.tryParse(ShortBController.text) ?? 0;

    double j = double.tryParse(JunctionAController.text) ?? 0;
    double k = double.tryParse(JunctionBController.text) ?? 0;

    // Calculate difference
    double difference = b - a;
    double Shortdifference = d - c;
    double Junctiondifference = k - j;

    // Update the Difference Weight field
    LongDController.text = difference.toString();
    ShortDController.text = Shortdifference.toString();
    JunctionDController.text = Junctiondifference.toString();
  }

  @override
  void dispose() {
    // Clean up listeners when the widget is disposed
    LongAController.removeListener(calculateDifference);
    LongBController.removeListener(calculateDifference);

    ShortAController.removeListener(calculateDifference);
    ShortBController.removeListener(calculateDifference);

    JunctionAController.removeListener(calculateDifference);
    JunctionBController.removeListener(calculateDifference);
    super.dispose();
  }

  // ************  Send the Data where will be Used to Backend *****************
  void sendDataToBackend() async {
    var data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'Long Frame': [
        {
          'LongA': LongAController.text,
          'LongB': LongBController.text,
          'LongD': LongDController.text,
        }
      ],
      'Short Frame': [
        {
          'ShortA': ShortAController.text,
          'ShortB': ShortBController.text,
          'ShortD': ShortDController.text,
        }
      ],
      'junction Box': [
        {
          'JunctionA': JunctionAController.text,
          'JunctionB': JunctionBController.text,
          'JunctionD': JunctionDController.text,
        }
      ],
      'Total Potting ': [
        {
          'BaseA': BaseAController.text,
          'CatalystB': CatalystBController.text,
          'Ratio': RatioController.text,
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
                                    "Checksheet For Sealant Weight Measurement",
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
                                    'GSPL/IPQC/SP/012',
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
                                    'Ver.  1.0 & 12-08-2023',
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

//  *******************************************   Sealant Weight Measurement  ********************

                              const SizedBox(
                                height: 25,
                              ),

                              const Center(
                                child: Text(
                                  "Long Frame",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 27, 41, 237),
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Without Sealant = A(gm)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: LongAController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the without Sealant",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required field",
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "With Sealant = B(gm)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: LongBController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the with Sealant",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required field ",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Difference Weight = B-A (gm)",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: LongDController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Total Sealant",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required field",
                                    ),
                                  ],
                                ),
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
                                          setPage = "shortFrame";
                                        });
                                        // print("Page set");
                                        print(setPage);
                                      },
                                      label: "Next",
                                      organization: '',
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
                : setPage == "shortFrame"
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
                                        "Checksheet For Sealant Weight Measurement",
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
                                        'GSPL/IPQC/SP/012',
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
                                        'Ver.  1.0 & 12-08-2023',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),

//  *******************************************   Sealant Weight Measurement  ********************

                                  const SizedBox(
                                    height: 25,
                                  ),

                                  const Center(
                                    child: Text(
                                      "Short Frame",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 27, 41, 237),
                                        fontFamily: appFontFamily,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Without Sealant = A(gm)",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: ShortAController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the without Sealant",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please fill the required field",
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "With Sealant = B(gm)",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: ShortBController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the with Sealant",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please fill the required field ",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Difference Weight = B-A (gm)",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: ShortDController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Enter the Total Sealant",
                                      counterText: '',
                                      fillColor:
                                          Color.fromARGB(255, 215, 243, 207),
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please fill the required field",
                                        ),
                                      ],
                                    ),
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
                                              setPage = 'JunctionBox';
                                            });
                                            // print("Page set");
                                            print(setPage);
                                          },
                                          label: "Next",
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
                    : setPage == "JunctionBox"
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
                                            "Checksheet For Sealant Weight Measurement",
                                            style: TextStyle(
                                              fontSize: 27,
                                              color: Color.fromARGB(
                                                  255, 56, 57, 56),
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
                                            'GSPL/IPQC/SP/012',
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
                                            'Ver.  1.0 & 12-08-2023',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),

//  *******************************************   Sealant Weight Measurement  ********************

                                      const SizedBox(
                                        height: 25,
                                      ),

                                      const Center(
                                        child: Text(
                                          "Junction Box",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 27, 41, 237),
                                            fontFamily: appFontFamily,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        "Without Sealant = A(gm)",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: JunctionAController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the without Sealant",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please fill the required field",
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "With Sealant = B(gm)",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: JunctionBController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the with Sealant",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please fill the required field ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Difference Weight = B-A (gm)",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: JunctionDController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter the Total Sealant",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please fill the required field",
                                            ),
                                          ],
                                        ),
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
                                                sendDataToBackend(); //400

                                                // _registerFormKey.currentState!.save;
                                                // if (_registerFormKey.currentState!
                                                //     .validate()) {
                                                // }
                                                setState(() {
                                                  setPage = 'Potting';
                                                });
                                                // print("Page set");
                                                print(setPage);
                                              },
                                              label: "Next",
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
                                                setPage = 'shortFrame';
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
                        : setPage == "Potting"
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
                                                "Checksheet For Sealant Weight Measurement",
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  color: Color.fromARGB(
                                                      255, 56, 57, 56),
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
                                                'GSPL/IPQC/SP/012',
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
                                                'Ver.  1.0 & 12-08-2023',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                            ],
                                          ),

//  *******************************************   Sealant Weight Measurement  ********************

                                          const SizedBox(
                                            height: 25,
                                          ),

                                          const Center(
                                            child: Text(
                                              "Total Potting Weight per module: ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 27, 41, 237),
                                                fontFamily: appFontFamily,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Text(
                                            "Base Weight(A):",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: BaseAController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Enter the Base Weight(A):",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please fill the required field",
                                                ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Catalyst Weight(B):",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: CatalystBController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Enter the Catalyst Weight(B)",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please fill the required field ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Ratio(A:B)",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: RatioController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Enter the Total Ratio",
                                              counterText: '',
                                              fillColor: Color.fromARGB(
                                                  255, 215, 243, 207),
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please fill the required field",
                                                ),
                                              ],
                                            ),
                                          ),

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
                                                    sendDataToBackend();

                                                    // _registerFormKey.currentState!.save;
                                                    // if (_registerFormKey.currentState!
                                                    //     .validate()) {

                                                    // }
                                                    setState(() {
                                                      setPage = 'nextpage';
                                                      print(
                                                          'All data will be successfully Submited');
                                                    });
                                                    // print("Page set");
                                                    print(setPage);
                                                  },
                                                  label: "Save",
                                                  organization: '',
                                                ),

                                          const SizedBox(
                                            height: 15,
                                          ),

                                          // Back button
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    setPage =
                                                        setPage = 'JunctionBox';
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
