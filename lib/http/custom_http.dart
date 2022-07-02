import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_manager_app_deisgn_with_api/model/modellist.dart';


fetchImagedata()async{
  List<Artworkodel>artworkList=[];
  Artworkodel ?artworkodel;
  var responce= await http.get(Uri.parse("https://picsum.photos/v2/list?fbclid=IwAR39xrkB7nWqHd1nIyRqvsBIDhuR-FbSWvF7DVaz5FSUJPJPHz06FLmAPbs"));
  print("status code=${responce.statusCode}");
  if (responce.statusCode==200){
    var  item= jsonDecode(responce.body);
    print("data status =${responce.body}");
    for (var data in item){
      artworkodel=Artworkodel.fromJson(data);

      artworkList.add(artworkodel);
    }
  }
  return artworkList;
}