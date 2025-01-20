import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/user%20model%20class.dart';
import 'package:event_planing/HomeScreen/homescreen.dart';
import 'package:event_planing/authentication/loginnavigator.dart';
import 'package:event_planing/provider/UserProvider.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreenViewModel extends ChangeNotifier{
  var formkey=GlobalKey<FormState>();
  var  emailController = TextEditingController(text: "FatmaFarred11@gmail.com");
  var passwordController = TextEditingController(text: "12345678");
  late LoginNavigator loginNavigator;

  // todo: hold data  handle logic
  void logedinTap(BuildContext context) async{
    if (formkey.currentState?.validate() == true) {
      loginNavigator.showLoading("Loading.....");

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        var myuser= await FireBaseUtilies.readUserFromFireStore(credential.user?.uid??"");
      if (myuser==null){
        return;
      }
      var datalistprovider = Provider.of<DataListProvider>(context,listen: false);

      var userProvide= Provider.of<UserProvider>(context,listen: false);
      userProvide.changeUser(myuser);
        loginNavigator.hideLoading();
        loginNavigator.showMessage( "Login successfully ");
      datalistprovider.getAllEvents(userProvide.currentuser!.Id);
      Navigator.of(context).pushReplacementNamed(Homescreen.routeName);
        print("register successfully ");
        print(credential.user?.uid ?? "");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        } else if (e.code == 'invalid-credential') {
          loginNavigator.hideLoading();
          loginNavigator.showMessage('The supplied auth credential is incorrect,malformed or has expired');

          print(
              'The supplied auth credential is incorrect,malformed or has expired');
        }
        else if (e.code == 'network-request-failed') {
          loginNavigator.hideLoading();
          loginNavigator.showMessage("A network error (such as timeout, interrupted connection or unreachable host) has occurred.");

          print('The account already exists for that email.');
        }
      } catch (e) {
        loginNavigator.hideLoading();
        loginNavigator.showMessage(e.toString());

        print(e);
      }
    }


  }
  Future<void> signInWithGoogle(BuildContext context) async {
    loginNavigator.showLoading( "Loading...");

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // If Google sign-in is canceled
        loginNavigator.hideLoading();
        loginNavigator.showMessage("Google Sign-In was canceled.");
        return;
      }

      // Obtain the authentication details from the Google sign-in
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential using the access and ID token
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase using the created credentials
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      String? uid = userCredential.user?.uid;
      print("Signed in UID: $uid");
      MyUser? myUser = MyUser(Id: uid ?? "", name: userCredential.user?.displayName ?? "", email: userCredential.user?.email??"");

      if (userCredential.additionalUserInfo!.isNewUser){
        await FireBaseUtilies.addUser(myUser);

      }
      // Check the user credential and UID



      // Now fetch the user from Firestore using the UID
      myUser = await FireBaseUtilies.readUserFromFireStore(uid ?? "");

      // Debugging: Check if the user exists in Firestore
      if (myUser == null) {
        print("User not found in Firestore, creating a new one...");

      }

      // Check if the user is null even after creating
      if (myUser == null) {
        loginNavigator.hideLoading();
        loginNavigator.showMessage("Failed to fetch or create user.");
        return;
      }

      // Update the user provider with the user data
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.changeUser(myUser);

      // Fetch data and navigate to the homescreen
      var dataListProvider = Provider.of<DataListProvider>(context, listen: false);
      dataListProvider.getAllEvents(userProvider.currentuser!.Id);

      // Hide the loading indicator and show a success message
      loginNavigator.hideLoading();
      loginNavigator.showMessage("Login successful");

      // Navigate to the homescreen
      Navigator.of(context).pushReplacementNamed(Homescreen.routeName);

    } catch (e) {
      // Handle any errors that occur during sign-in
      loginNavigator.hideLoading();
      loginNavigator.showMessage( e.toString());
      print("Error during Google Sign-In: $e");
      return Future.error(e);
    }





  }
  }
