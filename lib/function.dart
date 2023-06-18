//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'requ';
fecthdata(String url) async {
  print("fetching");
  print(url);
  http.Response response = await http.get(Uri.parse(url));
  print(response.body);
  return response.body;
}
