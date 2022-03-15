import 'package:flutter/material.dart';
import 'package:magicale/widgets/rounded_button.dart';

import '../../constants.dart';

class Community extends StatelessWidget {
  const Community({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 580,
      padding: EdgeInsets.all(8),
      child: Card(
        color: kGreyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: 250,
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Wikipedia_space_ibiza%2803%29.jpg/640px-Wikipedia_space_ibiza%2803%29.jpg',
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'COMMUNITY NAME',
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Description,Description, Description, Description, Description, Description, Description, Description, Description, Description, Description, Description, Description...',
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(
                        'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Smith',
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Private',
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            'https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png'),
                      ),
                      title: Text(
                        '20 Members',
                        style:
                            TextStyle(color: kPrimaryLightColor, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                padx: 10,
                textColor: Colors.white,
                text: "Request to Join",
                color: kPrimaryBlueColor,
                press: () {
                    Navigator.pushNamed(context, '/communityDetail');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
