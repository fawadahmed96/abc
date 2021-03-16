import 'package:flutter/material.dart';

class PaymentButtonScreen extends StatefulWidget {
  @override
  _PaymentButtonScreenState createState() => _PaymentButtonScreenState();
}

class _PaymentButtonScreenState extends State<PaymentButtonScreen> {
  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }
  String valueChoose1;
  String valueChoose2;
  List listItem = ["USD", "AUD", "GBP"];
  List cardListItem = ["Card 1", "Card 2", "Card 3", "Card 4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  width: 150.0,
                  height: 40.0,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Amount",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.horizontal(),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                DropdownButton(
                  hint: Text("choose currency: "),
                  value: valueChoose1,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose1 = newValue;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Text("Payment gateway"),
          Row(
            children: [
              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Image.asset("images/card6usa.jpg",width: 60.0,height: 60.0,),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
        Image.asset("images/card8us.  jpg",width: 60.0,height: 60.0,),
              new Radio(
                value: 2,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Image.asset("images/card7uk.png",width: 60.0,height: 60.0,),
            ],
          ),
          ],
        ),
      ),
    );
  }
}

