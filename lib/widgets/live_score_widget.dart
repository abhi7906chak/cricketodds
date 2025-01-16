import 'package:cricketodds/models/api_model.dart';
import 'package:cricketodds/view%20model/data_fatching_method/get_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class LiveScoreWidget extends StatefulWidget {
  const LiveScoreWidget({super.key});

  @override
  State<LiveScoreWidget> createState() => LiveScoreWidgetState();
}

class LiveScoreWidgetState extends State<LiveScoreWidget> {
  // List<Map<String, dynamic>>? data;
  Model? model;
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

      final match = matchController.match.value!;
    
      final status = match.status;
      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                match.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                  'Score: ${match.score[0].r}/${match.score[0].w} (${match.score[0].o} overs)',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Key Event: $status', style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      );
    });
  }
}
