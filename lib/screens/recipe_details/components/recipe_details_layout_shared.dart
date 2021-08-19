import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipeapp/components/size_config.dart';

buildTextTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: SizeConfig.defaultSize*3,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize*2.6,
        fontWeight: FontWeight.bold,
        color: opacity ? Colors.grey[400] : Colors.black,
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize*1.6,
        fontWeight: FontWeight.bold,
        color: Colors.grey[500],
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize*1.45,
        color: Colors.grey[600],
      ),
    ),
  );
}

buildRecipeTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize*2,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
    ),
  );
}

buildRecipeSubTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize*1.55,
        color: Colors.grey[400],
      ),

    ),
  );
}

buildCalories(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: SizeConfig.defaultSize*1.6,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
