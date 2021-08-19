import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/size_config.dart';
class PersonalInfo extends StatelessWidget {
  PersonalInfo({required this.name, required this.email, required this.image});
  final String name, email, image;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defaultSize * 24,
      child: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              height: defaultSize * 15,
              decoration: BoxDecoration(color: kPrimaryColor),
            ),
            clipper: CustomShape(),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: defaultSize *1.3, bottom: defaultSize ),
                  height: defaultSize * 14,
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * .8,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: defaultSize * 2.2,
                      color: kPrimaryColor.withOpacity(.7),
                      fontWeight: FontWeight.bold),
                  textScaleFactor: defaultSize * .0975,
                  maxLines: 2,
                ),
                SizedBox(
                  height: defaultSize * .5,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                  maxLines: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 110);
    path.quadraticBezierTo(width / 2, height+SizeConfig.defaultSize*3, width, height - 110);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
