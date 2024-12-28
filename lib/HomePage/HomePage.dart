import 'package:event_planing/HomePage/Events%20widget.dart';
import 'package:event_planing/HomePage/events%20model.dart';
import 'package:event_planing/HomePage/tab%20widget.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static String routeName=" home page";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {





  @override
  Widget build(BuildContext context) {
    List <String> tabslist=['All',AppLocalizations.of(context)!.sport,AppLocalizations.of(context)!.holiday,AppLocalizations.of(context)!.meeting,AppLocalizations.of(context)!.bookClub,AppLocalizations.of(context)!.workshop,AppLocalizations.of(context)!.exhibition,AppLocalizations.of(context)!.eating,AppLocalizations.of(context)!.gaming,AppLocalizations.of(context)!.birthday];

    int SelectedIndex=0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    List<EventsClass>Eventlist=[EventsClass(Title: "this is birthday", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.birthday:Assets.birthdayDark, Day: "21", Month: "Nov",eventName: AppLocalizations.of(context)!.birthday),
      EventsClass(Title: "this is meeting", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.meeting:Assets.meetingDark, Day: "22", Month: "Nov",eventName:AppLocalizations.of(context)!.meeting),
      EventsClass(Title: "this is holiday", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.holiday:Assets.holidayDark, Day: "25", Month: "Nov",eventName:AppLocalizations.of(context)!.holiday ),
      EventsClass(Title: "this is bookclub", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.bookclub:Assets.bookclubDark, Day: "25", Month: "Nov",eventName: AppLocalizations.of(context)!.bookClub),
      EventsClass(Title: "this is sport", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.sportClub:Assets.sportClubDark, Day: "25", Month: "Nov",eventName:AppLocalizations.of(context)!.sport ),
      EventsClass(Title: "this is exhibition", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.Exibition:Assets.ExibitionDark, Day: "25", Month: "Nov",eventName: AppLocalizations.of(context)!.exhibition),
      EventsClass(Title: "this is workshop", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.workshop:Assets.workshopdark, Day: "25", Month: "Nov",eventName:AppLocalizations.of(context)!.workshop ),
      EventsClass(Title: "this is eating", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.eating:Assets.eatingdark, Day: "25", Month: "Nov",eventName:AppLocalizations.of(context)!.eating ),
      EventsClass(Title: "this is gaming", ImageName: themeProvider.MyAppTheme==ThemeMode.light?Assets.gaming:Assets.gamingdark, Day: "25", Month: "Nov",eventName: AppLocalizations.of(context)!.gaming ),



    ];


    return Scaffold(
      body: Column(
        children: [
          //column the entire screen
          Container(
            height: height * 0.25,
            padding: EdgeInsets.only(top: height*0.05,left: width*0.04,right:width*0.04 ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                //themeProvider.MyAppTheme==ThemeMode.light?AppColors.primaryColorLight:AppColors.primaryColorDark,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: AppFontStyles.White14Regular,
                        ),
                        Text("User Name", style: AppFontStyles.White24Bold)
                      ],
                    ),
                    Spacer(),
                    Image.asset(Assets.sun),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cleanwhite),
                      child: Text(languageProvider.MyAppLanguage=="en"?"EN":"AR",style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.primarylight14Bold:AppFontStyles.primaryDark14Bold ,),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.009),
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),


                    )
                  ],
                ),
                Row(children: [Image.asset(Assets.mapPin),SizedBox(width: width*0.02,),Text("Cairo ,Egypt",style: AppFontStyles.White14medium,)],),
                DefaultTabController(

                    length: tabslist.length,
                    child: TabBar(isScrollable: true,
                        onTap: (index){

                      setState(() {
                        SelectedIndex=index;
                      });
                        },

                        padding: EdgeInsets.symmetric(vertical: height*0.015 ),
                        indicatorColor: Colors.transparent,dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.symmetric(horizontal: width*0.01),

                        tabs: tabslist.map((tabName){
                      return TabWidget(tabName: tabName, IsSelected: SelectedIndex==tabslist.indexOf(tabName));

                    }).toList()
                )
                ),


    ])
    ),
          Expanded(child: ListView.builder(itemCount: Eventlist.length,
              padding: EdgeInsets.only(top: height*0.01),
              itemBuilder: (context,index) {
                return EventWidget(Title: Eventlist[index].Title, ImageName: Eventlist[index].ImageName, Day: Eventlist[index].Day, Month:
                Eventlist[index].Month,isSelected: true,);
              }
          ))

        ] )
    );
  }
}
