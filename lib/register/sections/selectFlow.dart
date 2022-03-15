part of 'package:magicale/register/page.dart';

class VerifycationFlowPage extends StatelessWidget {
  VerifycationFlowPage({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.1),
              Text(
                "Verify your Account",
                style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "via Phone Number or E-mail",
                style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 30),
              RoundedButton(
                text: "Phone Number",
                color: kPrimaryBlueColor,
                press: () {},
              ),
              RoundedButton(
                text: "Email",
                color: kPrimaryBlueColor,
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
