import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class languagebottomsheet extends StatefulWidget {


  @override
  State<languagebottomsheet> createState() => _languagebottomsheetState();
}

class _languagebottomsheetState extends State<languagebottomsheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(onTap: (){
            languageProvider.changelanguage('en');

          },child: languageProvider.MyAppLanguage=='en'?selectedlanguage(text: AppLocalizations.of(context)!.english):Unselectedlanguage(text: AppLocalizations.of(context)!.english)
          ),
          InkWell(onTap: (){
            languageProvider .changelanguage('ar');

          },child: languageProvider.MyAppLanguage=='ar'?selectedlanguage(text: AppLocalizations.of(context)!.arabic):Unselectedlanguage(text: AppLocalizations.of(context)!.arabic)
          )



          ],),













      );

  }

  Widget selectedlanguage({required String text}){
     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style:AppFontStyles.primarylight16medium ),
        Icon(Icons.check,color:AppColors.primaryColorLight ,)


      ],);

  }
  Widget Unselectedlanguage ({required String text}){
    return  Row(children: [
      Text(text,style:AppFontStyles.balck16medium ,),




    ]
    );
  }
}
