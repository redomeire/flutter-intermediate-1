import 'dart:typed_data';

import 'package:belajar_aplikasi_flutter_intermediate/models/result/add_new_story_result.dart';
import 'package:belajar_aplikasi_flutter_intermediate/models/result/detail_story_result.dart';
import 'package:belajar_aplikasi_flutter_intermediate/models/result/get_all_stories_result.dart';
import 'package:belajar_aplikasi_flutter_intermediate/models/result/login_result.dart';
import 'package:belajar_aplikasi_flutter_intermediate/models/result/register_result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client client;

  ApiService({required this.baseUrl, http.Client? client})
    : client = client ?? http.Client();

  Future<RegisterResult> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final requestHeader = {"Content-Type": "application/json"};
    final url = Uri.parse('$baseUrl/register');
    final response = await client.post(
      url,
      body: jsonEncode({"name": name, "email": email, "password": password}),
      headers: requestHeader,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final result = RegisterResult.fromJson(json);
      return result;
    } else {
      throw Exception("Cannot register user");
    }
  }

  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    final requestHeader = {"Content-Type": "application/json"};
    final url = Uri.parse('$baseUrl/login');
    final response = await client.post(
      url,
      body: jsonEncode({"email": email, "password": password}),
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = LoginResult.fromJson(json);
      return result;
    } else {
      throw Exception("Cannot authenticate user");
    }
  }

  Future<AddNewStoryResult> addNewStory({
    required String description,
    String? token,
    required List<int> bytes,
    required String filename,
    double? lat,
    double? lon,
  }) async {
    final endpoint = token != null ? "stories" : "stories/guest";
    final url = Uri.parse('$baseUrl/$endpoint');
    final requestHeader = {"Content-Type": "multipart/form-data"};
    if (token != null) {
      requestHeader.addAll({"Authorization": "Bearer $token"});
    }
    final request = http.MultipartRequest('POST', url);
    final multipartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: filename,
    );
    final Map<String, String> fields = {
      "description": description,
      "lat": lat.toString(),
      "lon": lon.toString(),
    };

    request.files.add(multipartFile);
    request.fields.addAll(fields);
    request.headers.addAll(requestHeader);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      final AddNewStoryResult uploadResponse = AddNewStoryResult.fromJson(
        responseData,
      );
      return uploadResponse;
    } else {
      throw Exception("Upload file error");
    }
  }

  Future<GetAllStoriesResult> getAllStories({
    int? page,
    int? size,
    int? location,
    required String token,
  }) async {
    final requestHeader = {"Authorization": "Bearer $token"};
    final url = Uri.parse(
      "$baseUrl/stories?page=$page&size=$size&location=$location",
    );
    final response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final result = GetAllStoriesResult.fromJson(json);
      return result;
    } else {
      throw Exception("Failed to get stories");
    }
  }

  Future<DetailStoryResult> getStoryDetail(String id, String token) async {
    final requestHeader = {"Authorization": "Bearer $token"};
    final url = Uri.parse("$baseUrl/stories/$id");
    final response = await client.get(url, headers: requestHeader);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      final result = DetailStoryResult.fromJson(json);
      return result;
    } else {
      throw Exception("Failed to get story detail");
    }
  }
}
