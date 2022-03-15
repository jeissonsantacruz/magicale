import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/register/bloc/bloc.dart' as bloc;
import 'package:magicale/widgets/pass_input_field.dart';
import 'package:magicale/widgets/rounded_button.dart';
import 'package:magicale/widgets/rounded_input_field.dart';
import 'package:magicale/widgets/tul_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

part 'package:magicale/register/sections/selectFlow.dart';

// Class that contains the  SingUp Screem
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final blocProvider = bloc.Bloc();
  _loadPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
  }

  @override
  void initState() {
    // Managment of states of login
    blocProvider.listen((state) {
      if (state is bloc.SendingState) {
        TulLoading.show(context);
      }
      // when the data user was sended successfully,  save login in true
      if (state is bloc.SendedState) {
        Navigator.pop(context);
        _loadPrefrences();
        Navigator.pushNamed(context, '/home');
      }

      if (state is bloc.ErrorState) {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Sucedio un error, intentalo de nuevo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      if (state is bloc.FailureDownloadingState) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<bloc.Bloc, bloc.State>(
      cubit: blocProvider,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Create your free account",
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Do you already have an account? Sign in",
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/icons/magicale.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RoundedInputField(
                        hintText: "Full Name",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangeFullEvent(value),
                          );
                        },
                      ),
                      RoundedInputField(
                        hintText: "Username",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangeNameEvent(value),
                          );
                        },
                      ),
                      RoundedInputField(
                        hintText: "E-mail",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangeEmailEvent(value),
                          );
                        },
                      ),
                      PassInputField(
                        icon: Icons.phone,
                        hintText: "Password",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangePassEvent(
                              value,
                            ),
                          );
                        },
                      ),
                      RoundedInputField(
                        type: TextInputType.number,
                        hintText: "Phone Number",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangePhoneEvent(
                              int.parse(value),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Checkbox(
                              value: state.model.checkPolicities ?? false,
                              onChanged: (bool value) {
                                blocProvider.add(
                                  bloc.ChangeCheckEvent(
                                    value,
                                  ),
                                );
                              },
                              fillColor:
                                  MaterialStateProperty.all(kPrimaryLightColor),
                              checkColor: kPrimaryColor,
                            ),
                            InkWell(
                                child: new Text(
                                    'I accept the terms and privacy policy',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: kPrimaryLightColor,
                                        decoration: TextDecoration.underline)),
                                onTap: () {}),
                          ],
                        ),
                      ),
                      RoundedButton(
                        text: "Continue",
                        color: state.model.isActive
                            ? kPrimaryBlueColor
                            : kPrimaryBlueColor.withOpacity(0.5),
                        press: () {
                          if (_formKey.currentState.validate()) {}
                          if (!state.model.isActive) return;
                          Navigator.pushNamed(
                            context,
                            "/pinCodeVerification",
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
