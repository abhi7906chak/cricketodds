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
        title: const Text('BBL Live Cricket Odds'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LiveScoreWidget(),
              const SizedBox(height: 16),
              TradingValuesWidget(),
              AllTeamScoreCard(),
              const SizedBox(height: 16),
              SizedBox(
                height:
                    300, 
                child: OddsTrendChart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
