import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/login/bloc/bloc.dart' as bloc;
import 'package:magicale/widgets/pass_input_field.dart';
import 'package:magicale/widgets/rounded_button.dart';
import 'package:magicale/widgets/rounded_input_field.dart';
import 'package:magicale/widgets/tul_loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

// Class that contains the  SingUp Screem
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkPolicies = false;
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
      if( state is bloc.ValidateEmailState) {
        
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
          body: SingleChildScrollView(
            // padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.25),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/icons/magicale.png",
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RoundedInputField(
                        hintText: "Username or E-mail",
                        onChanged: (value) {
                          blocProvider.add(
                            bloc.ChangeNameEvent(value),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkPolicies,
                        onChanged: (bool value) {
                          setState(() {
                            checkPolicies = value;
                          });
                        },
                        fillColor:
                            MaterialStateProperty.all(kPrimaryLightColor),
                        checkColor: kPrimaryColor,
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: kPrimaryLightColor,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                          child: new Text('Forgot Your Password?',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kPrimaryLightColor,
                                  decoration: TextDecoration.underline)),
                          onTap: () {}),
                    ],
                  ),
                ),
                RoundedButton(
                  text: "login",
                  color: kPrimaryBlueColor,
                  press: () {
                    if (_formKey.currentState.validate()) {}
                    if (!state.model.isActive) return;
                    blocProvider.add(
                      bloc.SendEvent(),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "New to magicale?",
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  shapeColor: kPrimaryBlueColor,
                  text: "Create New Account",
                  color: Colors.blue.withOpacity(0.08),
                  press: () {
                     Navigator.pushNamed(context, "/register");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
