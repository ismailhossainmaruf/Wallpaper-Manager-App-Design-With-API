
import 'package:flutter/material.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/model/modellist.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key,this.artworkodel}) : super(key: key);
  Artworkodel ?artworkodel;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Artworkodel>artworkList = [];
  Artworkodel ?artworkodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A5688),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        title: Text("${widget.artworkodel!.author}",
          style: TextStyle(
              color:Colors.orangeAccent
          ),),
        actions: [
          TextButton(
            onPressed: (){},
            child: Text("Share",
              style: TextStyle(
                  color: Colors.orangeAccent
              ),),
          ),
        ],
      ),
      body: Container(
        // margin: EdgeInsets.all(2.0),
        child: Stack(
          children: [
            Image.network("${widget.artworkodel!.downloadUrl!}",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,),
            Positioned(
              bottom: 20,
              right: 10,
              left: 10,
              child: MaterialButton(onPressed: (){
                setState(() {
                });
              }, child: Text("Set Wallpaper",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
                color: Colors.white38,
              ),
            )
          ],
        ),
      ),
    );
  }

}