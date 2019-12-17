import 'package:country/screens/countryMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
class Country extends StatefulWidget {
 final Map country;
  Country({this.country});

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.country['name']),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
          children: <Widget>[
            FlipCard(
              front: Card(
                elevation: 10,
                child: Center(child: Text('Capital',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
              back:Card(color: Colors.teal,
                elevation: 10,
                child: Center(child: Text(widget.country['capital'],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              ) ,
            ),
            FlipCard(
              front: Card(
                elevation: 10,
                child: Center(child: Text('Population',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              ),
              back: Card(color: Colors.teal,
                elevation: 10,
                child: Center(child: Text(widget.country['population'].toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ),
            FlipCard(
              front: Card(
                elevation: 10,
                child: Center(child: Text('Flag',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              ),
              back: Card(
                elevation: 10,
                child: SvgPicture.network(widget.country['flag'])
              ),
            ),
            FlipCard(
              front: Card(
                elevation: 10,
                child: Center(child: Text('Currency',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              ),
              back: Card(color: Colors.teal,
                elevation: 10,
                child: Center(child: Text(widget.country['currencies'][0]['name'],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ),
            GestureDetector(onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CountryMap(widget.country['name'],widget.country['latlng'])));
              print(widget.country['latlng']);
            },
              child: Card(
                elevation: 10,
                child: Center(child: Text('Show on Map',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              ),
            )
          ],
)
)
    );
  }
}
