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


class ForgetpasswordPage extends StatefulWidget {
  static String routeName=" forgrt password";

  @override
  State<ForgetpasswordPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetpasswordPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.forgetPassword,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.primaryDark22Regular:AppFontStyles.primarylight20medium,),centerTitle: true,backgroundColor: Colors.transparent,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
          children: [
            SizedBox(height: height*0.06,),
            Image.asset(Assets.forgrtPassword),
            SizedBox(height: height*0.03 ,),

            CustomeTextfield(hintText:AppLocalizations.of(context)!.email,prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.emailicon:Assets.emailicondark),),
            SizedBox(height: height*0.03,),


            CustomeElevatedButtom(text: AppLocalizations.of(context)!.reset),

















          ],),
      ),












    );
  }


}
