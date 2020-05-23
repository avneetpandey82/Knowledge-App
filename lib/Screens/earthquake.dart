import 'package:flutter/material.dart';
import 'package:flutter_project/models/earthquakemodel.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EarthQuakes'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchEarthquakes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].place),
                  subtitle: Text('${DateTime.fromMillisecondsSinceEpoch(snapshot.data[index].time)}'),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
