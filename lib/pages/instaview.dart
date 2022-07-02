import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/model/modellist.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/pages/pagetwo.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({Key? key}) : super(key: key);

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  List<Artworkodel>artworkList=[];
  Artworkodel ?artworkodel;
  bool isLoading=false;

  getData()async{
    setState(() {
      isLoading=true;
    });
    var responce= await http.get(Uri.parse("https://picsum.photos/v2/list?fbclid=IwAR39xrkB7nWqHd1nIyRqvsBIDhuR-FbSWvF7DVaz5FSUJPJPHz06FLmAPbs"));
    print("status code=${responce.statusCode}");
    if (responce.statusCode==200){
      var  item= jsonDecode(responce.body);
      print("data status =${responce.body}");
      for (var data in item){
        artworkodel=Artworkodel.fromJson(data);
        setState(() {
          artworkList.add(artworkodel!);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A5688),
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: (Text("My Artwork",
            style: TextStyle(
                color:Colors.orangeAccent
            ),
          )),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: (){},
              child: Text("Share",
                style: TextStyle(
                    color: Colors.orangeAccent
                ),),
            ),
          ],
          leading: IconButton(onPressed: (){}, icon: Icon(
            Icons.filter_alt_outlined,color: Colors.orangeAccent,
          ),
          )
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onTap: (){},
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    hintText: "search",
                  ),


                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: StaggeredGridView.countBuilder(
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(
                      //1, index.isEven ? 1.4 : 1),
                        (index % 5 == 0) ? 2 : 1, (index % 5 == 0) ? 2 : 1),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: artworkList.length,
                itemBuilder: (context, index) => MyCard(index),
              ),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:Container(
          child: Icon(Icons.add,
            size: 30,),
        ),
      ),
    );
  }
  MyCard(int index)=> InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
          SecondPage(
            artworkodel: artworkList[index],
          )));
    },
    child: Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(artworkList[index].downloadUrl.toString(),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
