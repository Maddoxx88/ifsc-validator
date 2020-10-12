import 'dart:convert';
import 'package:ifscValidator/model/ifsc.dart';
import 'package:http/http.dart' as http;

Future<IfscFetch> fetchDetails(String ifscCode) async {
  final response = await http.get('https://ifsc.razorpay.com/' + ifscCode);

    if (response.statusCode == 200) {
    return IfscFetch.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load IFSC Details');
  }

}