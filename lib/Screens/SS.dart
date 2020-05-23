import 'package:flutter/material.dart';

class Formula extends StatefulWidget {
  @override
  _FormulaState createState() => _FormulaState();
}

class _FormulaState extends State<Formula> {
  var _formkey = GlobalKey<FormState>();
  var _currencies = ['Rupees', 'Dollar', 'Dinar', 'Others'];
  var newvalue = 'Rupees';
  var padding = Padding(
    padding: EdgeInsets.all(10.0),
  );
  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      backgroundColor: Colors.tealAccent,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Simple Interest Calculator',
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          // margin: EdgeInsets.all(10.0),
          child: Center(
            heightFactor: 20.0,
            child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getImage(),
                padding,
                TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: principleController,
                    validator: (String local) {
                      if (local.isEmpty) {
                        return 'the principle amount is not found';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Principle",
                        hintText: "Example:220.8",
                        labelStyle: textStyle,
                        prefixIcon: Icon(Icons.input),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                padding,
                TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: roiController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "ROI cannot be blank";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: "Example:18%",
                      labelStyle: textStyle,
                      errorStyle: TextStyle(color: Colors.deepOrange),
                      prefixIcon: Icon(Icons.account_balance_wallet),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )),
                padding,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                          style: textStyle,
                          controller: termController,
                          validator: (String tms) {
                            if (tms.isEmpty) {
                              return 'term field cannot be null';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.archive),
                            labelText: "Terms",
                            hintText: "Time In Years",
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.orangeAccent,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          )),
                    ),
                    padding,
                    Expanded(
                      child: DropdownButton<String>(
                        style: textStyle,
                        elevation: 10,
                        items: _currencies.map((String values) {
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
                padding,
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
        'https://cdn0.iconfinder.com/data/icons/finance-icons-rounded/110/Calculator-512.png');
    Image image = Image(
      image: networkImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(child: image);
  }

  String _calculateResult() {
    double principle = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalamount = (principle * roi * term) / 100;

    String result = 'After $term year your Simple Interest is $totalamount';
    return result;
  }

  void _resetto() {
    principleController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    newvalue = _currencies[0];
  }
}
