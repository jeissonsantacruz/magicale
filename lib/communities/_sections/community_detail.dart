import 'package:flutter/material.dart';
import 'package:magicale/communities/_sections/community_detail_widget.dart';
import 'package:magicale/constants.dart';
import 'package:magicale/widgets/rounded_button.dart';

class CommunitiesDetailPage extends StatefulWidget {
  const CommunitiesDetailPage({Key key}) : super(key: key);

  @override
  _CommunitiesDetailPageState createState() => _CommunitiesDetailPageState();
}

class _CommunitiesDetailPageState extends State<CommunitiesDetailPage> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal:40.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'COMMUNITY NAME',
                          style: TextStyle(color: kPrimaryLightColor),
                        ),
                        RoundedButton(
                          padx: 0,
                          pady: 0,
                          shapeColor: kPrimaryBlueColor,
                          text: "Propose Outing",
                          sizeH: 120.0,
                          textColor: kPrimaryBlueColor,
                          color: kPrimaryBlueColor.withOpacity(0.2),
                          press: () {
                            Navigator.pushNamed(context, '/newOuting');
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      child: TextField(
                        key: Key('Search'),
                        onSubmitted: (value) {
                          // blocProvider.add(
                          //   bloc.ChangeEvent(search: value),
                          // );
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Search",
                          filled: true,
                          fillColor: kGreyColor,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CommunityDetail()
            ],
          ),
        ),
      ),
    );
  }
}
