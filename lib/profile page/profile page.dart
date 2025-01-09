import 'package:event_planing/authentication/Authentication.dart';
import 'package:event_planing/profile%20page/drop%20dowm%20them%20bottom%20sheet.dart';
import 'package:event_planing/profile%20page/drop%20down%20sheet%20bottom.dart';
import 'package:event_planing/provider/UserProvider.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';



class profilePage extends StatefulWidget {
  static String routeName="profilePage";

  @override
  State<profilePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    var datalistprovider = Provider.of<DataListProvider>(context);

    var languageProvider  =Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    var userProvide = Provider.of<UserProvider>(context);


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(

     appBar:AppBar(toolbarHeight: height*0.18,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65))),
       leading: Container( margin: EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.04),
         child: Row(children: [Image.asset(Assets.route),
           SizedBox(width: width*0.02),
           Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [Text(userProvide.currentuser!.name,style: AppFontStyles.white20Bold,),Text(userProvide.currentuser!.email,style: AppFontStyles.White14medium)],
           )
         
         ],),
       )

     ),


      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.01),
          child: Text(AppLocalizations.of(context)!.language,style:themeProvider.MyAppTheme==ThemeMode.light? AppFontStyles.balck20Bold:AppFontStyles.white20Bold),),
        InkWell(onTap:() {
          Dropdownsheet();
        },
          child: Container(padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.02),
            margin: EdgeInsets.symmetric(horizontal: width*0.01,vertical:height*0.01),
            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ languageProvider.MyAppLanguage=='en' ?Text(AppLocalizations.of(context)!.english,style: AppFontStyles.primarylight20Bold):Text(AppLocalizations.of(context)!.arabic,style: AppFontStyles.primarylight20Bold,),


                Icon(Icons.arrow_drop_down,color: AppColors.primaryColorLight,)
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),border:Border.all(color: AppColors.primaryColorLight,width: 2)),

          ),
        ),
          SizedBox(height: 15,),
          Container(margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.01),
            child: Text(AppLocalizations.of(context)!.theme,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck20Bold:AppFontStyles.white20Bold),),
          InkWell(onTap:() {
            themDropdownsheet();
          //  themeProvider.savetheme(MyAppTheme: themeProvider.MyAppTheme);
          },
            child: Container(padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.02),
              margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical:height*0.01),
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ themeProvider.MyAppTheme==ThemeMode.light ?Text(AppLocalizations.of(context)!.light,style: AppFontStyles.primarylight20Bold):Text(AppLocalizations.of(context)!.dark,style: AppFontStyles.primarylight20Bold,),


                  Icon(Icons.arrow_drop_down,color: AppColors.primaryColorLight,)
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),border:Border.all(color: AppColors.primaryColorLight,width: 2)),

            ),
          ),
          Spacer(),
          Container(height: height*0.06,
          margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.04),

            child: ElevatedButton(
               style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),backgroundColor: AppColors.orange),
                onPressed: ()
            { //NAVIGATION

              datalistprovider.filterList=[];
              datalistprovider.changeSelectedIndex(0, userProvide.currentuser!.Id);
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
                child: Row(children: [Image.asset(Assets.logout),
                SizedBox(width: width*0.02,),
                Text(AppLocalizations.of(context)!.logout,style: AppFontStyles.White20Regular,)

                ],)),
          )








      ],),



    );
  }
  void Dropdownsheet() {
    showModalBottomSheet(context: context, builder:(context)=> languagebottomsheet());
  }
  void themDropdownsheet() {
    showModalBottomSheet(context: context, builder:(context)=> ThemeBottomSheet());
  }


}

