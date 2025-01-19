import 'package:flutter/material.dart';

import '../Firebase utilies/user model class.dart';

class UserProvider extends ChangeNotifier{
  MyUser ? currentuser;
  void changeUser (MyUser newUser){
    currentuser=newUser;
    notifyListeners();
  }


}