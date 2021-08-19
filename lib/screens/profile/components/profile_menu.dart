import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/constants.dart';
import '../../../components/size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconSrc, title;
  final Function press;
  const ProfileMenuItem(
      {required this.iconSrc, required this.title, required this.press});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: () {
        press();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultSize * 2,
          vertical: defaultSize * 3,
        ),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc,),
              SizedBox(
                width: defaultSize * 2.5,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1.6,
                  color: kTextLightColor,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: defaultSize * 1.6,
                color: kTextLightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}