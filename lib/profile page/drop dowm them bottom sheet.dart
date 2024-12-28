import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ThemeBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyAppThemeProvier>(context);


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(onTap: (){
            themeProvider.changeAppTheme(ThemeMode.light);


          },child: themeProvider.MyAppTheme==ThemeMode.light?selectedtheme(theme: AppLocalizations.of(context)!.light):Unselectedtheme(theme:  AppLocalizations.of(context)!.light)
          ),
          InkWell(onTap: (){
            themeProvider.changeAppTheme(ThemeMode.dark);


          },child:themeProvider.MyAppTheme==ThemeMode.dark?selectedtheme(theme: AppLocalizations.of(context)!.dark):Unselectedtheme(theme:  AppLocalizations.of(context)!.dark)
          )



        ],),













    );

  }

  Widget selectedtheme({required String theme}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme,style:AppFontStyles.primarylight16medium ),
        Icon(Icons.check,color:AppColors.primaryColorLight ,)


      ],);

  }
  Widget Unselectedtheme({required String theme}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme,style:AppFontStyles.balck16medium),



      ],);

  }



  }




