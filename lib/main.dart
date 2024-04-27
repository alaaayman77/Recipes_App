import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Register/sign_in/sign_in.dart';
import 'package:final_project/Register/sign_up/sign_up.dart';
import 'package:final_project/favorite_page/favorite_page.dart';
import 'package:final_project/home_page/home_page.dart';
import 'package:final_project/introduction_screen/IntroductionScreen.dart';
import 'package:final_project/profile_page/edit.dart';
import 'package:final_project/profile_page/profile_page.dart';
import 'package:final_project/profile_page/profile_screen.dart';
import 'package:final_project/provider/favorite_provider.dart';
import 'package:final_project/recipe_description/recipe_details.dart';
import 'package:final_project/settings_page/settings_page.dart';
import 'package:final_project/splashscreen/splashscreen.dart';
import 'package:final_project/theming.dart';
import 'package:final_project/transition/transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Access data offline
  await FirebaseFirestore.instance.disableNetwork();
  // CACHE_SIZE_UNLIMITED
  FirebaseFirestore.instance.settings =
       Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(ChangeNotifierProvider(
      create: (context)=>FavoriteProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  int selectedIndex = 0;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
       initialRoute: Transition.routeName,
        routes: {
          SplashScreen.routeName:(context) =>SplashScreen(),
          SignIn.routeName: (context) =>  SignIn(),
          SignUp.routeName: (context) =>  SignUp(),
          Transition.routeName: (context) => const Transition(),
          FavoritePage.routeName: (context) =>  FavoritePage(),
          ProfilePage.routeName: (context) => const ProfilePage(),
          HomePage.routeName: (context) => const HomePage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          RecipeDetails.routeName: (context) =>  RecipeDetails(),
          EditProfile.routeName: (context) => EditProfile(),

        },
        theme: Theming.lightTheme,
        // darkTheme: Theming.DarkTheme,
      );
  }
}
