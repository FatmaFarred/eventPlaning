import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomeElevatedButtom extends StatelessWidget {

 Color? color;
 String text;
 Widget? IconImage;
 TextStyle? style;
 Function ? onpressed;
 CustomeElevatedButtom ({this.color, required this.text, this.IconImage, this.style, this.onpressed});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return  ElevatedButton(

        style: ElevatedButton.styleFrom(elevation: 0,
            padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
            shape: RoundedRectangleBorder(side: BorderSide(color:AppColors.primaryColorLight ),
                borderRadius: BorderRadius.circular(16)),backgroundColor:color ?? AppColors.primaryColorLight),
        onPressed: () { //NAVIGATION
          if (onpressed != null) {
            onpressed!();
          };

        },
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          IconImage ??SizedBox(),
          SizedBox(width: width*0.01,),
          Text(text,style:style ??AppFontStyles.White20medium ,)

        ],)
    );
  }
}
