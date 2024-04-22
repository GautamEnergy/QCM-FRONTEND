import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/appbar.dart';
import 'package:QCM/testingCard.dart';
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

class busbar extends StatefulWidget {
  @override
  _busbarState createState() => _busbarState();
}

class _busbarState extends State<busbar> {
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController LineController = TextEditingController();
  TextEditingController operatornameController = TextEditingController();
  TextEditingController bussingStageController = TextEditingController();
  TextEditingController ribbonWidthController = TextEditingController();
  TextEditingController busbarWidthController = TextEditingController();

  TextEditingController ribbonController = TextEditingController();

  List<TextEditingController> sampleAControllers = [];
  List<TextEditingController> sampleBControllers = [];

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
  String? selectedtype;
  List Sample1Controllers = [];
  List Sample2Controllers = [];

  void addControllers(int count) {
    for (int i = 0; i < count; i++) {
      sampleAControllers.add(TextEditingController());
    }
  }

  void addsampleControllers(int count) {
    for (int i = 0; i < count; i++) {
      sampleBControllers.add(TextEditingController());
    }
  }

  @override
  void initState() {
    super.initState();
    isCycleTimeTrue = true; // Set initial value
    // setState(() {

    // });
  }

  // ****************************************  Send the Data where will be Used to Backend **************************
  Future<void> sendDataToBackend() async {
    print(Sample1Controllers);
    print(Sample2Controllers);
    // print("kuch bhi");
    // print(Sample2Controllers);

    final data = {
      'date': dateController.text,
      'shift': shiftController.text,
      'line': LineController.text,
      'operator': operatornameController.text,
      'bussingStage': bussingStageController.text,
      'ribbonWidth': ribbonWidthController.text,
      'busbarWidth': busbarWidthController.text,
      'ribbon': ribbonController.text,
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
                return TestingCard();
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
                                    "Ribbon To Busbar Peel Test Report",
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
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
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
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
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
                              // ********************************* Line *******************************

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Line.",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: LineController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Line.",
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Line.",
                                    ),
                                  ],
                                ),
                              ),

                              //***************   Details   ********************
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Operator Name",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: operatornameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Operator Name",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required Operator Name",
                                    ),
                                  ],
                                ),
                              ),

                              //***************   Bussing Stage  ********************
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Bussing Stage",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              DropdownButtonFormField<String>(
                                value: selectedtype,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedtype = newValue!;
                                    bussingStageController.text = selectedtype!;
                                  });
                                },
                                items: <String>[
                                  'Auto',
                                  'Manual'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Select type",
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Select type";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              //***************   Ribbon Width  ********************
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Ribbon Width",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: ribbonWidthController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Ribbon Width",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required Ribbon Width",
                                    ),
                                  ],
                                ),
                              ),
                              //***************   Busbar Width  ********************
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Busbar Width",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: busbarWidthController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Busbar Width",
                                  counterText: '',
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please fill the required Busbar Width",
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
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: ribbonController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    numberOfStringers =
                                        int.tryParse(value) ?? 0;
                                    addControllers(numberOfStringers * 5);
                                    addsampleControllers(numberOfStringers * 5);
                                  });
                                },
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the number of Ribbon",
                                  fillColor: Color.fromARGB(255, 215, 243, 207),
                                ),
                                style: AppStyles.textInputTextStyle,
                                // readOnly: status == 'Pending' &&
                                //         designation != "QC"
                                //     ? true
                                //     : false,
                              ),
                              SizedBox(height: 20),
                              const SizedBox(
                                height: 10,
                              ),

                              // Center(
                              //   child: Text(
                              //     "Sample 1",
                              //     style: TextStyle(
                              //       fontSize: 20,
                              //       color: Color.fromARGB(255, 250, 4, 4),
                              //       fontFamily: appFontFamily,
                              //       fontWeight: FontWeight.w700,
                              //     ),
                              //   ),
                              // ),

                              Visibility(
                                visible: numberOfStringers > 0,
                                child: Center(
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
                              ),

                              SizedBox(height: 5),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: numberOfStringers,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ribbon ${index + 1}",
                                        style: AppStyles.textInputTextStyle
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: sampleAControllers[index],
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter Ribbon",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        // readOnly: status == 'Pending' &&
                                        //         designation != "QC"
                                        //     ? true
                                        //     : false,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Correct Ribbon';
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

                              Visibility(
                                visible: numberOfStringers > 0,
                                child: const Center(
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
                              ),

                              SizedBox(height: 10),
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
                                        "Ribbon ${index + 1}",
                                        style: AppStyles.textInputTextStyle
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      TextFormField(
                                        controller: sampleBControllers[index],
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Enter Ribbon",
                                          counterText: '',
                                          fillColor: Color.fromARGB(
                                              255, 215, 243, 207),
                                          contentPadding: EdgeInsets.all(10),
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        // readOnly: status == 'Pending' &&
                                        //         designation != "QC"
                                        //     ? true
                                        //     : false,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please Enter Correct Ribbon';
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

                              // *********************  Temperature's  ************************

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

                                        Sample1Controllers = [];

                                        for (int i = 0;
                                            i < numberOfStringers;
                                            i++) {
                                          Sample1Controllers.add({
                                            "sampleAControllers${i + 1}":
                                                sampleAControllers[i].text,
                                          });
                                        }

                                        Sample2Controllers = [];

                                        for (int i = 0;
                                            i < numberOfStringers;
                                            i++) {
                                          Sample2Controllers.add({
                                            "sampleBControllers${i + 1}":
                                                sampleBControllers[i].text,
                                          });
                                        }

                                        sendDataToBackend(); //400

                                        // _registerFormKey.currentState!.save;
                                        // if (_registerFormKey.currentState!
                                        //     .validate()) {
                                        //   sendDataToBackend();
                                        // }
                                        setState(() {
                                          setPage = "NextPage";
                                        });
                                        // print("Page set");
                                        print(setPage);
                                      },
                                      label: "Save",
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

                              // ^^^^^^^
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
                : setPage == "NEXT PAGE"
                    ? Stack()
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
