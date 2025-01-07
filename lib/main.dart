import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomePage/addevent.dart';
import 'package:event_planing/HomeScreen/homescreen.dart';
import 'package:event_planing/authentication/Authentication.dart';
import 'package:event_planing/authentication/forget%20password.dart';
import 'package:event_planing/authentication/register.dart';
import 'package:event_planing/firebase_options.dart';
import 'package:event_planing/profile%20page/profile page.dart';
import 'package:event_planing/provider/UserProvider.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/MyTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();

  runApp(  MultiProvider( providers: [ChangeNotifierProvider(create: (context)=>MyAppThemeProvier()),ChangeNotifierProvider(create: (context)=>MyAppLanguageProvider()),
    ChangeNotifierProvider(create: (context)=>DataListProvider()),
    ChangeNotifierProvider(create: (context)=>UserProvider())


  ],
      child: MyApp()));

}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      var themeProvider = Provider.of<MyAppThemeProvier>(context);
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    
    return MaterialApp(

      initialRoute: LoginScreen.routeName,
     routes:{profilePage.routeName:(context)=>profilePage(),
       Homescreen.routeName:(context)=>Homescreen(),
       LoginScreen.routeName:(context)=>LoginScreen(),
      Homepage.routeName:(context)=>Homepage(),
       Register.routeName:(context)=>Register(),
       ForgetpasswordPage.routeName:(context)=>ForgetpasswordPage(),
       AddeventPage.routeName:(context)=>AddeventPage(),

     } ,
     debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.MyAppLanguage),
      theme:MyAppTheme.lightTheme ,
      darkTheme:MyAppTheme.darkTheme ,
      themeMode:themeProvider.MyAppTheme ,


    );
  }
}

