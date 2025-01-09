import 'package:event_planing/Firebase%20utilies/model%20class.dart';
import 'package:event_planing/HomePage/events%20model.dart';
import 'package:event_planing/HomePage/updateevent.dart';
import 'package:event_planing/provider/UserProvider.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class EventDetails extends StatelessWidget {
  static String RouteName = "EventDetails ";


  @override
  Widget build(BuildContext context) {
    Event event= ModalRoute.of(context)?.settings.arguments as Event;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    var datalistprovider = Provider.of<DataListProvider>(context);
    var userProvide= Provider.of<UserProvider>(context);




    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar:AppBar(
      title: Text(AppLocalizations.of(context)!.eventdetails,style: AppFontStyles.primarylight20medium,),
      centerTitle: true,
      backgroundColor: Colors.transparent,
        actions: [InkWell(onTap: (){
          Navigator.of(context).pushNamed(UpdateEvent.routeName,arguments: event);

        },

            child: Image.asset(Assets.edit)),
        SizedBox(width: 10,),
          InkWell(onTap: (){
            datalistprovider.deleteEvent(event,userProvide.currentuser!.Id );
          },
              child: Image.asset(Assets.delete)),
          SizedBox(width: 10,),
         
        ],

    ) ,
      body:Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
          
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child:Image.asset(event.Image!) ,
              ),
              Text(event.Title!,style: AppFontStyles.primarylight24medium),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.005),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: AppColors.primaryColorLight,
                          width: 2)),
                  child: Row(
                    children: [
                      Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.calendercontainer:Assets.calendercontainerDark),
                      SizedBox(width: 10,),
                       Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Row(children: [
                          Text("${event.Date!.day}",style: AppFontStyles.primarylight16medium,) ,
                           Text(DateFormat.MMMM().format(event.Date!),style: AppFontStyles.primarylight16medium),
                           Text("${event.Date!.year}",style: AppFontStyles.primarylight16medium)
          
                         ],),
                         Text(event.Time!,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck16medium:AppFontStyles.White16medium,)
          
                       ],),
          
                    ],
                  )),
                  SizedBox(height: height*0.02,),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: height * 0.005),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: AppColors.primaryColorLight,
                          width: 2)),
                  child: Row(
                    children: [
                      Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.locationcontainer:Assets.locationcontainerDark),
                      SizedBox(width: 10,),

                      Text("Cairo, Egvpt",
                          style: AppFontStyles.primarylight16medium),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryColorLight,
                      )
                    ],
                  )),
                     SizedBox(height: height*0.02,),
                     Image.asset(Assets.MAP),
                    Text(AppLocalizations.of(context)!.description,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck16medium:AppFontStyles.White16medium,),
                     Text(event.Description!,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck16medium:AppFontStyles.White16medium,)
              
          
          
          
            ],
          ),
        ),
      ) ,
      
    );
  }
}
