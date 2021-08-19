import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipeapp/components/size_config.dart';
import 'package:recipeapp/models/recipe_details_data.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/screens/recipe_details/components/recipe_details_layout_shared.dart';

class Detail extends StatelessWidget {
  final Recipe recipe;
  final Color color;
  final int index;
  const Detail({required this.recipe,required this.color,required this.index});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultSize * 1.6),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTextTitleVariation1(recipe.title),
                  buildTextSubTitleVariation1(recipe.description),
                ],
              ),
            ),
            SizedBox(height: defaultSize * 1.6),
            Container(
              height: defaultSize * 31,
              padding: EdgeInsets.only(left: defaultSize * 1.6),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buildTextTitleVariation2('Nutrition', false),
                      SizedBox(
                        height: defaultSize * 1.6,
                      ),
                      buildNutrition(
                          recipe.calories, 'Calories', 'Kcal', defaultSize),
                      SizedBox(
                        height: defaultSize * 1.6,
                      ),
                      buildNutrition(recipe.carbo, 'Carbo', 'g', defaultSize),
                      SizedBox(
                        height: defaultSize * 1.6,
                      ),
                      buildNutrition(
                          recipe.protein, 'Protein', 'g', defaultSize),
                    ],
                  ),
                  Positioned(
                    right: defaultSize * -7,
                    child: Hero(
                      tag: 'Hero$index',
                      child: Container(
                        height: defaultSize * 31,
                        width: defaultSize * 31,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(recipe.image),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: defaultSize * 2,
                  left: defaultSize * 1.6,
                  right: defaultSize * 1.6,
                  bottom: defaultSize * 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation2('Ingredients', false),
                  buildTextSubTitleVariation1("2 cups pecans, divided"),
                  buildTextSubTitleVariation1(
                      "1 tablespoon unsalted butter, melted"),
                  buildTextSubTitleVariation1(
                      "1/4 teaspoon kosher salt, plus more"),
                  buildTextSubTitleVariation1(
                      "3 tablespoons fresh lemon juice"),
                  buildTextSubTitleVariation1("2 tablespoons olive oil"),
                  buildTextSubTitleVariation1("1/2 teaspoon honey"),
                  SizedBox(
                    height: defaultSize * 1.6,
                  ),
                  buildTextTitleVariation2('Recipe preparation', false),
                  buildTextSubTitleVariation1("STEP 1"),
                  buildTextSubTitleVariation1(
                      "In a medium bowl, mix all the marinade ingredients with some seasoning. Chop the chicken into bite-sized pieces and toss with the marinade. Cover and chill in the fridge for 1 hr or overnight."),
                  buildTextSubTitleVariation1("STEP 2"),
                  buildTextSubTitleVariation1(
                      "In a large, heavy saucepan, heat the oil. Add the onion, garlic, green chilli, ginger and some seasoning. Fry on a medium heat for 10 mins or until soft."),
                  buildTextSubTitleVariation1("STEP 3"),
                  buildTextSubTitleVariation1(
                      "Add the spices with the tomato purée, cook for a further 2 mins until fragrant, then add the stock and marinated chicken. Cook for 15 mins, then add any remaining marinade left in the bowl. Simmer for 5 mins, then sprinkle with the toasted almonds. Serve with rice, naan bread, chutney, coriander and lime wedges, if you like."),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () {},
        label: Text('Watch Video',style: TextStyle(
          color: Colors.white,
          fontSize: defaultSize*1.6,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: color,
        icon: Icon(
          CupertinoIcons.play_circle_fill,
          color: Colors.white,
          size: defaultSize * 3.2,
        ),
      ),
    );
  }

  Widget buildNutrition(
      int value, String title, String subTitle, double defaultSize) {
    return Container(
      margin: EdgeInsets.only(left: defaultSize * .45),
      height: defaultSize * 6,
      width: defaultSize * 15,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(defaultSize * 5),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Spacer(),
          Container(
            height: defaultSize * 4.4,
            width: defaultSize * 4.4,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: defaultSize * 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: defaultSize * 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: defaultSize * .5,
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: defaultSize * 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
