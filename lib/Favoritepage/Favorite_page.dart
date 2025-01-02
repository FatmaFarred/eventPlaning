import 'package:event_planing/HomePage/Events%20widget.dart';
import 'package:event_planing/HomePage/events%20model.dart';
import 'package:event_planing/HomeScreen/custome_textfield.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var size =   MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    var datalistprovider = Provider.of<DataListProvider>(context);
    datalistprovider.getfilterFavoritelist();


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

    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height:height *0.07 ,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:width *0.04 , vertical:height*0.01 ),
            child: CustomeTextfield(color:AppColors.primaryColorLight,hintStyle: AppFontStyles.primarylight16medium,
              hintText:AppLocalizations.of(context)!.searchForEvent ,prefixIcon: Icon(Icons.search,size: size.width*0.08,),),
          ),
          Expanded(child:datalistprovider.favoriteList.isEmpty?Center(child: Text("No favorite yet",style: AppFontStyles.primarylight24medium,)):
          ListView.builder(itemCount: datalistprovider.favoriteList.length,
              padding: EdgeInsets.only(top: height*0.01),
              itemBuilder: (context,index) {
                return EventWidget(event: datalistprovider.favoriteList[index], isSelected: true,);
              }
          ))


        ],
      ),

















    );
  }
}
