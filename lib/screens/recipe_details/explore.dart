import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/components/size_config.dart';
import 'package:recipeapp/models/recipe_details_data.dart';
import 'package:recipeapp/screens/recipe_details/components/recipe_details_layout_shared.dart';
import 'package:recipeapp/screens/recipe_details/components/details.dart';

class Explore extends StatefulWidget {
  final Color color;

  Explore({required this.color});
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultSize * 1.6),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTextTitleVariation1('Culinary Assortment'),
                  buildTextSubTitleVariation1(
                      'You Scrutinise the taste, we will mind your Health'),
                  SizedBox(
                    height: defaultSize * 3.2,
                  ),
                  Container(
                    height: defaultSize * 3.5,
                    child: ListView(
                      //Use builder to later build multiple items
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        option(
                          'All Assortments',
                          'assets/icons/allmeal.png',
                          0,
                          defaultSize,
                          widget.color,
                        ),
                        SizedBox(
                          width: defaultSize,
                        ),
                        option(
                          'Vegetarian',
                          'assets/icons/salad.png',
                          1,
                          defaultSize,
                          widget.color,
                        ),
                        SizedBox(
                          width: defaultSize,
                        ),
                        option(
                          'Non-Vegetarian',
                          'assets/icons/nonveg.png',
                          2,
                          defaultSize,
                          widget.color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultSize * 2.4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultSize * 1.6),
              child: Row(
                children: <Widget>[
                  buildTextTitleVariation2('Popular', false),
                  SizedBox(
                    width: defaultSize * .8,
                  ),
                  buildTextTitleVariation2('Food', true),
                ],
              ),
            ),
            Container(//populars
              height: defaultSize * 19,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildPopulars(widget.color),
              ),
            ),
            SizedBox(
              height: defaultSize * 1.15,
            ),
            Container(//recipes
              height: defaultSize * 35,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildRecipes(widget.color),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Option builder
  Widget option(
      String text, String image, int index, double defaultSize, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: defaultSize * 4.2,
        decoration: BoxDecoration(
          color: selectedIndex == index ? color : Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(defaultSize * .8),
          ),
        ),
        padding: EdgeInsets.only(
            left: defaultSize * .8,
            top: defaultSize * .7,
            right: defaultSize * .7,
            bottom: defaultSize * .75),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: defaultSize * 3.2,
              width: defaultSize * 3.2,
              child: Image.asset(
                image,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(
              width: defaultSize * .8,
            ),
            Text(
              text,
              style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: defaultSize * 1.5,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

//Recipe builder
  List<Widget> buildRecipes(Color color) {
    //returning a list of recipe widgets
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i, color));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(recipe: recipe, color: color,index: index,),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.defaultSize * 2),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: SizeConfig.defaultSize * 1.6,
            left: index == 0 ? SizeConfig.defaultSize * 1.6 : 0,
            bottom: SizeConfig.defaultSize * 1.6,
            top: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.all(SizeConfig.defaultSize * 1.6),
        width: SizeConfig.defaultSize * 22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'Hero $index',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize * .8,
            ),
            buildRecipeTitle(recipe.title),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildCalories(recipe.calories.toString() + " Kcal"),
                Icon(
                  Icons.favorite_border,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//Popular recipe builder
  List<Widget> buildPopulars(Color color) {
    //returning a list of recipe widgets
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildPopular(getRecipes()[i], color,i));
    }
    return list;
  }

  Widget buildPopular(Recipe recipe, Color color,int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(recipe: recipe, color: color,index: index,),
          ),
        );
      },
      child: Container(
        width: SizeConfig.defaultSize*35,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize*1.2,top: SizeConfig.defaultSize*.55),
        padding: EdgeInsets.all( SizeConfig.defaultSize*.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.defaultSize * 2),
          ),
          boxShadow: [kBoxShadow],
        ),
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'Hero$index',
              child: Container(
                height: SizeConfig.defaultSize * 16,
                width: SizeConfig.defaultSize * 16,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(recipe.image),
                        fit: BoxFit.fitHeight)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize * 1.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.defaultSize * 2,
                        ),
                        buildRecipeTitle(recipe.title),
                        buildRecipeSubTitle(recipe.description),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildCalories(recipe.calories.toString() + " Kcal"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
