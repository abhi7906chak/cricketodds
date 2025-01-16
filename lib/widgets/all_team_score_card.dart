import 'package:cricketodds/view%20model/data_fatching_method/get_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class AllTeamScoreCard extends StatefulWidget {
  const AllTeamScoreCard({super.key});

  @override
  State<AllTeamScoreCard> createState() => AllTeamScoreCardState();
}

class AllTeamScoreCardState extends State<AllTeamScoreCard> {
  // List<Map<String, dynamic>>? data;
  // Model? model;
  dynamic matchController;
  // Datum? match;
  @override
  void initState() {
    super.initState();
    matchController = Get.find<MatchController>();
  }

  @override
  Widget build(BuildContext context) {
  
    return Obx(() {
      if (matchController.match.value == null) {
        return const Center(child: CircularProgressIndicator());
      }
// holding all current matches data
      final match = matchController.match.value!;

      final venue = match.venue;
      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    match.teams[0],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    match.teams[1],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Score: ${match.score[0].r}/${match.score[0].w} ',
                      style: TextStyle(fontSize: 16)),
                  Text('Score: ${match.score[1].r}/${match.score[1].w} ',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Text('venue: $venue', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      );
    });
  }
}
