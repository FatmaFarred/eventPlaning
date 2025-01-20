import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/user%20model%20class.dart';
import 'package:event_planing/authentication/registernavigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreenViewModel extends ChangeNotifier{

   late RegisterNavigator registernavigator;
   var formkey=GlobalKey<FormState>();


   void registerTap (String email , String Password,String name)async{
    if (formkey.currentState?.validate()==true) {
      registernavigator.showLoading("Loading.....");
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: Password,
        );
        MyUser myuser = MyUser(
            Id: credential.user?.uid ?? "", name: name, email: email);
        await FireBaseUtilies.addUser(myuser);
        registernavigator.hideLoading();
        registernavigator.showMessage("Register successfully ");
        print("register successfully ");
        print(credential.user?.uid ?? "");
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          registernavigator.hideLoading();
          registernavigator.showMessage("The password provided is too weak");

          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          registernavigator.hideLoading();
          registernavigator.showMessage(
              "The account already exists for that email");

          print('The account already exists for that email.');
        }
        else if (e.code == 'network-request-failed') {
          registernavigator.hideLoading();
          registernavigator.showMessage(
              "A network error (such as timeout, interrupted connection or unreachable host) has occurred.");

          print('The account already exists for that email.');
        }
      }
      catch (e) {
        registernavigator.hideLoading();
        registernavigator.showMessage(e.toString());

        print(e);
      }
    }



  }



  }