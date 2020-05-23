import 'package:flutter/material.dart';
import 'dart:math';

class HeronsFormula extends StatefulWidget {
  @override
  _HeronsFormulaState createState() => _HeronsFormulaState();
}

class _HeronsFormulaState extends State<HeronsFormula> {
  var _formkey = GlobalKey<FormState>();
  var _unit = ['cm', 'm'];
  var newvalue = 'cm';

  TextEditingController side1Controller = TextEditingController();
  TextEditingController side2Controller = TextEditingController();
  TextEditingController side3Controller = TextEditingController();

  var padding = Padding(padding: EdgeInsets.all(10.0));
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Heron's Formula"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child:Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              getImage(),
              Container(
                  height: 50,
                  width: 50,
                  child: Text(
                    "ENTER THE SIDES OF TRIANGLE",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                    ),
                  )),
              TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: side1Controller,
                  validator: (String local) {
                    if (local.isEmpty) {
                      return "This Field Can't Be Empty";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Side 1",
                      hintText: "Example : 2.8",
                      labelStyle: textStyle,
                      prefixIcon: Icon(Icons.input),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
              padding,
              TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: side2Controller,
                  validator: (String local) {
                    if (local.isEmpty) {
                      return "This Field Can't Be Empty";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Side 2",
                      hintText: "Example : 2.8",
                      labelStyle: textStyle,
                      prefixIcon: Icon(Icons.input),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
              padding,
              TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: side3Controller,
                  validator: (String local) {
                    if (local.isEmpty) {
                      return "This Field Can't Be Empty";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Side 3",
                      hintText: "Example : 2.8",
                      labelStyle: textStyle,
                      prefixIcon: Icon(Icons.input),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
              padding,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  padding,
                  Expanded(
                    child: DropdownButton<String>(
                      style: textStyle,
                      elevation: 10,
                      items: _unit.map((String values) {
                        return DropdownMenuItem<String>(
                          value: values,
                          child: Text(values),
                        );
                      }).toList(),
                      onChanged: (String getvalue) {
                        setState(() {
                          this.newvalue = getvalue;
                        });
                      },
                      value: newvalue,
                    ),
                  ),
                ],
              ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      color: Colors.amber,
                      colorBrightness: Brightness.light,
                      child: Text('Calculate'),
                      onPressed: () {
                        setState(() {
                          if (_formkey.currentState.validate()) {
                            this.displayResult = _calculateResult();
                          }
                        });
                      },
                    )),
                    padding,
                    Expanded(
                      child: RaisedButton(
                        color: Colors.yellow,
                        child: Text('Reset'),
                        onPressed: () {
                          setState(() {
                            _resetto();
                          });
                        },
                      ),
                    )
                  ],
                ),
                padding,
                Text(
                  this.displayResult,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget getImage() {
    NetworkImage networkImage = NetworkImage(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Triangle_with_notations_2_without_points.svg/297px-Triangle_with_notations_2_without_points.svg.png");
    Image image = Image(
      image: networkImage,
      height: 150.0,
    );
    return Container(child: image);
  }

   String _calculateResult() {
    double sides1= double.parse(side1Controller.text);
    double sides2 = double.parse(side2Controller.text);
    double sides3 = double.parse(side3Controller.text);

    double parameter = sides1 + sides2 + sides3;
    double s = parameter/2;
    double sf = s*(s-sides1)*(s-sides2)*(s-sides3);
    double total = sqrt(sf);
    print(total);
    String result = 'The Semi Parameter of Your triangle is $s & Area of Your Triangle is $total';
    return result;
  }

  void _resetto(){
    side1Controller.text= "";
    side2Controller.text="";
    side3Controller.text="";

  }
}
