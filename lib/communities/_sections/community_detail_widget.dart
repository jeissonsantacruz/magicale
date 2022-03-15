import 'package:flutter/material.dart';
import 'package:magicale/widgets/rounded_button.dart';

import '../../constants.dart';

class CommunityDetail extends StatelessWidget {
  const CommunityDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        color: kGreyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Wikipedia_space_ibiza%2803%29.jpg/640px-Wikipedia_space_ibiza%2803%29.jpg',
              ),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'MON, NOV 22 - 7:00 PM EST TITLE OF OUTING',
                      style: TextStyle(color: kPrimaryLightColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          Text(
                            'Location1, Lima, Peru',
                            style: TextStyle(
                                color: kPrimaryLightColor, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        'Private',
                        style: TextStyle(color: kPrimaryLightColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'User1',
                            style: TextStyle(color: kPrimaryLightColor),
                          ),
                        ],
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                                'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '20 Attenders',
                            style: TextStyle(
                                color: kPrimaryLightColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: RoundedButton(
                padx: 10,
                textColor: Colors.white,
                text: "Click to Attend",
                color: kPrimaryBlueColor,
                press: () {
                  Navigator.pushNamed(context, '/communityDetailAttend');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
