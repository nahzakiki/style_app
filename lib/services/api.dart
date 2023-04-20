import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:style_app/models/clothesModel.dart';

class Api {
  static const BASE_URL = "https://ae18-2001-fb1-1a-1c39-b4b7-8e85-5d33-a7da.ap.ngrok.io";
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
}