import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/Pics.dart';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyApp extends StatelessWidget {
  final Future<List<Pic>> pics;
  MyApp({this.pics});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pics"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        color: Colors.grey[400],
        child:FutureBuilder(
          future: getPics(),
          builder: (BuildContext context , AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return PicCard(item:snapshot.data[index]);
                },
                staggeredTileBuilder: (index){
                  return StaggeredTile.count(2, index.isEven ? 2:3);
                },
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              );
            }else if(snapshot.hasError){
              return Text(snapshot.error);
            }
            return Center(
              child: CircularProgressIndicator(
              ),);
          }
        )
      ),
      
    );
  }
}

class PicCard extends StatelessWidget {
  final Pic item;
  final _random = Random();
  int randomInt(int min,int max) => min + _random.nextInt(max-min); 
  PicCard({this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.5)),
                  image: DecorationImage(
                    image: NetworkImage(item.url),
                    fit:BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
              child:Column(children: <Widget>[
                Text('Random Pics ${randomInt(1,21)}',style: TextStyle(fontSize: 16.0),),
                Padding(padding: EdgeInsets.only(top: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset('images/download.jpg',
                      height: 20.0,
                      color: Colors.grey,),
                    )
                  ],),)              
              ],)
            )
          ],
        ),),);
  }
}