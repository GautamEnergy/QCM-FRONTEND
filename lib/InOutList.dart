import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:QCM/CommonDrawer.dart';
import 'package:QCM/InOutListg.dart';
import 'package:QCM/LoginPage.dart';
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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class InOut extends StatefulWidget {
  @override
  _InOutState createState() => _InOutState();
}

class _InOutState extends State<InOut> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  TextEditingController SearchController = TextEditingController();
  // TextEditingController _paymentModeController = new TextEditingController();
  TextEditingController ExpiryDateController = new TextEditingController();
  TextEditingController PaymentDateController = new TextEditingController();

  TextEditingController NoteController = new TextEditingController();
  GlobalKey<FormState> _renewalFormkey = GlobalKey<FormState>();

  bool _isLoading = false, IN = false, OUT = false;
  bool menu = true, user = false, face = false, home = false;
  String? _paymentModeController;
  List paymentModeData = [];
  String? personid,
      vCard,
      firstname,
      lastname,
      pic,
      logo,
      site,
      ImagePath,
      detail,
      businessname,
      organizationName,
      otherChapterName = '',
      _hasBeenPressedorganization = '',
      organizationtype,
      _hasBeenPressed = '',
      _hasBeenPressed1 = 'Active',
      _hasBeenPressed2 = '',
      Expirydate,
      Paymentdate;
  // RoleModel? paymentModeData;
  TextEditingController AmountController = new TextEditingController();
  bool status = false, isAllowedEdit = false;
  var decodedResult;
  var rmbDropDown;
  Future? userdata;
  late InOutModel aUserModel;
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
    });
    print(site);
    print("Hi...?");

    userdata = getData();
  }

  Future<List<InOutData>?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    setState(() {
      _isLoading = true;
    });

    final url = (site! + 'getInOutData');

    http.get(
      Uri.parse(url),
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
                      return WelcomePage();
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
                                  builder: (BuildContext context) => InOut()),
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
                bottomNavigationBar: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 235, 224, 163),
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
                                        WelcomePage()));
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EmployeeList()));
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Attendance()));
                          },
                          child: Image.asset(
                              face
                                  ? AppAssets.imgSelectedFace
                                  : AppAssets.imgFace,
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

// <List<UserData>> List<UserData>
  _userData() {
    return FutureBuilder(
      future: userdata,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("PPPPPPP....................???????");
        if (snapshot.connectionState == ConnectionState.done) {
          aUserModel = InOutModel.fromJson(decodedResult);
          print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKK....................???????");
          print(aUserModel);
          List<InOutData> data = aUserModel.data!;
          if (_hasBeenPressed == 'name') {
            data.sort((a, b) {
              return a.fullname!
                  .toLowerCase()
                  .compareTo(b.fullname!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'company') {
            data.sort((a, b) {
              return a.fullname!
                  .toLowerCase()
                  .compareTo(b.fullname!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'occupation') {
            data.sort((a, b) {
              return a.employeeid!
                  .toLowerCase()
                  .compareTo(b.employeeid!.toLowerCase());
            });
          } else if (_hasBeenPressed == 'location') {
            data.sort((a, b) {
              return a.employeeid!
                  .toLowerCase()
                  .compareTo(b.employeeid ?? ''.toLowerCase());
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
            //#1 Active
            InkWell(
                onTap: () {
                  setState(() {
                    _hasBeenPressed1 = 'Active';
                    _hasBeenPressed2 = '';
                  });
                  userdata = getData();
                },
                child: Text('Active',
                    style: TextStyle(
                        fontFamily: appFontFamily,
                        color: _hasBeenPressed1 == 'Active'
                            ? AppColors.blueColor
                            : AppColors.black,
                        fontWeight: _hasBeenPressed1 == 'Active'
                            ? FontWeight.w700
                            : FontWeight.normal))),

            const Text(
              ' | ',
              style: TextStyle(
                  fontFamily: appFontFamily,
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.w700),
            ),

            //#2 Inactive
            InkWell(
              onTap: () {
                setState(() {
                  _hasBeenPressed1 = 'Inactive';
                });
                userdata = getData();
              },
              child: Text(
                'Inactive',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: _hasBeenPressed1 == 'Inactive'
                        ? AppColors.blueColor
                        : AppColors.black,
                    fontWeight: _hasBeenPressed1 == 'Inactive'
                        ? FontWeight.w700
                        : FontWeight.normal),
              ),
            ),
            if (organizationtype == 'RMB Chapter' ||
                organizationtype == 'Me-connect Chapter')
              const Text(
                ' | ',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w700),
              ),

            //#3 Pending
            if (organizationtype == 'RMB Chapter' ||
                organizationtype == 'Me-connect Chapter')
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
            if (organizationtype == 'RMB Chapter' ||
                organizationtype == 'Me-connect Chapter')
              const Text(
                ' | ',
                style: TextStyle(
                    fontFamily: appFontFamily,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w700),
              ),

            //#4 Decline
            if (organizationtype == 'RMB Chapter' ||
                organizationtype == 'Me-connect Chapter')
              InkWell(
                onTap: () {
                  setState(() {
                    _hasBeenPressed1 = 'Decline';
                  });
                  userdata = getData();
                },
                child: Text(
                  'Declined',
                  style: TextStyle(
                      fontFamily: appFontFamily,
                      color: _hasBeenPressed1 == 'Decline'
                          ? AppColors.blueColor
                          : AppColors.black,
                      fontWeight: _hasBeenPressed1 == 'Decline'
                          ? FontWeight.w700
                          : FontWeight.normal),
                ),
              ),
          ],
        ));
  }

  Column _user(InOutModel data) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(padding: EdgeInsets.only(top: 15, left: 10, right: 10)),
      const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Daily Attendance List',
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
                  hintText: 'Search',
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
            children: [if (isAllowedEdit) filter()],
          )),
      Container(
        child: Expanded(
            child: ListView.builder(
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  if (SearchController.text.isEmpty) {
                    return Container(
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
                  } else if ((data.data![index].fullname ?? '')
                          .toLowerCase()
                          .contains((SearchController.text).toLowerCase()) ||
                      data.data![index].employeeid!
                          .toLowerCase()
                          .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
                  } else if (data.data![index].outtime!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
                  } else if (data.data![index].totaltime!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
                  } else if ((data.data![index].intime!)
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
                  } else if (data.data![index].employeeid!
                      .toLowerCase()
                      .contains((SearchController.text).toLowerCase())) {
                    return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: _tile(
                            data.data![index].employeeid ?? '',
                            data.data![index].date!,
                            data.data![index].profilepic ?? '',
                            data.data![index].fullname ?? '',
                            data.data![index].intime ?? '',
                            data.data![index].outtime ?? '',
                            data.data![index].totaltime ?? ''));
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

  Widget _tile(
    String empid,
    DateTime date,
    String profilepic,
    String name,
    String intime,
    String outtime,
    String totaltime,
  ) {
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
                            child: Text(name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: appFontFamily,
                                    fontSize: 16,
                                    color: AppColors.lightBlackColor)),
                          ),
                        ]),

                        //Occupication
                        Row(children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  255, 39, 0, 211), // Background color
                              borderRadius: BorderRadius.circular(
                                  10), // Optional: Add border radius for rounded corners
                            ),
                            child: Text(
                              'IN : ${intime}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.white, // Optional: Set text color
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          if (outtime != '')
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                    255, 30, 231, 4), // Background color
                                borderRadius: BorderRadius.circular(
                                    10), // Optional: Add border radius for rounded corners
                              ),
                              child: Text(
                                'OUT : ${outtime}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color.fromARGB(
                                      255, 0, 0, 0), // Optional: Set text color
                                ),
                              ),
                            ),
                          const SizedBox(
                            width: 7,
                          ),
                          if (totaltime != '')
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                    255, 240, 6, 135), // Background color
                                borderRadius: BorderRadius.circular(
                                    10), // Optional: Add border radius for rounded corners
                              ),
                              child: Text(
                                'TOTAL : ${totaltime}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 255, 255,
                                      255), // Optional: Set text color
                                ),
                              ),
                            ),
                        ]),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: <Widget>[
                          Flexible(
                            child: Text(empid,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: appFontFamily,
                                  fontSize: 12,
                                )),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                  255, 236, 245, 118), // Background color
                              borderRadius: BorderRadius.circular(
                                  10), // Optional: Add border radius for rounded corners
                            ),
                            child: Text(
                              DateFormat.yMMMMd().format(date),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // Optional: Set text color
                              ),
                            ),
                          ),
                        ]),
                      ]),

                  // Row 2
                ))
              ],
            )),
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
