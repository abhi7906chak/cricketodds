import 'package:cricketodds/view%20model/data_fatching_method/get_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OddsTrendChart extends StatelessWidget {
  const OddsTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    final matchController = Get.find<MatchController>();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Odds Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: Obx(() {
                if (matchController.match.value == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final match = matchController.match.value!;

                int teamARuns = match.score[0].r; // Runs scored by Team A
                int teamBRuns = match.score[1].r; // Runs scored by Team B

                List<FlSpot> spots = [
                  FlSpot(0, teamARuns.toDouble()),
                  FlSpot(1, (teamARuns + 5).toDouble()),
                  FlSpot(2, (teamBRuns + 1).toDouble()),
                  FlSpot(3, teamBRuns.toDouble()),
                ];

                return LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        // uncomment color if you want to change the chat color
                        // color: Colors.green,
                        barWidth: 3,
                        dotData: FlDotData(show: true),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
