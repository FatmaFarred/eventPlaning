import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/user%20model%20class.dart';
import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomeScreen/CustomAlertDialogue.dart';
import 'package:event_planing/HomeScreen/Elevatedbottom.dart';
import 'package:event_planing/HomeScreen/custome_textfield.dart';
import 'package:event_planing/HomeScreen/homescreen.dart';
import 'package:event_planing/authentication/Loginscreen%20viewmodel.dart';
import 'package:event_planing/authentication/forget%20password.dart';
import 'package:event_planing/authentication/register.dart';
import 'package:event_planing/provider/UserProvider.dart';
import 'package:event_planing/provider/datalistprovider.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'loginnavigator.dart';


class LoginScreen extends StatefulWidget {
static String routeName=" login screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator{

  LoginScreenViewModel loginScreenViewModel=LoginScreenViewModel ();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginScreenViewModel.loginNavigator=this;
  }

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
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Form(key: loginScreenViewModel.formkey,
            child: Column(
              children: [
                SizedBox(height: height * 0.06,),
                Image.asset(Assets.eventlylogo),
                SizedBox(height: height * 0.005,),
                CustomeTextfield(controller: loginScreenViewModel.emailController,
                  validatorFunction: (text) {
                    if (text == null || text.isEmpty) {
                      return "* required please enter the email";
                    }
                    final bool emailValid =
                    RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return "* please enter valid email ";
                    }

                    return null;
                  },

                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Image.asset(
                      themeProvider.MyAppTheme == ThemeMode.light ? Assets
                          .emailicon : Assets.emailicondark),),
                SizedBox(height: height * 0.01,),
                CustomeTextfield(controller: loginScreenViewModel.passwordController,
                  validatorFunction: (text) {
                    if (text == null || text.isEmpty) {
                      return "* required please enter password";
                    }
                    if (text.length < 8) {
                      return "* password should be 8 characters at least";
                    }
                    return null;
                  },

                  hintText: AppLocalizations.of(context)!.password,
                  sufixIcon: Image.asset(
                      themeProvider.MyAppTheme == ThemeMode.light ? Assets
                          .hiddenicon : Assets.hiddenicondark),
                  prefixIcon: Image.asset(
                      themeProvider.MyAppTheme == ThemeMode.light ? Assets
                          .passwordicon : Assets.passwordicondark),),
                SizedBox(height: height * 0.01,),
                Align(alignment: Alignment.centerLeft,
                    child: TextButton(onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          ForgetpasswordPage.routeName);
                    },
                        child: Text(AppLocalizations.of(context)!.forgetPassword,
                          style: AppFontStyles.primarylight16BoldItalic.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColorLight),))),
                CustomeElevatedButtom( onpressed: (){
                  print("Loged in");
                  logedinTap();

                },
                    text: AppLocalizations.of(context)!.login),
                SizedBox(height: height*0.02,),
                SizedBox(height: height * 0.02,),

                Text.rich(TextSpan(
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.dontHaveAccount,
                          style: themeProvider.MyAppTheme == ThemeMode.light
                              ? AppFontStyles.balck16medium
                              : AppFontStyles.White16medium),
                      TextSpan(recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacementNamed(
                              Register.routeName);
                        },
                          text: AppLocalizations.of(context)!.createAccount,
                          style: AppFontStyles.primarylight16BoldItalic.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColorLight)),


                    ])),
                SizedBox(height: height * 0.02,
                ),
                Row(children: [
                  Expanded(child: Divider(height: height * 0.003,
                    indent: width * 0.08,
                    endIndent: width * 0.04,
                    color: AppColors.primaryColorLight,)),
                  Text(AppLocalizations.of(context)!.or),
                  Expanded(child: Divider(height: height * 0.003,
                      indent: width * 0.04,
                      endIndent: width * 0.08,
                      color: AppColors.primaryColorLight)),


                ],),
                SizedBox(height: height * 0.02,),
                CustomeElevatedButtom(
                  onpressed: signInWithGoogle,
                  style: AppFontStyles.primarylight20medium,
                  color: Colors.transparent,
                  IconImage: Image.asset(Assets.google),
                  text: AppLocalizations.of(context)!.loginWithGoogle,),
                SizedBox(height: height * 0.02,),
                Image.asset(Assets.languageswitch)


              ],),
          ),
        ),
      ),

    );
  }

  void logedinTap() async {
    loginScreenViewModel.logedinTap(context);

}

  Future<void> signInWithGoogle() async {
    loginScreenViewModel.signInWithGoogle(context);
  }



  @override
  void hideLoading() {
    Navigator.of(context).pop();
  }

  @override
  void showLoading(String message) {
    CustomAlertDialogue.showLoading(context: context ,message:message );
  }

  @override
  void showMessage(String message) {
    CustomAlertDialogue.showMessage(context: context,message: message);
  }


}
