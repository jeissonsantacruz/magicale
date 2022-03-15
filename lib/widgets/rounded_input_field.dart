import 'package:flutter/material.dart';
import 'package:magicale/widgets/text_field_container.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final type;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.type = TextInputType.text,
  }) : super(key: key);

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
      ),
    );
  }
}
