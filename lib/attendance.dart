import 'dart:io';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_loader.dart';
import 'package:QCM/constant/app_assets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

// ignore: implementation_imports
import 'package:dio/src/response.dart' as Response;

void main() {
  runApp(Attendance());
}

class Attendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FaceAttendancePage(),
    );
  }
}

class FaceAttendancePage extends StatefulWidget {
  @override
  _FaceAttendancePageState createState() => _FaceAttendancePageState();
}

class _FaceAttendancePageState extends State<FaceAttendancePage> {
  final _dio = Dio();
  Response.Response? _response;
  File? _image;
  List<int>? _imageBytes;
  List<int>? _imageBytesCompressed;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? attendanceResponse = '', site;
  bool _isLoading = false;

  @override
  void initState() {
    setState(() {
      _textController.text = 'G';
    });
    getImage();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _compressImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _compressImage(File imageFile) async {
    var _imageBytesOriginal = imageFile.readAsBytesSync();
    _imageBytes = await FlutterImageCompress.compressWithList(
      _imageBytesOriginal!,
      quality: 2,
    );
  }

  attendance(List<int> bytes, String empid) async {
    final prefs = await SharedPreferences.getInstance();
    site = prefs.getString('site');
    setState(() {
      _isLoading = true;
    });
    var currentdate = DateTime.now().microsecondsSinceEpoch;
    var formData = FormData.fromMap({
      "face": MultipartFile.fromBytes(
        bytes,
        filename: (empid + (currentdate.toString()) + '.jpg'),
        contentType: MediaType("image", 'jpg'),
      ),
    });
//   site = "http://hrmgalo.echonsol.com/api/";
    _response = await _dio.post(
        ('http://hrmgalo.echonsol.com/api/FaceReckognition?employeeid=${empid}'),
        options: Options(
          contentType: 'multipart/form-data',
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        data: formData);

    try {
      if (_response!.data != null && _response!.data != '') {
        setState(() {
          _isLoading = false;
          attendanceResponse = _response!.data;
        });

        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => Attendance()),
              (Route<dynamic> route) => false);
        });
      }
    } catch (err) {
      print("Error");
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
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Face Attendance'),
          // ),
          backgroundColor: Color.fromARGB(255, 159, 226, 231),
          body: _isLoading
              ? AppLoader()
              : Center(
                  child: attendanceResponse == ''
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //  _image == null ? Text('No image selected.') : Image.file(_image!),
                            _image == null
                                ? Container(
                                    width: 300, // Set the desired width
                                    height: 300, // Set the desired height
                                    child: GestureDetector(
                                      onTap: () {
                                        getImage();
                                      },
                                      child: ClipOval(
                                        child: Image.network(
                                          "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg",
                                          fit: BoxFit.cover,
                                          width:
                                              300, // Set width and height to match Container's size
                                          height: 300,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 300, // Set the desired width
                                    height: 300, // Set the desired height
                                    child: ClipOval(
                                      child: Image.file(
                                        _image!, // Assuming _image is a File object
                                        fit: BoxFit.cover,
                                        width:
                                            300, // Set width and height to match Container's size
                                        height: 300,
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 5),
                            Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _textController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Your Employee Id',
                                      labelStyle:
                                          TextStyle(color: Colors.blueGrey),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      hintText: 'e.g., G0001',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      errorStyle: TextStyle(color: Colors.red),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value == 'G') {
                                        return 'Please enter your employee id';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                WelcomePage()),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Image.asset(
                                    'assets/icons/cross.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      String name = _textController.text;
                                      if (_imageBytes != null &&
                                          _imageBytes != '') {
                                        attendance(
                                            (_imageBytes ?? []), (name ?? ''));
                                      } else {
                                        Toast.show("Please Capture Your Face.",
                                            duration: Toast.lengthLong,
                                            gravity: Toast.top,
                                            backgroundColor: Colors.redAccent);
                                      }
                                      // Process your attendance here
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/icons/check.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : attendanceResponse == 'Attendance Marked'
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  height: 300,
                                  child: Image.asset(
                                    AppAssets.imgRight,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            )
                          : attendanceResponse ==
                                  'Unable to get object metadata from S3. Check object key, region and/or access permissions.'
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      height: 300,
                                      child: Image.asset(
                                        AppAssets.imgTryagain,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 300,
                                      height: 300,
                                      child: Image.asset(
                                        AppAssets.imgTryagain,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                ),
        ));
  }
}
