import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/model%20class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataListProvider extends ChangeNotifier {
  List<Event> loadEventList = [];
  List<String> eventnamelist = [
    "all",
    "Birthday",
    "Meeting",
    "Holiday",
    "BookClub",
    "Sport",
    "Exhibition",
    "Workshop",
    "Eating",
    "Gaming"
  ];

  int SelectedIndex = 0;
  List<Event> filterList = [];
  List <Event> favoriteList = [];

  void geteventNmaeList(BuildContext context) {
    eventnamelist = [
      'All',
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.gaming,
    ];
  }

  void getAllEvents(String uid) async {
    QuerySnapshot<Event> querySnapshot =
    await FireBaseUtilies.createCollection(uid).get();
    loadEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = loadEventList;
    filterList.sort(
            (Event event1, Event event2) =>
            event1.Date!.compareTo(event2.Date!));
    notifyListeners();
  }

  void getfilterEvents(String uid) async {
    QuerySnapshot<Event> querySnapshot =
    await FireBaseUtilies.createCollection(uid).orderBy("Date").get();
    loadEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = loadEventList.where((event) {
      return event.EventName == eventnamelist[SelectedIndex];
    }).toList();

    notifyListeners();
  }

  void changeSelectedIndex(int newindex, String uid) {
    SelectedIndex = newindex;
    if (SelectedIndex == 0) {
      getAllEvents(uid);
    } else {
      getfilterEvents(uid);
    }
  }

  void updateFavorite(Event event, String uid) {
    FireBaseUtilies.createCollection(uid)
        .doc(event.id)
        .update({"IsFavorite": !event.IsFavorite!}).timeout(
        Duration(milliseconds: 200), onTimeout: () {
      print("event updated successfully");
      SelectedIndex == 0 ? getAllEvents(uid) : getfilterEvents(uid);
      getfilterFavoritelist(uid);
      notifyListeners();
    });
  }


  void getfilterFavoritelist(String uid) async {
    QuerySnapshot<Event> querySnapshot = await FireBaseUtilies.createCollection(
        uid).orderBy("Date").get();
    loadEventList = querySnapshot.docs.map((doc) => doc.data()).toList();
    favoriteList = loadEventList.where((event) {
      return event.IsFavorite == true;
    }).toList();
    notifyListeners();
  }

  void uppdateEvent(Event event, String uid) {
     FireBaseUtilies.createCollection(uid).doc(event.id).update(
        event.toFireStore(event)).timeout(
         Duration(milliseconds: 200), onTimeout: () {
       print("event updated successfullyu");
       SelectedIndex == 0 ? getAllEvents(uid) : getfilterEvents(uid);
       notifyListeners();
     });
  }
  void deleteEvent(Event event , String uid){
    FireBaseUtilies.createCollection(uid).doc(event.id).delete().timeout(
        Duration(milliseconds: 200), onTimeout: () {
      print("event deleted successfully");
      SelectedIndex == 0 ? getAllEvents(uid) : getfilterEvents(uid);
      notifyListeners();
    });
  }

}

