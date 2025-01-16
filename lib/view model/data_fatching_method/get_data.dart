import 'package:cricketodds/view%20model/current_match_api_get.dart';
import 'package:get/get.dart';
import 'package:cricketodds/models/api_model.dart';
// import 'package:cricketodds/api/current_match_api_get.dart';

class MatchController extends GetxController {
  var match = Rxn<Datum>(); 

  @override
  void onInit() {
    super.onInit();
    fetchMatchData(); 
  }

  Future<void> fetchMatchData() async {
    final response = await LiveScore().fetchData();
    if (response != null && response.data.isNotEmpty) {
      match.value = response.data[0]; // the first match
    } else {
      Get.log("something went wrong while fetching match data");
    }
  }
}
