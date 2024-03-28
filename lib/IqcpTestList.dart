import 'dart:async';
import 'dart:convert';
import 'package:QCM/CommonDrawer.dart';
import 'package:QCM/Iqcp.dart';
import 'package:QCM/LoginPage.dart';
import 'package:QCM/SolarCell.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/addeditemployee.dart';
import 'package:QCM/attendance.dart';
import 'package:QCM/components/app_loader.dart';
import 'package:QCM/components/appbar.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_fonts.dart';
import 'package:QCM/constant/app_strings.dart';
import 'package:QCM/constant/app_styles.dart';
import 'package:QCM/directory.dart';
import 'package:QCM/main.dart';
import 'package:QCM/Iqcp_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class IqcpTestList extends StatefulWidget {
  IqcpTestList();

  @override
  _IqcpTestListState createState() => _IqcpTestListState();
}

class _IqcpTestListState extends State<IqcpTestList> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  TextEditingController SearchController = TextEditingController();
  // TextEditingController _paymentModeController = new TextEditingController();
  TextEditingController ExpiryDateController = new TextEditingController();
  TextEditingController PaymentDateController = new TextEditingController();

  TextEditingController NoteController = new TextEditingController();
  GlobalKey<FormState> _renewalFormkey = GlobalKey<FormState>();

  bool _isLoading = false, IN = false, OUT = false;
  bool menu = false, user = false, face = false, home = false;
  String? _paymentModeController;
  List paymentModeData = [];
  String? personid,
      token,
      vCard,
      firstname,
      lastname,
      pic,
      logo,
      site,
      designation,
      department,
      ImagePath,
      detail,
      businessname,
      organizationName,
      otherChapterName = '',
      _hasBeenPressedorganization = '',
      organizationtype,
      _hasBeenPressed = '',
      _hasBeenPressed1 = 'Pending',
      _hasBeenPressed2 = '',
      Expirydate,
      Paymentdate;
  // RoleModel? paymentModeData;
  TextEditingController AmountController = new TextEditingController();
  bool status = false, isAllowedEdit = false;
  var decodedResult;
  var rmbDropDown;
  Future? userdata;
  late UserModel aUserModel;
  List dropdownList = [];

  @override
  void initState() {
    if (mounted) {
      detail = 'hide';
      store();
    }
    super.initState();
  }

  void store() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pic = prefs.getString('pic');
      personid = prefs.getString('personid');
      site = prefs.getString('site');
      designation = prefs.getString('designation');
      department = prefs.getString('department');
      token = prefs.getString('token');
    });
    print(designation);
    print(department);
    print("Hi...?");

    userdata = getData();
  }

  Future<List<UserData>?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    setState(() {
      _isLoading = true;
    });

    final url = (site! + 'IQCSolarCell/GetIQCTests');

    http.post(
      Uri.parse(url),
      body: jsonEncode(
          <String, String>{"token": token!, "Status": _hasBeenPressed1!}),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((response) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          decodedResult = jsonDecode(response.body);
        });
        //  prefs.setString(DBConst.directory, response.body);
      }
    });

    return null;
  }

  void setMemberStatus(id) async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    final url = (site!) + 'removeEmployeeById';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{"personid": id}),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Toast.show("Employee Removed Successfully",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.primaryColor);

      getData();

      return;
    } else {
      throw Exception('Failed To Fetch Data');
    }
  }

  void takeAttendance(empid) async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    final url = (site ?? '') + 'externalAttendance';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        "empid": empid,
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("Kya hai Response bhai...?");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      Toast.show(response.body,
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.primaryColor);
      setState(() {
        getData();
      });
      return;
    } else {
      throw Exception('Failed To Fetch Data');
    }
  }

  // attendanceBox(context, String employeeId) {
  //   return SingleChildScrollView(
  //     child: Form(
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.only(
  //                 left: 20, top: 20, right: 20, bottom: 20),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.rectangle,
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: SingleChildScrollView(
  //               physics: const BouncingScrollPhysics(),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const Text(
  //                     // 'Disable Member',
  //                     'Employee Attendance',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 20,
  //                       fontFamily: 'HKGrotesk',
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const SizedBox(height: 15),
  //                       const Text(
  //                         'Are you sure to take attendance.?',
  //                         style: TextStyle(
  //                             fontSize: 15, fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(height: 15),
  //                       InkWell(
  //                         onTap: () {
  //                           Navigator.of(context).pop();
  //                           takeAttendance(employeeId);
  //                         },
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             color: AppColors.primaryColor,
  //                             borderRadius: BorderRadius.circular(20),
  //                           ),
  //                           child: const Padding(
  //                             padding: EdgeInsets.only(top: 10, bottom: 10),
  //                             child: Center(
  //                               child: Text(
  //                                 'Yes',
  //                                 style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontFamily: 'HKGrotesk',
  //                                     fontSize: 16.0,
  //                                     fontWeight: FontWeight.w700),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10.0),
  //                       InkWell(
  //                           onTap: () {
  //                             Navigator.of(context).pop();
  //                           },
  //                           child: const Center(
  //                             child: Text(
  //                               'NO',
  //                               style: TextStyle(
  //                                   fontFamily: appFontFamily,
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                   color: AppColors.redColor),
  //                             ),
  //                           )),
  //                       const SizedBox(height: 10.0),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // contentBox(context, String personId) {
  //   return SingleChildScrollView(
  //     child: Form(
  //       child: Column(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.only(
  //                 left: 20, top: 20, right: 20, bottom: 20),
  //             decoration: BoxDecoration(
  //               shape: BoxShape.rectangle,
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: SingleChildScrollView(
  //               physics: const BouncingScrollPhysics(),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const Text(
  //                     // 'Disable Member',
  //                     "Remove Employee",
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 20,
  //                       fontFamily: 'HKGrotesk',
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       const SizedBox(height: 15),
  //                       const Text(
  //                         // 'Are you sure you want to disable this member?',
  //                         "Are you sure you want to remove this employee?",
  //                         style: TextStyle(
  //                             fontSize: 15, fontWeight: FontWeight.bold),
  //                       ),
  //                       const SizedBox(height: 15),
  //                       InkWell(
  //                         onTap: () {
  //                           Navigator.of(context).pop();

  //                           setMemberStatus(personId);
  //                         },
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             color: AppColors.primaryColor,
  //                             borderRadius: BorderRadius.circular(20),
  //                           ),
  //                           child: const Padding(
  //                             padding: EdgeInsets.only(top: 10, bottom: 10),
  //                             child: Center(
  //                               child: Text(
  //                                 'Yes',
  //                                 style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontFamily: 'HKGrotesk',
  //                                     fontSize: 16.0,
  //                                     fontWeight: FontWeight.w700),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(height: 10.0),
  //                       InkWell(
  //                           onTap: () {
  //                             Navigator.of(context).pop();
  //                           },
  //                           child: const Center(
  //                             child: Text(
  //                               'NO',
  //                               style: TextStyle(
  //                                   fontFamily: appFontFamily,
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.w500,
  //                                   color: AppColors.redColor),
  //                             ),
  //                           )),
  //                       const SizedBox(height: 10.0),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<bool> redirectto() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false);
    return true;
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
        // ignore: deprecated_member_use
        child: WillPopScope(
            // ignore: missing_return
            onWillPop: redirectto,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.appBackgroundColor,
                appBar: GautamAppBar(
                  organization: "organizationtype",
                  isBackRequired: true,
                  memberId: "personid",
                  imgPath: "ImagePath",
                  memberPic: pic,
                  logo: "logo",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return department == 'IQCP' && designation == 'QC'
                          ? IqcpPage()
                          : WelcomePage();
                    }));
                  },
                ),
                body: _isLoading
                    ? AppLoader(organization: organizationtype)
                    : RefreshIndicator(
                        color: Colors.white,
                        backgroundColor: AppColors.blueColor,
                        onRefresh: () async {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      IqcpTestList()),
                              (Route<dynamic> route) => false);
                          return Future<void>.delayed(
                              const Duration(seconds: 3));
                        },
                        child: Container(
                          // margin: EdgeInsets.only(bottom: 80),
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: _userData()),
                        ),
                      ),
                // floatingActionButton: designation != 'Reporting Manager'
                //     ? _getFAB()
                //     : Container(),
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        department == 'IQCP' &&
                                                designation == 'QC'
                                            ? IqcpPage()
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
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             EmployeeList()));
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
                          onTap: () {
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             Attendance()));
                          },
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PublicDrawer()));
                          },
                          child: Image.asset(
                              menu
                                  ? AppAssets.imgSelectedMenu
                                  : AppAssets.imgMenu,
                              height: 25)),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _getFAB() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => AddEditProfile()),
              (Route<dynamic> route) => false);
        },
        child: ClipOval(
          child: Image.asset(
            AppAssets.icPlusBlue,
            height: 60,
            width: 60,
          ),
        ),
      ),
    );
  }

// <List<UserData>> List<UserData>
  _userData() {
    return FutureBuilder(
      future: userdata,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("PPPPPPP....................???????");
        if (snapshot.connectionState == ConnectionState.done) {
          aUserModel = UserModel.fromJson(decodedResult);
          print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKK....................???????");
          print(aUserModel);
          List<UserData> data = aUserModel.data!;
          if (_hasBeenPressed == 'name') {
            data.sort((a, b) {
              return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'company') {
            data.sort((a, b) {
              return a.materialName!
                  .toLowerCase()
                  .compareTo(b.materialName!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'occupation') {
            data.sort((a, b) {
              return a.location!
                  .toLowerCase()
                  .compareTo(b.location!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'location') {
            data.sort((a, b) {
              return a.invoiceNo!
                  .toLowerCase()
                  .compareTo(b.invoiceNo ?? ''.toLowerCase());
            });
          }
          return _user(aUserModel);
        } else if (snapshot.hasError) {
          return const AppLoader();
        }

        return const AppLoader();
      },
    );
  }

  Widget filter() {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //#1 Inprogress
            InkWell(
                onTap: () {
                  setState(() {
                    _hasBeenPressed1 = 'Inprogress';
                    _hasBeenPressed2 = '';
                  });
                  userdata = getData();
                },
                child: Text('Inprogress',
                    style: TextStyle(
                        fontFamily: appFontFamily,
                        color: _hasBeenPressed1 == 'Inprogress'
                            ? AppColors.blueColor
                            : AppColors.black,
                        fontWeight: _hasBeenPressed1 == 'Inprogress'
                            ? FontWeight.w700
                            : FontWeight.normal))),

            const Text(
              ' | ',
              style: TextStyle(
                  fontFamily: appFontFamily,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700),
            ),

            //#2 Approved
            InkWell(
              onTap: () {
                setState(() {
                  _hasBeenPressed1 = 'Approved';
                });
                userdata = getData();
              },
              child: Text(
                'Approved',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: _hasBeenPressed1 == 'Approved'
                        ? AppColors.blueColor
                        : AppColors.black,
                    fontWeight: _hasBeenPressed1 == 'Approved'
                        ? FontWeight.w700
                        : FontWeight.normal),
              ),
            ),
            // if (organizationtype == 'RMB Chapter' ||
            //     organizationtype == 'Me-connect Chapter')
            const Text(
              ' | ',
              style: TextStyle(
                  fontFamily: appFontFamily,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700),
            ),

            //#3 Pending
            // if (organizationtype == 'RMB Chapter' ||
            //     organizationtype == 'Me-connect Chapter')
            InkWell(
              onTap: () {
                setState(() {
                  _hasBeenPressed1 = 'Pending';
                });
                userdata = getData();
              },
              child: Text(
                'Pending',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: _hasBeenPressed1 == 'Pending'
                        ? AppColors.blueColor
                        : AppColors.black,
                    fontWeight: _hasBeenPressed1 == 'Pending'
                        ? FontWeight.w700
                        : FontWeight.normal),
              ),
            ),
            // if (organizationtype == 'RMB Chapter' ||
            //     organizationtype == 'Me-connect Chapter')
            const Text(
              ' | ',
              style: TextStyle(
                  fontFamily: appFontFamily,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700),
            ),

            //#4 Rejected
            // if (organizationtype == 'RMB Chapter' ||
            //     organizationtype == 'Me-connect Chapter')
            InkWell(
              onTap: () {
                setState(() {
                  _hasBeenPressed1 = 'Rejected';
                });
                userdata = getData();
              },
              child: Text(
                'Rejected',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: _hasBeenPressed1 == 'Rejected'
                        ? AppColors.blueColor
                        : AppColors.black,
                    fontWeight: _hasBeenPressed1 == 'Rejected'
                        ? FontWeight.w700
                        : FontWeight.normal),
              ),
            ),
          ],
        ));
  }

  Column _user(UserModel data) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(padding: EdgeInsets.only(top: 15, left: 10, right: 10)),
      const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('IQCP Test List',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.blueColor)),
            ],
          )),
      const Padding(padding: EdgeInsets.only(top: 15, left: 10, right: 10)),
      Row(children: <Widget>[
        Container(
          child: Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: SearchController,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: AppStyles.textFieldInputDecoration.copyWith(
                  hintText: "Search IQCP",
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                    color: AppColors.lightBlackColor,
                  )),
              style: AppStyles.textInputTextStyle,
              onChanged: (value) {
                setState(() {});
              },
            ),
          )),
        ),
      ]),
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [filter()],
          )),
      Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  data.data!.length > 1
                      ? '${data.data!.length} Tests'
                      : '${data.data!.length} Test',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: appFontFamily,
                      fontSize: 15,
                      color: AppColors.greyColor)),
              // if (isAllowedEdit) filter()
            ],
          )),
      Container(
        child: Expanded(
            child: ListView.builder(
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  if (SearchController.text.isEmpty) {
                    return Container(
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else if ((data.data![index].name ?? '')
                          .toLowerCase()
                          .contains((SearchController.text).toLowerCase()) ||
                      data.data![index].materialName!
                          .toLowerCase()
                          .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else if (data.data![index].location!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else if (data.data![index].invoiceNo!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else if ((data.data![index].employeeID!)
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else if (data.data![index].solarDetailID!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].solarDetailID ?? '',
                            data.data![index].materialName ?? '',
                            data.data![index].profileImg ?? '',
                            data.data![index].name ?? '',
                            data.data![index].location ?? '',
                            data.data![index].invoiceNo ?? '',
                            data.data![index].employeeID ?? ''));
                  } else {
                    return Container();
                  }
                })),
      ),
      const SizedBox(
        height: 20,
      )
    ]);
  }

  Widget _tile(String id, String materialname, String profilepic, String name,
      String location, String invoiceno, String employeeid) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => DirectoryDetails(
        //               personId: id,
        //             )),
        //     (Route<dynamic> route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: CachedNetworkImage(
                        imageUrl: profilepic,
                        height: 60,
                        width: 60,
                        placeholder: (context, url) {
                          return ClipOval(
                            child: Image.asset(
                              AppAssets.profilePlaceholder,
                              height: 60,
                              width: 60,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return ClipOval(
                            child: Image.asset(
                              AppAssets.profilePlaceholder,
                              height: 60,
                              width: 60,
                            ),
                          );
                        },
                      ),
                    )),
                  ),
                  Container(
                    child: Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Name
                        Row(children: <Widget>[
                          Flexible(
                            child: Text(materialname,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: appFontFamily,
                                    fontSize: 16,
                                    color: AppColors.lightBlackColor)),
                          ),
                        ]),

                        Row(children: <Widget>[
                          ClipRRect(
                            child: Image.asset(
                              AppAssets.icLocate,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(location,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: appFontFamily)),
                        ]),
                        SizedBox(
                          height: 5,
                        ),
                        //Occupication
                        Row(children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 95, 245, 8), // Background color
                              borderRadius: BorderRadius.circular(
                                  10), // Optional: Add border radius for rounded corners
                            ),
                            child: Text(
                              employeeid,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // Optional: Set text color
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                  255, 104, 3, 236), // Background color
                              borderRadius: BorderRadius.circular(
                                  10), // Optional: Add border radius for rounded corners
                            ),
                            child: Text(
                              "By: $name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color.fromARGB(255, 255, 255,
                                    255), // Optional: Set text color
                              ),
                            ),
                          ),
                        ]),

                        const SizedBox(
                          height: 2,
                        ),

                        // detail == id
                        //     ? SizedBox(
                        //         child: Padding(
                        //         padding: const EdgeInsets.only(top: 10),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             //Row 1
                        //             Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.start,
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: <Widget>[
                        //                   InkWell(
                        //                     onTap: () {
                        //                       UrlLauncher.launch(
                        //                           'tel:+${'+91' + officialcontactno}');
                        //                     },
                        //                     child: Image.asset(
                        //                       AppAssets.icRoundCallBlue,
                        //                       height: 40,
                        //                       width: 40,
                        //                     ),
                        //                   ),
                        //                   const SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       UrlLauncher.launch(
                        //                           'whatsapp://send?text=Hello&phone=${'+91' + officialcontactno}');
                        //                     },
                        //                     child: Image.asset(
                        //                       AppAssets.icRoundWhtspGreen,
                        //                       height: 40,
                        //                       width: 40,
                        //                     ),
                        //                   ),
                        //                   const SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   InkWell(
                        //                     onTap: () {
                        //                       UrlLauncher.launch(
                        //                           'mailto:${officialemail}');
                        //                     },
                        //                     child: Image.asset(
                        //                       AppAssets.icRoundEmailYellow,
                        //                       height: 40,
                        //                       width: 40,
                        //                     ),
                        //                   ),
                        //                   //  if (isAllowedEdit)
                        //                   const SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   // if (isAllowedEdit)
                        //                   InkWell(
                        //                       child: Image.asset(
                        //                         AppAssets.icMemberEdit,
                        //                         height: 40,
                        //                         width: 40,
                        //                       ),
                        //                       onTap: () {
                        //                         Navigator.of(context)
                        //                             .pushAndRemoveUntil(
                        //                                 MaterialPageRoute(
                        //                                     builder: (BuildContext
                        //                                             context) =>
                        //                                         AddEditProfile(
                        //                                             id: id)),
                        //                                 (Route<dynamic>
                        //                                         route) =>
                        //                                     false);
                        //                       }),
                        //                   //  if (isAllowedEdit)
                        //                   const SizedBox(
                        //                     width: 5,
                        //                   ),
                        //                   //  if (isAllowedEdit)
                        //                   // InkWell(
                        //                   //     child: Image.asset(
                        //                   //       AppAssets.icMemberDelete,
                        //                   //       height: 40,
                        //                   //       width: 40,
                        //                   //     ),
                        //                   //     onTap: () {
                        //                   //       showDialog(
                        //                   //         context: context,
                        //                   //         builder:
                        //                   //             (BuildContext context) {
                        //                   //           return Dialog(
                        //                   //             shape:
                        //                   //                 RoundedRectangleBorder(
                        //                   //               borderRadius:
                        //                   //                   BorderRadius
                        //                   //                       .circular(21),
                        //                   //             ),
                        //                   //             elevation: 0,
                        //                   //             backgroundColor:
                        //                   //                 Colors.transparent,
                        //                   //             child: contentBox(
                        //                   //                 context, id),
                        //                   //           );
                        //                   //         },
                        //                   //       );
                        //                   //     })
                        //                 ]),

                        //             // Row 2
                        //             const SizedBox(
                        //               height: 7,
                        //             ),
                        //             // if (employeementtype == 'External')
                        //             //   Row(
                        //             //     mainAxisAlignment:
                        //             //         MainAxisAlignment.start,
                        //             //     crossAxisAlignment:
                        //             //         CrossAxisAlignment.center,
                        //             //     children: [
                        //             //       GestureDetector(
                        //             //         onTap: () {
                        //             //           print(id);

                        //             //           showDialog(
                        //             //             context: context,
                        //             //             builder:
                        //             //                 (BuildContext context) {
                        //             //               return Dialog(
                        //             //                 shape:
                        //             //                     RoundedRectangleBorder(
                        //             //                   borderRadius:
                        //             //                       BorderRadius.circular(
                        //             //                           21),
                        //             //                 ),
                        //             //                 elevation: 0,
                        //             //                 backgroundColor:
                        //             //                     Colors.transparent,
                        //             //                 child: attendanceBox(
                        //             //                     context, employeeid),
                        //             //               );
                        //             //             },
                        //             //           );
                        //             //         },
                        //             //         child: Container(
                        //             //           padding: EdgeInsets.symmetric(
                        //             //               horizontal: 10, vertical: 5),
                        //             //           decoration: BoxDecoration(
                        //             //             color: Colors
                        //             //                 .blue, // Background color
                        //             //             borderRadius: BorderRadius.circular(
                        //             //                 10), // Optional: Add border radius for rounded corners
                        //             //           ),
                        //             //           child: const Text(
                        //             //             'IN',
                        //             //             style: TextStyle(
                        //             //               fontWeight: FontWeight.bold,
                        //             //               fontSize: 16,
                        //             //               color: Colors
                        //             //                   .white, // Optional: Set text color
                        //             //             ),
                        //             //           ),
                        //             //         ),
                        //             //       ),
                        //             //       const SizedBox(
                        //             //         width: 5,
                        //             //       ),
                        //             //       const SizedBox(
                        //             //         width: 5,
                        //             //       ),
                        //             //       GestureDetector(
                        //             //         onTap: () {
                        //             //           print(id);
                        //             //           showDialog(
                        //             //             context: context,
                        //             //             builder:
                        //             //                 (BuildContext context) {
                        //             //               return Dialog(
                        //             //                 shape:
                        //             //                     RoundedRectangleBorder(
                        //             //                   borderRadius:
                        //             //                       BorderRadius.circular(
                        //             //                           21),
                        //             //                 ),
                        //             //                 elevation: 0,
                        //             //                 backgroundColor:
                        //             //                     Colors.transparent,
                        //             //                 child: attendanceBox(
                        //             //                     context, employeeid),
                        //             //               );
                        //             //             },
                        //             //           );
                        //             //         },
                        //             //         child: Container(
                        //             //           padding: EdgeInsets.symmetric(
                        //             //               horizontal: 10, vertical: 5),
                        //             //           decoration: BoxDecoration(
                        //             //             color: Colors
                        //             //                 .blue, // Background color
                        //             //             borderRadius: BorderRadius.circular(
                        //             //                 10), // Optional: Add border radius for rounded corners
                        //             //           ),
                        //             //           child: const Text(
                        //             //             'OUT',
                        //             //             style: TextStyle(
                        //             //               fontWeight: FontWeight.bold,
                        //             //               fontSize: 16,
                        //             //               color: Colors
                        //             //                   .white, // Optional: Set text color
                        //             //             ),
                        //             //           ),
                        //             //         ),
                        //             //       ),
                        //             //       const SizedBox(
                        //             //         width: 5,
                        //             //       ),
                        //             //     ],
                        //             //   )
                        //           ],
                        //         ),
                        //       ))
                        // : const Row(),
                      ],
                    )),
                  ),
                  if (designation != 'QC' && _hasBeenPressed1 == 'Pending')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SolarCell(id: id)),
                                (Route<dynamic> route) => false);
                            // setState(() {
                            //   print(id);
                            //   if (detail == id) {
                            //     detail = 'hide';
                            //   } else {
                            //     detail = id;
                            //   }
                            // });
                          },
                          child: Image.asset(
                            AppAssets.icApproved,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.dividerColor,
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget appBarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: Image.network(
                "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg",
                fit: BoxFit.cover,
                height: 50,
                width: 50),
          ),
        ),
        // Image.asset(
        //   AppAssets.icAppLogoHorizontal,
        //   width: 150,
        //   height: 45,
        // )
      ],
    );
  }
}
