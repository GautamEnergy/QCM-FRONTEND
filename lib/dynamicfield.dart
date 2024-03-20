import 'package:QCM/constant/app_color.dart';
import 'package:QCM/constant/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DynamicField());
}

class DynamicField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic TextFields with Radio Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DynamicTextFieldsWithRadioButtons(),
    );
  }
}

class DynamicTextFieldsWithRadioButtons extends StatefulWidget {
  @override
  _DynamicTextFieldsWithRadioButtonsState createState() =>
      _DynamicTextFieldsWithRadioButtonsState();
}

class _DynamicTextFieldsWithRadioButtonsState
    extends State<DynamicTextFieldsWithRadioButtons> {
  int numberOfFields = 5; // Initial number of text fields
  List<TextEditingController> controllers = [];
  late List<bool> selectedRadioValues; // Radio button values
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty text editing controllers
    for (int i = 0; i < numberOfFields; i++) {
      controllers.add(TextEditingController());
    }
    selectedRadioValues = List<bool>.generate(numberOfFields,
        (index) => true); // Initialize all radio button values to false
    // selectedRadioValues[0] = true; // Initially select the first option
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // Dispose all text editing controllers when the widget is disposed
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic TextFields with Radio Buttons'),
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: numberOfFields,
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
                    controller: controllers[index],
                    decoration: AppStyles.textFieldInputDecoration.copyWith(
                        hintText: "Please Enter Barcode",
                        counterText: '',
                        contentPadding: EdgeInsets.all(10)),
                    style: AppStyles.textInputTextStyle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Sample Barcode.';
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
                        groupValue: selectedRadioValues[index],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedRadioValues[index] = value!;
                          });
                        },
                      ),
                      Text(
                        'True',
                        style: AppStyles.textfieldCaptionTextStyle,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Radio(
                        value: false,
                        groupValue: selectedRadioValues[index],
                        onChanged: (bool? value) {
                          setState(() {
                            selectedRadioValues[index] = value!;
                          });
                        },
                      ),
                      Text(
                        'False',
                        style: AppStyles.textfieldCaptionTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numberOfFields++; // Increment the number of fields
            controllers.add(TextEditingController());
            selectedRadioValues.add(false);
          });
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Validate the form
            if (_formKey.currentState!.validate()) {
              // Perform action on submit button press
              print('Text Field Values:');
              for (int i = 0; i < numberOfFields; i++) {
                print('Field ${i + 1}: ${controllers[i].text}');
                print('Radio Button Value ${i + 1}: ${selectedRadioValues[i]}');
              }
              print('Radio Button Values: $selectedRadioValues');
            }
          },
          child: Text('Submit'),
        ),
      ),
    );
  }
}
