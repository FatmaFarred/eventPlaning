import 'package:event_planing/Favoritepage/Favorite_page.dart';
import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomePage/addevent.dart';
import 'package:event_planing/map%20page/MapPage.dart';
import 'package:event_planing/profile%20page/profile%20page.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Homescreen extends StatefulWidget {
  static String routeName= "HOMESCREEN";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedindex = 0;
  List<Widget>pagelist = [Homepage(), Mappage(), FavoritePage(), profilePage()];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomAppBar(
          color: Theme
              .of(context)
              .primaryColor,
          height: height * 0.07,
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {

                });
              },
              items: [
                buildBottomNavigationBarItem(
                    selctedImagePath: Assets.selctedhome,
                    UnselctedImagePath: Assets.home,
                    Text: AppLocalizations.of(context)!.home,
                    index: 0),
                buildBottomNavigationBarItem(
                    UnselctedImagePath: Assets.mapPin,
                    selctedImagePath: Assets.selctedmapPin,
                    index: 1,
                    Text: AppLocalizations.of(context)!.map),
                buildBottomNavigationBarItem(UnselctedImagePath: Assets.heart,
                    selctedImagePath: Assets.selectedheart,
                    index: 2,
                    Text: AppLocalizations.of(context)!.love),
                buildBottomNavigationBarItem(
                    UnselctedImagePath: Assets.profile,
                    selctedImagePath: Assets.selectedprofile,
                    index: 3,
                    Text: AppLocalizations.of(context)!.profile),


              ]
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.of(context).pushNamed(AddeventPage.routeName);
    },
      child: Icon(Icons.add,color: AppColors.cleanwhite,),

    ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked ,
      body: pagelist[selectedindex],
    
    );
  }


        BottomNavigationBarItem buildBottomNavigationBarItem ({ required String UnselctedImagePath,required String selctedImagePath, required String Text,required int index})
    {
      return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            selectedindex == index ? selctedImagePath : UnselctedImagePath)),
        label: Text,);
    }
   
  }







