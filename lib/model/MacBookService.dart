// MacbookService.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smartprices/model/macbook_model.dart';

class MacbookService {
  final String apiUrl =
      "https://kaproject-cfd93-default-rtdb.firebaseio.com/gadget/macbook.json";

  Future<List<MacbookModel>> getMacbooks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<MacbookModel> macbooks = [];

      data.forEach((id, macbookData) {
        macbooks.add(MacbookModel.fromJson(id, macbookData));
      });

      return macbooks;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
