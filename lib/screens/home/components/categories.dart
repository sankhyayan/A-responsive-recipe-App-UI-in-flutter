import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["All", "Indian", "Italian", "Mexican", "Chinese"];
  List<bool>selectedCategory=[false,false,false,false,false,];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5,
        child: ListView.builder(
          //creates a list of h scrollable widgets one at a time
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    //1 item at a time builder
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory[index]=!selectedCategory[index];
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2,
          vertical: SizeConfig.defaultSize * 0.5,
        ),
        decoration: BoxDecoration(
          color:
              selectedCategory[index] ? Color(0xFFEFF3EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.6),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedCategory[index] ? kPrimaryColor : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}
