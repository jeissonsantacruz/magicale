
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:magicale/communities/page.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/home/page.dart';
import 'package:magicale/messages/page.dart';
import 'package:magicale/profile/page.dart';
import 'package:magicale/widgets/rounded_button.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: kPrimaryColor,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      CommunitiesPage(),
      MessagesPage(),
      ProfilePage()
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        toolbarHeight: 50,
        backgroundColor: kPrimaryLightColor,
        titleSpacing: 10,
        title: Text(
          "MAGICALE",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        actions: [
          RoundedButton(
            padx: 0,
            pady: 0,
            shapeColor: kPrimaryBlueColor,
            text: "Share",
            sizeH: 100.0,
            textColor: kPrimaryBlueColor,
            color: Colors.white,
            press: () {
                Navigator.pushNamed(context, '/post');
            },
          ),
          IconButton(icon: LineIcon.bellAlt(color: kPrimaryColor,), onPressed: (){
          
          })
        ],
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Account"),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
