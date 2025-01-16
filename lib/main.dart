// @autor Abhishek Kumar Chak
// Completion data 01/16/2025
// time 2:10pm
// Purpose :- Assignment for linkedin Flutter Developer Post

// import 'package:fl_chart/fl_chart.dart';
import 'package:cricketodds/view%20model/data_fatching_method/get_data.dart';
import 'package:cricketodds/view/cricketodds_Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(CricketOddsApp());
}

class CricketOddsApp extends StatefulWidget {
  const CricketOddsApp({super.key});

  @override
  State<CricketOddsApp> createState() => _CricketOddsAppState();
}

class _CricketOddsAppState extends State<CricketOddsApp> {
  bool isDarkTheme = false;
// this method manage dark theme logic
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }
// getx universal controller to match data 
  final MatchController matchController = Get.put(MatchController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(() {
          Get.put(
              MatchController()); 
        }),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        home: CricketOddsHome(
          isDarkTheme: isDarkTheme,
          toggleTheme: toggleTheme,
        ));
  }
}
