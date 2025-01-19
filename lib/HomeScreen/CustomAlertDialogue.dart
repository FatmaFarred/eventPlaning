import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogue{

static void showLoading({ required BuildContext context, String ?message}){
   showDialog(context: context, builder: (context){
     return AlertDialog(
       backgroundColor: AppColors.primaryColorLight,
       content: Row(children: [CircularProgressIndicator(),SizedBox(width:5 ,),Text(message??"",style: AppFontStyles.White16medium,)],),);



   });


}

static void hideLoading ({ required BuildContext context}){
  Navigator.of(context).pop();
}
static void showMessage ({required BuildContext context, String Title='', required String message,
Function ?positiveAction,Function ?NigativeAction,String ? positiveActionName,String ?NigativeActionName
}){
  List<Widget>actionsList=[];
  if (positiveActionName!=null){
    actionsList.add(TextButton(onPressed: (){
      positiveAction?.call();
    }, child: Text(positiveActionName)));
    if (NigativeActionName!=null){
      actionsList.add(TextButton(onPressed: (){
        NigativeAction?.call();
      }, child: Text(NigativeActionName)));
    }
  }
  showDialog(context: context, builder: (context){

    return AlertDialog(

      title: Text(Title),
      content:Text(message)  ,
      titleTextStyle: AppFontStyles.White20medium,
      contentTextStyle:AppFontStyles.White16medium ,

      actions:actionsList,
      backgroundColor: AppColors.primaryColorLight,



    );

  });
}


}