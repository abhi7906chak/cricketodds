import 'package:cricketodds/view%20model/data_fatching_method/get_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradingValuesWidget extends StatelessWidget {
  const TradingValuesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();
    return Obx(() {
      if (matchController.match.value == null) {
        return const Center(child: CircularProgressIndicator());
      }

      final match = matchController.match.value!;
      int teamARuns = match.score[0].r; 
      int teamBRuns = match.score[1].r; 
      String teamAWins = teamARuns > teamBRuns ? '2.85x' : '1.10x';
      String teamBWins = teamBRuns > teamARuns ? '2.10x' : '1.85x';
      String totalRuns = (teamARuns + teamBRuns).toString();

      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trading Values',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Team A Wins: $teamAWins'),
                  Text('Team B Wins: $teamBWins'),
                ],
              ),
              SizedBox(height: 8),
              Text('Total Runs: $totalRuns (2.5x)'),
            ],
          ),
        ),
      );
    });
  }
}
