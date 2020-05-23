import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/Fourth.dart';
import 'package:flutter_project/Screens/SS.dart';
import 'package:flutter_project/Screens/Ts.dart';
import 'package:flutter_project/Screens/api.dart';
import 'package:flutter_project/Screens/data.dart';
import 'package:flutter_project/Screens/earthquake.dart';


class SI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Knowledge App'),
          centerTitle: true,
        ),
        // backgroundColor: Colors.blueGrey,
        body: Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.tealAccent,
                  height: 150,
                  width:150,
                  child: Image.network("https://getawayposts.com/wp-content/uploads/2018/10/Currencyrate_formula_fucntion_salesforce_getawayposts.com_.png"),
                  padding: EdgeInsets.all(20.0),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                      title: Text(
                        'Simple Interest Calculator',
                        style: TextStyle(fontSize: 25.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800 ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.assignment,color: Colors.deepOrange,),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Formula();
                        }));
                      }),
                ),
                Card(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      "Heron's Formula",
                      style: TextStyle(fontSize: 25.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800 ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.featured_play_list,color: Colors.red,),
                    ),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HeronsFormula()));
                    },
                  ),
                ),
                Card(
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(
                      'University Percentage',
                      style: TextStyle(fontSize: 25.0,
                      fontFamily:'Raleway',
                      fontWeight: FontWeight.w800),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.filter_frames,color:Colors.red),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> University()));
                    },
                  ),
                ),
                Card(
                  elevation: 4.0,
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      "Pinterest",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800,
                        fontSize: 25.0),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.find_replace,color: Colors.red,),
                    ),
                   onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                    },
                  ),
                ),
                Card(
                  elevation: 4.0,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      'Data of Earthquake',
                      style: TextStyle(fontSize: 25.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w800),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.subtitles,color:Colors.red),
                    ),
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
