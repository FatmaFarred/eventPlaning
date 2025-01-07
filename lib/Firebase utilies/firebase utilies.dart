import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing/Firebase%20utilies/model%20class.dart';
import 'package:event_planing/Firebase%20utilies/user%20model%20class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FireBaseUtilies {      //create collection and name it
  static CollectionReference <Event>createCollection(String uid) {
    return FireBaseUtilies.createUserCollection().doc(uid)
        .collection(Event.CollectionName)
        .withConverter<Event>(    // convert json=>object , object=>json
            fromFirestore: (snapshot, options) => Event.fromfileStore(snapshot.data()),// snapshot is object from document snapshot
            toFirestore: (event,options)=>event.toFireStore(event));
  }
   static CollectionReference <MyUser>createUserCollection()   {
    return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter<MyUser>(
        fromFirestore: (snapshot,options)=>MyUser.fromFireStore(snapshot.data()),
        toFirestore: (myuser,options)=>myuser.toFireStore());

   }
   static Future<void>   addUser(MyUser myuser){
      return createUserCollection().doc(myuser.Id).set(myuser);

   }

  static Future<void>  Addeventtofirestore (Event event, String uid){ // call collecion to add the data
      var collection =createCollection(uid);
     var docRef = collection.doc();// document id the path is empty generate id
    event.id=docRef.id; //auto generate id
    return docRef.set(event);

  }
     static Future <MyUser?> readUserFromFireStore (String id)async{
       var querySnapshot=await createUserCollection().doc(id).get();
      return querySnapshot.data();

    }









}
