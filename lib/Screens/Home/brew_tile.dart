import 'package:flutter/material.dart';
import 'package:untitled6/models/Brew.dart';
class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({required this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0,6.0,20.0,0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Colors.brown[brew.strength],
           // backgroundImage: AssetImage('assets/Salted Toffee IB_1.jpg'),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
