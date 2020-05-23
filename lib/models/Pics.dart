import 'dart:convert';
import 'package:http/http.dart' as http;

class Pic{
  String author;
  String url;

  Pic({this.author,this.url});

  toJson(){
    return {
      "author": this.author,
      "url": this.url,
    };
  }

  factory Pic.fromJson(json){
    return Pic(
      author: json['author'],
      url: json['download_url'],
    );
  }
}


Future<List<Pic>> getPics() async{
  final response = await http.get('https://picsum.photos/v2/list');

  if (response.statusCode == 200){
    List<Map<String, dynamic>> responseData = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Pic> pics = responseData.map((picData){
      return Pic.fromJson(picData);
    }).toList();
    print(response.body);
    return pics;  
    }
  else{
    throw Exception('Failed to load pics');
  }
}