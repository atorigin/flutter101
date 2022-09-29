import 'dart:convert';

import 'package:flutter05/models/album.dart';
import 'package:http/http.dart' as http;

class AlbumDao {
  
  // 定義取 Album modle 物件資料的方法
  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/0"));
    
    if(response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // 當後端資料無法取用時，不要會傳 null，要拋出 Exception，flutter 官網說這非常重要
      throw Exception("Failed to load album");
    }
  }
}