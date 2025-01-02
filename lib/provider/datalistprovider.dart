import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/model%20class.dart';
import 'package:flutter/cupertino.dart';

class DataListProvider extends ChangeNotifier {
  List<Event>loadEventList = [];
  List <String> eventnamelist = [
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
  List<Event>filterList = [];


  void getAllEvents() async {
    QuerySnapshot<Event>querySnapshot = await FireBaseUtilies.createCollection()
        .get();
    loadEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = loadEventList;
    filterList.sort((Event event1 , Event event2)=>event1.Date!.compareTo(event2.Date!));
    notifyListeners();
  }

  void getfilterEvents() async {
    QuerySnapshot<Event>querySnapshot = await FireBaseUtilies.createCollection().orderBy("Date")
        .get();
    loadEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = loadEventList.where((event) {
      return event.EventName == eventnamelist[SelectedIndex];
    }).toList();

    notifyListeners();
  }

  void changeSelectedIndex(int newindex) {
    SelectedIndex = newindex;
    if (SelectedIndex == 0) {
      getAllEvents();
    } else {
      getfilterEvents();
    }
  }
}