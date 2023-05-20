import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:style_app/models/clothesModel.dart';

class Api {
  static const BASE_URL = "https://ca62-2001-fb1-18-a82f-79eb-a766-fa5-798b.ap.ngrok.io";
  Future<dynamic> submit(String endpoint, XFile image) async{
    File imageFile = File(image.path);
    print(image.path);
    var request = http.MultipartRequest('POST', Uri.parse('${BASE_URL}/${endpoint}'));

    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();
    var imageMultipartFile = http.MultipartFile('outfit', imageStream, imageLength, filename: 'outfit.jpg'); // Update field name and file name
    request.files.add(imageMultipartFile);

    try {
      // Send the request and await for the response
      var response = await request.send();
      if (response.statusCode == 200) {
        final String responseString = await response.stream.bytesToString();
        return  responseString;
      } else {
        throw Exception('Server connection failed!'); // Use proper exception handling
      }
    } catch (e) {
      print('Error: $e'); // Print error for debugging
      throw Exception('Failed to upload image: $e'); // Provide meaningful error message
    }
  }

  Future<dynamic> getClothes(String endpoint, String style) async{
    var url = Uri.parse('$BASE_URL/$endpoint?style=$style');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // แปลง text ที่มีรูปแบบเป็น JSON ไปเป็น Dart's data structure (List/Map)
      List<ClothesModel> clothes = [];
      List<dynamic> jsonBody = json.decode(response.body);
      for (dynamic json in jsonBody) {
        ClothesModel c = ClothesModel.fromJson(json);
        clothes.add(c);
      }
      print('RESPONSE BODY: $jsonBody');

      return clothes;

    } else {
      throw 'Server connection failed!';
    }
  }

  Future<Map<String, dynamic>> lineLogin(String endpoint, String dis, String statusMsg, String profileUrl, String userID) async{
    var url = Uri.parse('$BASE_URL/$endpoint');
    var body = {"display_name": dis, "status_msg": statusMsg, "profile": profileUrl, "user_id": userID};

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      print('RESPONSE BODY: $jsonBody');

      return jsonBody;

    } else {
      throw 'Server connection failed!';
    }
  }
}