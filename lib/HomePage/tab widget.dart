import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  bool  IsSelected ;
  String tabName;
  Color ? bordercolor;
  Color ? color;
  TextStyle ? textstyle;

  TabWidget({required this.tabName, required this.IsSelected, this.bordercolor,this.color, this.textstyle});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.008),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37),
          border: Border.all(color:bordercolor ?? (themeProvider.MyAppTheme==ThemeMode.light? AppColors.cleanwhite:AppColors.primaryColorDark) ),
        color: color ??(IsSelected?(themeProvider.MyAppTheme==ThemeMode.light ?AppColors.cleanwhite:AppColors.primaryColorLight):Colors.transparent),

      ),
      child: Text(tabName,style:textstyle?? (IsSelected?(themeProvider.MyAppTheme==ThemeMode.light ?AppFontStyles.primarylight16medium:AppFontStyles.White16medium):AppFontStyles.White16medium),),

    );
  }
}