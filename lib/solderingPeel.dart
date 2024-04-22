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

class solderingPeel extends StatefulWidget {
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

  List<TextEditingController> frontControllers = [];
  List<TextEditingController> backControllers = [];

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

  Future<void> sendDataToBackend() async {
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
                                    "Soldering Peel Test Report",
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
                                    'GSPL/IPQC/SP/006',
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

                              // ****************** Date ***********************
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

                              //***************   Operator Name   ********************
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
                                controller: operatorController,
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

                              //***************   Ribbon Size  ********************
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Ribbon Size",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: ribbonSizeController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Ribbon Size",
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
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: cellSizeController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Cell Size",
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
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: ribbonMakeController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Ribbon Make",
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
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: cellMakeController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the Cell Make",
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
                                          "Please fill the required Cell Make",
                                    ),
                                  ],
                                ),
                              ),

                              // *  Machine Number ***********************

                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Machine Number",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),

                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: machineController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Machine Number",
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
                                    addfrontControllers(numberOfStringers * 5);
                                    addbackControllers(numberOfStringers * 5);
                                  });
                                },
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Enter the number of Ribbon",
                                  fillColor: Color.fromARGB(255, 248, 226, 217),
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

                              Visibility(
                                visible: numberOfStringers > 0,
                                child: Center(
                                  child: Text(
                                    "Stringer Track",
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
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: numberOfStringers,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ribbon${index + 1}",
                                        style: AppStyles.textInputTextStyle
                                            // readOnly: status == 'Pending' &&
                                            //         designation != "QC"
                                            //     ? true
                                            //     : false,
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormField(
                                        controller: frontControllers[index],
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Front Peel ",
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
                                            return 'Please Enter Correct Stringer';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: backControllers[index],
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Back Peel ",
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

                              // *********************  Functionality  ************************

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
                                            "frontControllers${i + 1}":
                                                frontControllers[i].text,
                                          });
                                        }
                                        Sample2Controllers = [];

                                        for (int i = 0;
                                            i < numberOfStringers;
                                            i++) {
                                          Sample2Controllers.add({
                                            "backControllers${i + 1}":
                                                backControllers[i].text,
                                          });
                                        }

                                        sendDataToBackend();

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

                              const SizedBox(
                                height: 15,
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
