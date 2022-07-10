import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:online_course/model.dart';

class Repository{
  final _baseUrl = 'https://62c458cbabea8c085a7361f6.mockapi.io/user';

  Future getData() async{
    try{
      final response = await http.get(Uri.parse(_baseUrl));

      if(response.statusCode == 200){
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    }catch (e) {
      print(e.toString());
    }
  }
}