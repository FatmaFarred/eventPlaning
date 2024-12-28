import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomePage/events%20model.dart';
import 'package:event_planing/HomePage/tab%20widget.dart';
import 'package:event_planing/HomeScreen/Elevatedbottom.dart';
import 'package:event_planing/HomeScreen/custome_textfield.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddeventPage extends StatefulWidget {
  static String routeName = "Addevent";

  @override
  State<AddeventPage> createState() => _AddeventPageState();
}

class _AddeventPageState extends State<AddeventPage> {
  var enteredtitle = TextEditingController();
  var enteredDescription = TextEditingController();
  String SelectedImage ='';
  String SelectedName = '';

  int selectedindex = 0;
  var formKey = GlobalKey<FormState>();
  var Chosendate;
DateTime ? Selcetdday;
  var formatedday;
  TimeOfDay ? chosentime;
  String erorrDate ='';
  String erorrTime ='';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    List<EventsClass> Eventlist = [
      EventsClass(
          Title: "this is birthday",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.birthday
              : Assets.birthdayDark,
          Day: "21",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.birthday),
      EventsClass(
          Title: "this is meeting",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.meeting
              : Assets.meetingDark,
          Day: "22",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.meeting),
      EventsClass(
          Title: "this is holiday",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.holiday
              : Assets.holidayDark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.holiday),
      EventsClass(
          Title: "this is bookclub",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.bookclub
              : Assets.bookclubDark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.bookClub),
      EventsClass(
          Title: "this is sport",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.sportClub
              : Assets.sportClubDark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.sport),
      EventsClass(
          Title: "this is exhibition",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.Exibition
              : Assets.ExibitionDark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.exhibition),
      EventsClass(
          Title: "this is workshop",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.workshop
              : Assets.workshopdark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.workshop),
      EventsClass(
          Title: "this is eating",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.eating
              : Assets.eatingdark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.eating),
      EventsClass(
          Title: "this is gaming",
          ImageName: themeProvider.MyAppTheme == ThemeMode.light
              ? Assets.gaming
              : Assets.gamingdark,
          Day: "25",
          Month: "Nov",
          eventName: AppLocalizations.of(context)!.gaming),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.createevent,
          style: AppFontStyles.primarylight20medium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(Eventlist[selectedindex].ImageName)),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.01),
                height: height * 0.05,
                child: ListView.builder(
                    itemCount: Eventlist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                            SelectedImage=Eventlist[selectedindex].ImageName;
                            SelectedName=Eventlist[selectedindex].eventName;


                            /// Update selected index
                          });
                        },
                        child: TabWidget(
                            tabName: Eventlist[index].eventName,
                            IsSelected: selectedindex == index,
                            bordercolor: AppColors.primaryColorLight,
                            color: selectedindex == index
                                ? AppColors.primaryColorLight
                                : Colors.transparent,
                            textstyle: selectedindex == index
                                ? AppFontStyles.White16Bold
                                : AppFontStyles.primarylight14Bold
                                    .copyWith(fontSize: 16)),
                      );
                    }),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: themeProvider.MyAppTheme == ThemeMode.light
                            ? AppFontStyles.balck16medium
                            : AppFontStyles.White16medium,
                      ),
                      SizedBox(
                        height: height * 0.003,
                      ),
                      CustomeTextfield(
                          controller: enteredtitle,
                          validatorFunction: (text) {
                            if (text == null || text.isEmpty) {
                              return "* required please enter the title";
                            } else
                              return null;
                          },
                          hintText: "Event Title",
                          prefixIcon: Image.asset(
                              themeProvider.MyAppTheme == ThemeMode.light
                                  ? Assets.notelight
                                  : Assets.notedark)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: themeProvider.MyAppTheme == ThemeMode.light
                            ? AppFontStyles.balck16medium
                            : AppFontStyles.White16medium,
                      ),
                      SizedBox(
                        height: height * 0.003,
                      ),
                      CustomeTextfield(
                        controller: enteredDescription,
                        validatorFunction: (text) {
                          if (text == null || text.isEmpty) {
                            return "* required please enter the description";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Event Description",
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Row(
                        children: [
                          Image.asset(
                              themeProvider.MyAppTheme == ThemeMode.light
                                  ? Assets.calender
                                  : Assets.calenderdark),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            AppLocalizations.of(context)!.eventdate,
                            style: themeProvider.MyAppTheme == ThemeMode.light
                                ? AppFontStyles.balck16medium
                                : AppFontStyles.White16medium,
                          ),
                          Spacer(),
                          Text(erorrDate,style:TextStyle(color: Colors.red),),
                          TextButton(
                              onPressed: onpressedeventdate,
                              child: Text( Chosendate ==null?
                                AppLocalizations.of(context)!.choosedate:
                                  formatedday,
                                //"${Chosendate!.day}/${Chosendate!.month}/${Chosendate!.year}",
                                style: AppFontStyles.primarylight16medium,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                              themeProvider.MyAppTheme == ThemeMode.light
                                  ? Assets.clock
                                  : Assets.clockdark),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            AppLocalizations.of(context)!.eventtime,
                            style: themeProvider.MyAppTheme == ThemeMode.light
                                ? AppFontStyles.balck16medium
                                : AppFontStyles.White16medium,
                          ),


                          Spacer(),
                          Text(erorrTime,style:TextStyle(color: Colors.red),),
                          TextButton(
                              onPressed: chosetimeonpressed,
                              child: Text(chosentime==null?
                                AppLocalizations.of(context)!.choosetime:"${chosentime!.hour}:${chosentime!.minute}",
                                style: AppFontStyles.primarylight16medium,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: themeProvider.MyAppTheme == ThemeMode.light
                            ? AppFontStyles.balck16medium
                            : AppFontStyles.White16medium,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
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
                                Image.asset(Assets.locationcontainer),
                                Text(
                                    AppLocalizations.of(context)!
                                        .chooselocation,
                                    style: AppFontStyles.primarylight16medium),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.primaryColorLight,
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomeElevatedButtom(
                        text: AppLocalizations.of(context)!.addevent,
                        onpressed: addEventOnpressed,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void addEventOnpressed() {
    if (formKey.currentState?.validate() == true) {
      if (formatedday != null && chosentime != null) {
        Navigator.of(context).pushNamed(Homepage.routeName);
      } else {
        formatedday == null ? erorrDate = "*required" : erorrDate = " ";
        chosentime == null ? erorrTime = "*required" : erorrTime = " ";
      }


      setState(() {

      });
    }
  }

  void onpressedeventdate() async{
    Chosendate=await showDatePicker(
      errorInvalidText:"CANT BE NULL" ,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
     Selcetdday=Chosendate;
    formatedday=DateFormat.yMd().format(Selcetdday!);
     setState(() {

     });

  }

  void chosetimeonpressed() async{
     chosentime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),

    );
     setState(() {

     });

  }
}
