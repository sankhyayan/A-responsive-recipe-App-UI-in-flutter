import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_bundel.dart';
import 'package:recipeapp/screens/home/components/recipe_bundle_card.dart';
import 'package:recipeapp/components/size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
              child: GridView.builder(
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: SizeConfig.defaultSize * 1.7,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 1.65,
                ),
                itemBuilder: (context, index) => RecipeBundleCard(
                  recipeBundle: recipeBundles[index],
                  press: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          recipeBundles[index].destination),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
