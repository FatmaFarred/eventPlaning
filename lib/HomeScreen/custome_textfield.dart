import 'package:event_planing/provider/language_provider.dart';
import 'package:event_planing/provider/theme_provider.dart';
import 'package:event_planing/utilies/app%20colors.dart';
import 'package:event_planing/utilies/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
typedef MyvalidatorFunction = String? Function(String?)?;

class CustomeTextfield extends StatelessWidget {

  TextStyle? style;
  Color? color;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? lablestyle;
  Widget? prefixIcon;
  Widget? sufixIcon;
  Color ? prefixIconColor;
  Color ? sufixIconColor;
  Color ? cursorColor;
  bool ?isobscured;
  int ? maxLines;
 // String?Function (String?)? validatorFunction;
  MyvalidatorFunction validatorFunction;
  TextEditingController? controller;

  CustomeTextfield(

      {this.maxLines,
        this.isobscured,
        this.style,
      this.color,
      required this.hintText,
      this.labelText,
      this.hintStyle,
      this.prefixIcon,
      this.sufixIcon,
      this.lablestyle,
        this.prefixIconColor,
        this.sufixIconColor,
        this.cursorColor,
        this.validatorFunction,
        this.controller
      });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<MyAppLanguageProvider>(context);
    var themeProvider = Provider.of<MyAppThemeProvier>(context);
    return TextFormField(
      controller:controller ,
      validator: validatorFunction,
      obscureText: isobscured ?? false,

      cursorColor: cursorColor ?? (themeProvider.MyAppTheme==ThemeMode.light?AppColors.grey :AppColors.primaryColorLight),
      style: style ?? AppFontStyles.balck16medium,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.red)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color ?? (themeProvider.MyAppTheme==ThemeMode.light?AppColors.grey :AppColors.primaryColorLight)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color ?? (themeProvider.MyAppTheme==ThemeMode.light?AppColors.grey :AppColors.primaryColorLight)),
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? (themeProvider.MyAppTheme==ThemeMode.light?AppFontStyles.grey16medium :AppFontStyles.White16medium ),
        labelStyle: lablestyle,
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        prefixIconColor: prefixIconColor ?? AppColors.grey ,
        suffixIconColor: sufixIconColor ??AppColors.grey ,


      ),
      maxLines: maxLines,
    );
  }
}
