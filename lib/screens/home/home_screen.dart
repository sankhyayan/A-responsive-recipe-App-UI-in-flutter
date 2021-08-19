import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/components/my_bottom_nav_bar.dart';
import 'package:recipeapp/components/size_config.dart';
import 'components/body.dart';
class HomeScreen extends StatelessWidget {
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
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg",),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Image.asset("assets/images/logo.png",color: kPrimaryColor,isAntiAlias: true,filterQuality: FilterQuality.medium,),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        ),
      ],
    );
  }
}

