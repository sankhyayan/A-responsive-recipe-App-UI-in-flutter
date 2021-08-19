import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/models/navitem.dart';
import 'screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Recipe App',
        theme: ThemeData(
          // backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 3.0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
