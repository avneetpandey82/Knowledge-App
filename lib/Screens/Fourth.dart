import 'package:flutter/material.dart';

class University extends StatefulWidget {
  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  var _formKey = GlobalKey<FormState>();
  var thatresult = "";
  double percentage1,percentage2,percentage3,percentage4,percentage5;
  var padding = Padding(padding: EdgeInsets.all(10.0));

  TextEditingController sem1Controller = TextEditingController();
  TextEditingController sem2Controller = TextEditingController();
  TextEditingController sem3Controller = TextEditingController();
  TextEditingController sem4Controller = TextEditingController();
  TextEditingController sem5Controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return Scaffold(
      resizeToAvoidBottomPadding: false ,
        appBar: AppBar(
          title: Text("University Percentage"),
          centerTitle: true,
        ),
        body:ListView(
          children: <Widget>[
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: 250.0,
                    child: getImage(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: sem1Controller,
                            validator: (String local) {
                              if (local.isEmpty) {
                                return "This Field Can't Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Sem1 Marks",
                                labelStyle: textStyle,
                                icon: Icon(Icons.dehaze,size: 10.0,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      padding,
                    ],
                  ),
                  padding,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: sem2Controller,
                            validator: (String local) {
                              if (local.isEmpty) {
                                return "This Field Can't Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Sem2 marks",
                                labelStyle: textStyle,
                                icon: Icon(Icons.dehaze,size: 10.0,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      padding,
                    ],
                  ),
                  padding,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: sem3Controller,
                            validator: (String local) {
                              if (local.isEmpty) {
                                return "This Field Can't Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Sem3 marks",
                                labelStyle: textStyle,
                                icon: Icon(Icons.dehaze,size: 10.0,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      padding,
                    ],
                  ),
                  padding,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: sem4Controller,
                            validator: (String local) {
                              if (local.isEmpty) {
                                return "This Field Can't Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Sem4 marks",
                                labelStyle: textStyle,
                                icon: Icon(Icons.dehaze,size: 10.0,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      padding,
                    ],
                  ),
                  padding,
                     Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: sem5Controller,
                            validator: (String local) {
                              if (local.isEmpty) {
                                return "This Field Can't Be Empty";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Sem5 Marks",
                                labelStyle: textStyle,
                                icon: Icon(Icons.dehaze,size: 10.0,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                      ),
                      padding,
                    ],
                  ),
                  padding,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      padding,padding,
                       Expanded(
                          child: RaisedButton(
                        color: Colors.deepPurple[200],
                        colorBrightness: Brightness.light,
                        child: Text('Calculate'),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.thatresult = result();
                            }
                          });
                        },
                      )),
                      padding,padding,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      padding,padding,
                      Expanded(child:
                      Text(
                  this.thatresult,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),),
                  ],),
                ],
              ),
            )),
            ],
        ),
        );
  }

  Widget getImage() {
    NetworkImage networkImage = NetworkImage(
        "https://i2.wp.com/www.ululu.in/wp-content/uploads/2017/05/MDU-Date-Sheet.jpg?w=800");
    Image image = Image(
      image: networkImage,
      height: 200.0,
      width: 200.0,
    );
    return Container(child: image);
  }

 double _calculateSem1Result() {
    double sem1 = double.parse(sem1Controller.text);
    double percentage1 = (sem1 / 1100) * 100;
    return percentage1;
  }
  double _calculateSem2Result() {
    double sem2 = double.parse(sem2Controller.text);
    double percentage2 = (sem2/ 1170) * 100;
    return percentage2;
  }
  double _calculateSem3Result() {
    double sem3 = double.parse(sem3Controller.text);
    double percentage3 = (sem3 / 1150) * 100;
    return percentage3;
  }
  double _calculateSem4Result() {
    double sem4 = double.parse(sem4Controller.text);
    double percentage4 = (sem4 / 1150) * 100;
    return percentage4;
  }
   double _calculateSem5Result() {
    double sem5 = double.parse(sem5Controller.text);
    double percentage5 = (sem5 / 1150) * 100;
    return percentage5;
  }

  String result(){
    double percentage= ((_calculateSem1Result()+_calculateSem2Result()+_calculateSem3Result()+_calculateSem4Result()+_calculateSem5Result())/500)*100;
    String percent= "Your percentage is $percentage";
    return percent;
  }
  
}
