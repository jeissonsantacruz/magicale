import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/widgets/rounded_button.dart';
import 'package:magicale/widgets/rounded_input_field.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        title: Text("New Post"),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: 1000,
            child: imageFile == null
                ? Container(
                    height: 300,
                  )
                : Container(
                    child: Image.file(
                      imageFile,
                      height: 500,
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
          Column(            
            children: [
              RoundedInputField(
                hintText: "Caption",
                onChanged: (value) {
                  // blocProvider.add(
                  //   bloc.ChangeNameEvent(value),
                  // );
                },
              ),
              RoundedInputField(
                hintText: "Location",
                onChanged: (value) {
                  // blocProvider.add(
                  //   bloc.ChangeNameEvent(value),
                  // );
                },
              ),
            ],
          ),
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
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
