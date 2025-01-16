// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:cricketodds/widgets/all_team_score_card.dart';
import 'package:cricketodds/widgets/live_score_widget.dart';
import 'package:cricketodds/widgets/odds_trend_chart.dart';
import 'package:cricketodds/widgets/tranding_values_widget.dart';
import 'package:flutter/material.dart';

class CricketOddsHome extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;
  const CricketOddsHome({
    super.key,
    required this.toggleTheme,
    required this.isDarkTheme,
  });

  @override
  _CricketOddsHomeState createState() => _CricketOddsHomeState();
}

class _CricketOddsHomeState extends State<CricketOddsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BBL Live Cricket Odds'),
        actions: [
          IconButton(
              icon:
                  Icon(widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
              onPressed: widget.toggleTheme)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LiveScoreWidget(),
            SizedBox(height: 16),
            TradingValuesWidget(),
            AllTeamScoreCard(),
            SizedBox(height: 16),
            Expanded(child: OddsTrendChart()),
          ],
        ),
      ),
    );
  }
}
