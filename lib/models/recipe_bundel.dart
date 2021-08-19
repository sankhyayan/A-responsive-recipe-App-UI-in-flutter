import 'package:flutter/material.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/screens/recipe_details/explore.dart';
class RecipeBundle {
  late final int id, chefs, recipes;
  late  String title, description, imageSrc;
  final Color color;
  final Widget destination;

  RecipeBundle(
      {required this.id,
        required this.chefs,
        required this.recipes,
        required this.title,
        required this.description,
        required this.imageSrc,
        required this.color,required this.destination});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Gourmet",
    description: "For your Discerning Palette ",
    imageSrc: "assets/images/gourmet.png",
    color: Color(0xFFD82D40),
    destination:Explore(color: Color(0xFFD82D40),),
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Best of the Best",
    description: "For those Special Occasions",
    imageSrc: "assets/images/sushi.png",
    color: kPrimaryColor,
    destination:Explore(color: kPrimaryColor,),
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Food on the GO",
    description: "For those morning Meetings and evening Slack Offs",
    imageSrc: "assets/images/foodonthego.png",
    color: Color(0xFF2DBBD8),
    destination:Explore(color: Color(0xFF2DBBD8),),
  ),
];