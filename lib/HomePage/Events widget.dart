import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventWidget  extends StatelessWidget {
  String ImageName ;
  String Title;
  String Day;
  String Month;
  bool isSelected;

 EventWidget ({required this.Title , required this.ImageName, required this.Day , required this.Month, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return  Container(height: height *0.31,

        padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.008),
      margin:EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01) ,
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage(ImageName),fit: BoxFit.fill),
    borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.primaryColorLight,width: 3),


    ),
        child: Column

          (crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(padding:EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.001) ,
           //   margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.005) ,

              decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),

      color: themeProvider.MyAppTheme==ThemeMode.light ?AppColors.cleanwhite:AppColors.primaryColorDark
          ),
            child: Column(children: [Text(Day,style: AppFontStyles.primarylight20Bold,),Text(Month,style: AppFontStyles.primarylight20Bold)],),

          ),

    Container(

    padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.008),
      //margin:EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01) ,
    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(8),
        color: themeProvider.MyAppTheme==ThemeMode.light ?AppColors.cleanwhite:Colors.transparent


    ),
      child: Row(children: [Text(Title,style:themeProvider.MyAppTheme==ThemeMode.light ?AppFontStyles.balck14Bold:AppFontStyles.White14Bold ,),
        Spacer(),
        Image.asset(isSelected?Assets.selectedlike:Assets.like)],),
    )






        ],),
    );

  }
}
