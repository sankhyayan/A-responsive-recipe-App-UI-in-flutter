import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:recipeapp/models/navitem.dart';
import 'size_config.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Consumer<NavItems>(
      builder: (context, navItems, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
        height: SizeConfig.defaultSize * 5.7,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 30,
              color: Color(0xFF4B1A39).withOpacity(.2),
            ),
          ],
          borderRadius: BorderRadius.circular(defaultSize * 2.5),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navItems.items.length,
              (index) => buildIconNavBarItem(
                  icon: navItems.items[index].icon,
                  press: () {
                    navItems.changeNavIndex(index: index);
                    if (navItems.items[index].destinationChecker()) {
                      return navItems.items[index].destination;
                    }
                  },
                  isActive: navItems.selectedIndex == index ? true : false,
                  defaultSize: defaultSize),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildIconNavBarItem(
      {required String icon,
      required Function press,
      required bool isActive,
      required double defaultSize}) {
    return IconButton(
      onPressed: () {
        press();
      },
      icon: SvgPicture.asset(
        icon,
        color: isActive ? kPrimaryColor : Color(0xFFD1D4D4),
        height: defaultSize * 2.2,
      ),
    );
  }
}
