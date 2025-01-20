import 'package:event_planing/Firebase%20utilies/firebase%20utilies.dart';
import 'package:event_planing/Firebase%20utilies/user%20model%20class.dart';
import 'package:event_planing/HomePage/HomePage.dart';
import 'package:event_planing/HomeScreen/CustomAlertDialogue.dart';
import 'package:event_planing/HomeScreen/Elevatedbottom.dart';
import 'package:event_planing/HomeScreen/custome_textfield.dart';
import 'package:event_planing/HomeScreen/homescreen.dart';
import 'package:event_planing/authentication/Authentication.dart';
import 'package:event_planing/authentication/ReisterScreenViewModel.dart';
import 'package:event_planing/authentication/registernavigator.dart';
import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/assets.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Register extends StatefulWidget {
static String routeName=" Register screen";

  @override
  State<Register> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<Register> implements RegisterNavigator{

    var  emailController = TextEditingController(text: "FatmaFarred11@gmail.com");
    var nameController = TextEditingController(text: "Fatma");
    var passwordController = TextEditingController(text: "12345678");
    var repasswordController  = TextEditingController(text:"12345678" );
    RegisterScreenViewModel registerScreenViewModel =RegisterScreenViewModel ();
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerScreenViewModel.registernavigator=this;
  }
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return ChangeNotifierProvider(create: (context)=>registerScreenViewModel,
      child: Scaffold(resizeToAvoidBottomInset :true,
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.register,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.primaryDark22Regular:AppFontStyles.primarylight20medium,),centerTitle: true,backgroundColor: Colors.transparent,),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: Form(key:registerScreenViewModel. formkey,
              child: Column(
                children: [
                  SizedBox(height: height*0.06,),
                Image.asset(Assets.eventlylogo),
                SizedBox(height: height*0.005 ,),
                  CustomeTextfield(controller:nameController ,
                    validatorFunction: (text){
                    if (text==null || text.trim().isEmpty){
                        return "* required please enter name";
                    }

                    else {
                      return null ;
                    }

                  },
                    hintText:AppLocalizations.of(context)!.name,prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.nameicon:Assets.nameicondark),),
                  SizedBox(height: height*0.01,),

                CustomeTextfield(
                  controller:emailController,
                  validatorFunction: (text){
                  if (text==null || text.isEmpty){
                    return "* required please enter the email";
                  }
                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                   if (!emailValid){
                     return "* please enter valid email ";
                   }

                    return null ;

                },
                  hintText:AppLocalizations.of(context)!.email,prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.emailicon:Assets.emailicondark),),
                  SizedBox(height: height*0.01,),
                  CustomeTextfield(isobscured: true,
                    controller: passwordController,
                    validatorFunction: (text){
                    if (text==null || text.isEmpty){
                      return "* required please enter password";
                    }
                    if (text.length<8){
                      return "* password should be 8 characters at least";
                    }
                      return null ;

                  },
                    hintText:AppLocalizations.of(context)!.password,sufixIcon:Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.hiddenicon:Assets.hiddenicondark) ,
                    prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.passwordicon:Assets.passwordicondark),),

                  SizedBox(height: height*0.01,),
                  CustomeTextfield(controller: repasswordController,
                    validatorFunction: (text){
                    if (text==null || text.isEmpty){
                      return "* required please enter repassword";
                    }
                    if (text!=passwordController.text){
                      return "* repassword doesn't match the password";

                    }
                      return null ;


                  },
                    hintText:AppLocalizations.of(context)!.repassword,sufixIcon:Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.hiddenicon:Assets.hiddenicondark) ,
                    prefixIcon: Image.asset(themeProvider.MyAppTheme==ThemeMode.light?Assets.passwordicon:Assets.passwordicondark),),
                  SizedBox(height: height*0.01,),

                  CustomeElevatedButtom( onpressed: registerTap,
                      text: AppLocalizations.of(context)!.createAccount),
                  SizedBox(height: height*0.02,),

                  InkWell(onTap: (){

                  },
                    child: Text.rich(TextSpan(
                        children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.alreadyHaveAccount,style: themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.balck16medium:AppFontStyles.White16medium),
                      TextSpan(recognizer: TapGestureRecognizer()..onTap=(){
                       Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

                      },
                          text: AppLocalizations.of(context)!.login,style: AppFontStyles.primarylight16BoldItalic.copyWith(decoration: TextDecoration.underline,decorationColor: AppColors.primaryColorLight)),



                    ])),
                  ),
                  SizedBox(height: height*0.02,
                  ),

                  Image.asset(Assets.languageswitch)

                ],),
            ),
          ),
        ),


      ),
    );
  }
  void registerTap ()async{

    registerScreenViewModel.registerTap(emailController.text, passwordController.text, nameController.text);
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


  

