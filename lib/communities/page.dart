import 'package:flutter/material.dart';
import 'package:magicale/communities/_sections/community.dart';

import '../constants.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({Key key}) : super(key: key);

  @override
  _CommunitiesPageState createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
        SingleChildScrollView(
          child: Container(
            child: Community(),
          ),
        )
      ],
    );
  }
}
