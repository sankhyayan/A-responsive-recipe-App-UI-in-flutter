import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/components/my_bottom_nav_bar.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/screens/profile/components/body.dart';
import 'package:recipeapp/components/size_config.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Image.asset(
        "assets/images/logo.png",
        color: Colors.white,
        matchTextDirection: true,
        scale: SizeConfig.defaultSize * .11,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            "EDIT",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 1.6,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
