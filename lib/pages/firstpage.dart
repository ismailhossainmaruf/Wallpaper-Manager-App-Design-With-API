import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_manager_app_deisgn_with_api/model/modellist.dart';
import 'package:wallpaper_manager_app_deisgn_with_api/pages/pagetwo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: (Text("My Artwork",
            style: TextStyle(
                color:Colors.black
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
          leading: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){}, icon: Icon(
                Icons.filter_alt_outlined,color: Colors.orangeAccent,

              ),
              ),
              IconButton(onPressed: (){}, icon: Icon(
                Icons.search,color: Colors.orangeAccent,
              ),
              ),
            ],
          )

      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onTap: (){},
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "search"
                  ),

                ),
              ),
              // CircularProgressIndicator(
              //   color: Colors.blue,
              //   backgroundColor: Colors.white38,
              // ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: artworkList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                SecondPage(
                                  artworkodel: artworkList[index],
                                )));
                          });
                        },
                        child:
                        Container(
                          height: 100,
                          width: 90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("${artworkList[index].downloadUrl}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ]
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
}