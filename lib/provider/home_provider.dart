

import 'package:flutter/cupertino.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/http/custom_http.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/model/modellist.dart';

class HomeProvider with ChangeNotifier{
  List<Artworkodel>artworkList=[];
  gethomePageData()async{
    artworkList = await fetchImagedata();
    notifyListeners();

  }


}