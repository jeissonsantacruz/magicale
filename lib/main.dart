import 'package:flutter/material.dart';
import 'package:magicale/communities/_sections/community_attend.dart';
import 'package:magicale/communities/_sections/community_detail.dart';
import 'package:magicale/communities/_sections/new_outting.dart';
import 'package:magicale/home/_sections/post.dart';
import 'package:magicale/home/page.dart';
import 'package:magicale/register/page.dart';
import 'package:magicale/register/sections/validate.dart';
import 'package:magicale/root/page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'login/page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<bool> checkLoginValue() async {
    SharedPreferences loginCheck = await SharedPreferences.getInstance();
    return loginCheck.getBool("login") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      navigatorKey: navigatorKey,
      home: FutureBuilder<bool>(
        future: checkLoginValue(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if ((snapshot.data ?? false) == false) {
            return SignUpScreen();
          } else {
            return RootApp();
          }
        },
      ),
      routes: {
        '/singUp': (context) => SignUpScreen(),
        'rootPage': (context) => RootApp(),
        '/home': (context) => HomePage(),
         '/post': (context) => PostPage(),
        '/register': (context) => RegisterPage(),
        '/verificationFlow': (context) => VerifycationFlowPage(),
        '/communityDetail': (context) => CommunitiesDetailPage(),
         '/communityDetailAttend': (context) => CommunityDetailAttend(),
         '/newOuting':(context) => NewOuting(),
         '/pinCodeVerification':(context) => PinCodeVerificationScreen('')
      },
    );
  }
}