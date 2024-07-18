// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


getRequest(urls, parameter) async {
  var request = http.Request(
    'GET',
    Uri.parse(urls),
  )..headers.addAll({
      HttpHeaders.contentTypeHeader: "application/json",
    });
    request.body = jsonEncode(parameter);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    return responseData;
}

postRequest(urls, parameter) async {
  final uri =
  Uri.parse(urls);
  final headers = {
    'Content-Type': 'application/json'
  };
  Map<String, dynamic> body = parameter;
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');
  Response response = await post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );
    String responseBody = response.body;
    return responseBody;
}
