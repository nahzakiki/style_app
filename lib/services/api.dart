import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:style_app/models/clothesModel.dart';

class Api {
  static const BASE_URL = "https://b017-2001-fb1-18-86a-a0d9-1649-807f-f5f4.ap.ngrok.io";
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

  Future<dynamic> getClothes(String endpoint, String style, String uid) async{
    var url = Uri.parse('$BASE_URL/$endpoint?style=$style');
    final response = await http.get(url,headers: {'Content-Type': 'application/json', "x-uid": uid});

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

  Future<Map<String, dynamic>> updateUserInfo(String endpoint, String bd, String gender, String uid) async{
    var url = Uri.parse('$BASE_URL/$endpoint');
    var body = {"birth_date": bd, "gender": gender, "user_id": uid, "term_of_use": true};

    final response = await http.put(
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

  Future<Map<String, dynamic>> EditUserInfo(String endpoint, String status, String name, String gender, String uid) async{
    var url = Uri.parse('$BASE_URL/$endpoint');
    var body = {"status_msg": status, "display_name":name ,"gender": gender, "user_id": uid};

    final response = await http.put(
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

  Future<String> imageSearchForNew(
  String endpoint, String top1, String top2, String top3,
  String low1, String low2, String low3,
      String shoe1, String shoe2, String shoe3, String uid) async{
    var request = http.MultipartRequest('POST', Uri.parse('${BASE_URL}/${endpoint}'));
    request.headers['x-uid'] = uid;

    var response = await http.get(Uri.parse(top1));
    var imageBytes = response.bodyBytes;
    var imageStream = http.ByteStream.fromBytes(imageBytes);
    var imageLength = imageBytes.length;
    var imageMultipartFile = http.MultipartFile.fromBytes(
      'top1',
      imageBytes,
      filename: 'top1.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(top2));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'top2',
      imageBytes,
      filename: 'top2.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(top3));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'top3',
      imageBytes,
      filename: 'top3.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(low1));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'low1',
      imageBytes,
      filename: 'low1.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(low2));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'low2',
      imageBytes,
      filename: 'low2.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(low3));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'low3',
      imageBytes,
      filename: 'low3.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(shoe1));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'shoe1',
      imageBytes,
      filename: 'shoe1.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(shoe2));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'shoe2',
      imageBytes,
      filename: 'shoe2.jpg',
    );

    request.files.add(imageMultipartFile);

    response = await http.get(Uri.parse(shoe3));
    imageBytes = response.bodyBytes;
    imageLength = imageBytes.length;
    imageMultipartFile = http.MultipartFile.fromBytes(
      'shoe3',
      imageBytes,
      filename: 'shoe3.jpg',
    );

    request.files.add(imageMultipartFile);

    try {
      print("aaa");
      // Send the request and await for the response
      var responses = await request.send();
      if (responses.statusCode == 200) {
        final String responseString = await responses.stream.bytesToString();
        print(responseString);
        return  responseString;
      } else {
        throw Exception('Server connection failed!'); // Use proper exception handling
      }
    } catch (e) {
      print('Error: $e'); // Print error for debugging
      throw Exception('Failed to upload image: $e'); // Provide meaningful error message
    }
  }
}