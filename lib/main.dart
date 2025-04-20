import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytry/pages/homepage.dart';
import 'package:mytry/theme/colors.dart';

void main(){
  runApp(const MyTry());
}

class MyTry extends StatelessWidget {
  const MyTry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTry',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.arimoTextTheme(
          ThemeData.dark().textTheme
        )
      ),
      home: Homepage()
    );
  }
}