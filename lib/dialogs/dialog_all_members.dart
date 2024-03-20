// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, must_call_super, annotate_overrides
import 'package:QCM/user_list_model.dart';
import 'package:flutter/material.dart';

import '../constant/app_color.dart';
import '../constant/app_fonts.dart';
import '../constant/app_strings.dart';
import '../constant/app_styles.dart';

class DialogAllMembers extends StatefulWidget {
  final UserModel? data;
  final String? ImagePath;
  const DialogAllMembers({
    Key? key,
    this.data,
    this.ImagePath,
  }) : super(key: key);

  @override
  _DialogAllMembersState createState() => _DialogAllMembersState();
}

class _DialogAllMembersState extends State<DialogAllMembers> {
  double padding = 10;
  // ignore: non_constant_identifier_names
  late List<UserData> personList;
  String errorMessage = "", ratting = '';
  // ignore: unused_field
  final GlobalKey<FormState> _formKey = GlobalKey();
  var searchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      personList = widget.data!.data!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      // backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/ic_close.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                )),
            //Search
            Row(children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: searchTextEditingController,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          setState(() {
                            personList = widget.data!.data!;
                          });
                        } else {
                          List<UserData> filterCountryList = [];
                          personList.forEach((Person) {
                            if ((Person.fullname!
                                    .toLowerCase()
                                    .contains(value.toLowerCase())) ||
                                (Person.fullname!
                                    .toLowerCase()
                                    .contains(value.toLowerCase())) ||
                                (Person.fullname!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))) {
                              filterCountryList.add(Person);
                            }
                          });
                          setState(() {
                            personList = filterCountryList;
                          });
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: AppStyles.textFieldInputDecoration.copyWith(
                          hintText: "Search by Name",
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                            color: AppColors.lightBlackColor,
                          )),
                      style: AppStyles.textInputTextStyle,
                    ),
                  ),
                ),
              )),
            ]),
            Expanded(
              child: ListView.separated(
                itemCount: personList.length,
                itemBuilder: (context, index) {
                  String imgUrl =
                      widget.ImagePath! + widget.data!.data![index].profilepic!;
                  return InkWell(
                    onTap: () {
                      var Dialogdata = {
                        "PersonId": personList[index].personid,
                        "FullName": personList[index].fullname! +
                            " " +
                            personList[index].fullname!,
                        "Email": personList[index].officialemail,
                        "Phone": personList[index].officialcontactno
                      };
                      Navigator.of(context).pop(Dialogdata);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Text(
                        personList[index].fullname! +
                            " " +
                            personList[index].fullname!,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.0,
                            fontFamily: appFontFamily,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ]),
    );
  }
}
