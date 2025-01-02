import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing/Firebase%20utilies/model%20class.dart';

class FireBaseUtilies {      //create collection and name it
  static CollectionReference <Event>createCollection() {
    return FirebaseFirestore.instance
        .collection(Event.CollectionName)
        .withConverter<Event>(    // convert json=>object , object=>json
            fromFirestore: (snapshot, options) => Event.fromfileStore(snapshot.data()),// snapshot is object from document snapshot
            toFirestore: (event,options)=>event.toFireStore(event));
  }

  static Future<void>  Addeventtofirestore (Event event){ // call collecion to add the data
      var collection =createCollection();
     var docRef = collection.doc();// document id the path is empty generate id
    event.id=docRef.id; //auto generate id
    return docRef.set(event);

  }







}
