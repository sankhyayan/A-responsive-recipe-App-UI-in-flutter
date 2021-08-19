import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipeapp/components/constants.dart';
import 'package:recipeapp/models/recipe_bundel.dart';
import '../../../components/size_config.dart';

class RecipeBundleCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;
  RecipeBundleCard({required this.recipeBundle, required this.press});
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 0),
              spreadRadius: 1,
              blurRadius: 3,
              color: Colors.grey
            ),
          ],
          borderRadius: BorderRadius.circular(
            defaultSize * 1.8,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                        fontSize: defaultSize * 2.2,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: defaultSize * .7,
                    ),
                    Text(
                      recipeBundle.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(
                      flex: 20,
                    ),
                    buildRowInfo(
                      defaultSize,
                      iconSrc: "assets/icons/chef.svg",
                      text: "${recipeBundle.chefs} chefs",
                    ),
                    SizedBox(
                      height: defaultSize,
                    ),
                    buildRowInfo(
                      defaultSize,
                      iconSrc: "assets/icons/pot.svg",
                      text: "${recipeBundle.recipes} Recipes",
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: defaultSize * .5,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: defaultSize * .08,
                child: Image.asset(
                  recipeBundle.imageSrc,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowInfo(double defaultSize, {String? iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          iconSrc!,
        ),
        SizedBox(
          width: defaultSize * 1.5,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
