import 'package:flutter/material.dart';

import '../constants.dart';

// Class that show a button for login user

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double sizeH, padx,pady;
  final Color color, textColor,shapeColor;
  const RoundedButton({
    Key key,
    this.padx = 20,
    this.pady = 40,
    this.text,
    this.press,
    this.sizeH,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.shapeColor = kPrimaryColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: sizeH == null ?size.width * 0.8: sizeH,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          side: BorderSide(
              width: 2,
              color: shapeColor,
            ),
            shape: new RoundedRectangleBorder(
           borderRadius: new BorderRadius.circular(30.0),
           ),
          padding: EdgeInsets.symmetric(horizontal: pady, vertical: padx),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
