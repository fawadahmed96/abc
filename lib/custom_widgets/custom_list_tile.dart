import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
 final String text;
 final Function onTap;
 final IconData icon;
  CustomListTile({this.text, this.onTap, this.icon});
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(widget.icon),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(widget.text,style: TextStyle(fontSize: 16.0),),
              ),
            ],
          ),
          Icon(Icons.arrow_right),
        ],
      ),
    );
  }
}
