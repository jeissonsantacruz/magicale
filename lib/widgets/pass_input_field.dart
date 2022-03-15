import 'package:flutter/material.dart';
import 'package:magicale/widgets/text_field_container.dart';

import '../constants.dart';

class PassInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final type;
  final ValueChanged<String> onChanged;
  const PassInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  _PassInputFieldState createState() => _PassInputFieldState();
}

class _PassInputFieldState extends State<PassInputField> {
  bool hidePassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
         validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: widget.onChanged,
        cursorColor: kPrimaryGreyColor,
        obscureText: hidePassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
          suffixIcon: IconButton(
            icon: hidePassword
                ? Icon(
                    Icons.visibility_off,
                    color: kPrimaryGreyColor,
                  )
                : Icon(
                    Icons.visibility,
                    color: kPrimaryGreyColor,
                  ),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          ),
        ),
        style: TextStyle(color: kPrimaryGreyColor),
      ),
    );
  }
}
