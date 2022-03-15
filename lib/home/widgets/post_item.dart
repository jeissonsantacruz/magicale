import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:magicale/constants.dart';

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;
  final isLoved;
  final String likedBy;
  final String viewCount;
  final String dayAgo;
  const PostItem({
    Key key,
    this.profileImg,
    this.name,
    this.postImg,
    this.isLoved,
    this.likedBy,
    this.viewCount,
    this.dayAgo,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(profileImg),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: kPrimaryLightColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Icon(
                  LineIcons.horizontalEllipsis,
                  color: kPrimaryLightColor,
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(postImg), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "100  ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: "likes ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
                  ]),
                ),
                Row(
                  children: [
                    isLoved
                        ? SvgPicture.asset(
                            "assets/images/loved_icon.svg",
                            width: 27,
                          )
                        : SvgPicture.asset(
                            "assets/images/love_icon.svg",
                            width: 27,
                          ),
                           Text('  Like',style: TextStyle(color: kPrimaryLightColor),),
                    SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      "assets/images/comment_icon.svg",
                      width: 27,
                    ),
                    Text('  Comment',style: TextStyle(color: kPrimaryLightColor),)
                  
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "$name ",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "$caption",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ]))),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "View $viewCount comments",
              style: TextStyle(
                  color: kPrimaryLightColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(profileImg),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Add a comment...",
                        style: TextStyle(
                            color: kPrimaryLightColor.withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "😂",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "😍",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add_circle,
                        color: kPrimaryLightColor.withOpacity(0.5),
                        size: 18,
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "$dayAgo",
              style: TextStyle(
                  color: kPrimaryLightColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
