import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home/home_screen.dart';
import 'package:recipeapp/screens/profile/profile_screen.dart';

class NavItem{
  final int id;
  final String icon;
  final Widget destination;
  NavItem({required this.id,required this.icon, required this.destination});

  bool destinationChecker(){
    if(destination!=null){
      return true;
    }
    return false;
  }
}

class NavItems extends ChangeNotifier{
  int selectedIndex = 0;
  void changeNavIndex({required int index}){
    selectedIndex=index;
    notifyListeners();
  }
  List<NavItem>items=[
    NavItem(
      id: 1,
      icon: "assets/icons/home.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: "assets/icons/bookmark_fill.svg", destination: HomeScreen(),
    ),
    NavItem(
      id: 3,
      icon: "assets/icons/camera.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 4,
      icon: "assets/icons/chef_nav.svg",
      destination: HomeScreen(),
    ),
    NavItem(
      id: 5,
      icon: "assets/icons/user.svg",
      destination: ProfileScreen(),
    ),
  ];
}