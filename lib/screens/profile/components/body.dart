import 'package:flutter/material.dart';
import 'package:recipeapp/screens/profile/components/profile_menu.dart';
import 'package:recipeapp/components/size_config.dart';
import 'personal_info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PersonalInfo(
            image: "assets/images/Capture.PNG",
            email: "sankha0076@gmail.com",
            name: "Sankhyayan Chauhduri",
          ),
          SizedBox(
            height: SizeConfig.defaultSize * .34,
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/list.svg",
            title: "Your Recipies",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/chef_color.svg",
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg",
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
