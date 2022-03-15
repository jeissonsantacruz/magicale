import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magicale/communities/_sections/community_detail_widget.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/widgets/rounded_input_field.dart';

class CommunityDetailAttend extends StatefulWidget {
  const CommunityDetailAttend({Key key}) : super(key: key);

  @override
  _CommunityDetailAttendState createState() => _CommunityDetailAttendState();
}

class _CommunityDetailAttendState extends State<CommunityDetailAttend> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CommunityDetail(),
          SingleChildScrollView(
            child: Container(
              height: 250,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                    'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                              ),
                              title: Text(
                                "User1 Comment Comment Comment Comment Comment Comment Comment Comment",
                                style: TextStyle(
                                    color: kPrimaryLightColor, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '20 minutes ago',
                                  style: TextStyle(
                                      color: kPrimaryLightColor, fontSize: 10),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundImage: NetworkImage(
                                          'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                                    ),
                                    Text(
                                      '100 likes',
                                      style: TextStyle(
                                          color: kPrimaryLightColor,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  "assets/images/love_icon.svg",
                                  width: 17,
                                ),
                                Text(
                                  '  Like',
                                  style: TextStyle(
                                      color: kPrimaryLightColor, fontSize: 10),
                                ),
                                Text(
                                  '  Comment',
                                  style: TextStyle(
                                      color: kPrimaryLightColor, fontSize: 10),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
              ),
              Container(
                child: RoundedInputField(
                  hintText: "Username",
                  onChanged: (value) {
                    // blocProvider.add(
                    //   bloc.ChangeNameEvent(value),
                    // );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
