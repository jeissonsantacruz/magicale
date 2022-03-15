import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/widgets/rounded_button.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';

class NewOuting extends StatefulWidget {
  @override
  _NewOutingState createState() => _NewOutingState();
}

class _NewOutingState extends State<NewOuting> {
  File imageFile;
  DateTime _selectedDateTime = DateTime.now();
  bool isSwitched = false;

  TextEditingController timeinput = TextEditingController();
  String _currentSelectedValue;
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text("New Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: 300,
              child: imageFile == null
                  ? DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(20),
                      dashPattern: [10, 10],
                      color: Colors.grey,
                      strokeWidth: 2,
                      child: Column(
                        children: [
                          Image.network(
                            'https://i.pinimg.com/474x/52/8d/c9/528dc91d4837ee4c7f4ef111c2289b1f.jpg',
                            height: 100,
                          ),
                          Text('Select to Upload Cover Picture (Optional)')
                        ],
                      ))
                  : Container(
                      child: Image.file(
                        imageFile,
                        height: 300,
                        width: 1000,
                      ),
                    ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: kPrimaryLightColor,
                      ),
                      onPressed: () => _getFromCamera()),
                  IconButton(
                      icon: Icon(
                        Icons.library_add,
                        color: kPrimaryLightColor,
                      ),
                      onPressed: () => _getFromGallery())
                ],
              ),
            ),
            _RoundedInputField(
              hintText: "Title",
              onChanged: (value) {
                // blocProvider.add(
                //   bloc.ChangeNameEvent(value),
                // );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CupertinoDateTextBox(
              color: CupertinoColors.white,
              initialValue: _selectedDateTime,
              onDateChange: onBirthdayChange,
              hintText: DateFormat.yMd().format(_selectedDateTime),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: timeinput, //editing controller of this TextField
              decoration: InputDecoration(
                labelText: "time",
                labelStyle: TextStyle(color: kPrimaryGreyColor),
                hintStyle: TextStyle(color: kPrimaryGreyColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: kPrimaryLightColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: kPrimaryLightColor,
                    width: 1.0,
                  ),
                ),
              ),
              style: TextStyle(color: kPrimaryGreyColor),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay pickedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if (pickedTime != null) {
                  print(pickedTime.format(context)); //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm()
                      .parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime =
                      DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    timeinput.text =
                        formattedTime; //set the value of text field.
                  });
                } else {
                  print("Time is not selected");
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            _RoundedInputField(
              hintText: "Locations",
              onChanged: (value) {
                // blocProvider.add(
                //   bloc.ChangeNameEvent(value),
                // );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Open to Suggestions:",
                  style: TextStyle(color: kPrimaryLightColor, fontSize: 13),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            isSwitched == true
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Text(
                              "Poll (Optional):",
                              style: TextStyle(
                                  color: kPrimaryLightColor, fontSize: 13),
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: "time",
                                    labelStyle:
                                        TextStyle(color: kPrimaryGreyColor),
                                    hintStyle:
                                        TextStyle(color: kPrimaryGreyColor),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: kPrimaryLightColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: kPrimaryLightColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  isEmpty: _currentSelectedValue == '',
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      style:
                                          TextStyle(color: kPrimaryGreyColor),
                                      value: _currentSelectedValue,
                                      isDense: true,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _currentSelectedValue = newValue;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: _currencies.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              labelText: "time",
                              labelStyle: TextStyle(color: kPrimaryGreyColor),
                              hintStyle: TextStyle(color: kPrimaryGreyColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: kPrimaryLightColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: kPrimaryLightColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                style: TextStyle(color: kPrimaryGreyColor),
                                value: _currentSelectedValue,
                                isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _currencies.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
                : Container(),
            RoundedButton(
              text: "Share",
              color: kPrimaryBlueColor,
              press: () {
                // if (_formKey.currentState.validate()) {}
                // if (!state.model.isActive) return;
                Navigator.pushNamed(
                  context,
                  "/verificationFlow",
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 500,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}

class _RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final type;
  final ValueChanged<String> onChanged;
  const _RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: type,
      onChanged: onChanged,
      cursorColor: kPrimaryGreyColor,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        labelStyle: TextStyle(color: kPrimaryGreyColor),
        hintStyle: TextStyle(color: kPrimaryGreyColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: kPrimaryLightColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: kPrimaryLightColor,
            width: 1.0,
          ),
        ),
      ),
      style: TextStyle(color: kPrimaryGreyColor),
    );
  }
}
