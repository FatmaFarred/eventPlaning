import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomeScreen/Elevatedbottom.dart';
import 'package:event_planing/HomeScreen/custome_textfield.dart';
import 'package:event_planing/HomeScreen/homescreen.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Register extends StatefulWidget {
static String routeName=" Register screen";

  @override
  State<Register> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.primaryDark22Regular:AppFontStyles.primarylight20medium,),centerTitle: true,backgroundColor: Colors.transparent,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          children: [
            SizedBox(height: height*0.06,),
          Image.asset(Assets.eventlylogo),
          SizedBox(height: height*0.005 ,),
            CustomeTextfield(hintText:AppLocalizations.of(context)!.name,prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.nameicon:Assets.nameicondark),),
            SizedBox(height: height*0.01,),

          CustomeTextfield(hintText:AppLocalizations.of(context)!.email,prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.emailicon:Assets.emailicondark),),
            SizedBox(height: height*0.01,),
            CustomeTextfield(hintText:AppLocalizations.of(context)!.password,sufixIcon:Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.hiddenicon:Assets.hiddenicondark) ,
              prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.passwordicon:Assets.passwordicondark),),

            SizedBox(height: height*0.01,),
            CustomeTextfield(hintText:AppLocalizations.of(context)!.repassword,sufixIcon:Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.hiddenicon:Assets.hiddenicondark) ,
              prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.passwordicon:Assets.passwordicondark),),
            SizedBox(height: height*0.01,),

            CustomeElevatedButtom(text: AppLocalizations.of(context)!.createAccount),
            SizedBox(height: height*0.02,),

            InkWell(onTap: (){
              Navigator.of(context).pushReplacementNamed(Homescreen.routeName);
            },
              child: Text.rich(TextSpan(
                  children: [
                TextSpan(
                    text: AppLocalizations.of(context)!.alreadyHaveAccount,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck16medium:AppFontStyles.White16medium),
                TextSpan(recognizer: TapGestureRecognizer()..onTap=(){
                  Navigator.of(context).pushReplacementNamed(Homescreen.routeName);
                },
                    text: AppLocalizations.of(context)!.login,style: AppFontStyles.primarylight16BoldItalic.copyWith(decoration: TextDecoration.underline,decorationColor: AppColors.primaryColorLight)),



              ])),
            ),
            SizedBox(height: height*0.02,
            ),

            Image.asset(Assets.languageswitch)














          ],),
      ),












    );
  }

  
}
