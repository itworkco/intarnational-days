import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api model.dart';

class DaysApi {
  Future<List<Day>> geyDays() async {
    List<Day> days = List<Day>();
    var url =
        'https://cms.gdforce.com/api3/get/international_days_of_the_united_nations/';
    var response = await http.post(
      url,
      body: {"lang": "ar", "loginuid": "9458b0ad-80fb-4c0f-a515-58159c1f51fb"},
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      for (var item in data) {
        Day day = Day(item['nameOfDay'], item['date'], item['details']);
        print(day.date);
      }
    }
    return days;
  }
}
