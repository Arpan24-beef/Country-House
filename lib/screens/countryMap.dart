import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';





class CountryMap extends StatefulWidget {
  final String   name;
  final  List latlng;
  CountryMap(this.name,this.latlng);

  @override
  _CountryMapState createState() => _CountryMapState();
}

class _CountryMapState extends State<CountryMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
        title: Text(widget.name),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latlng[0], widget.latlng[1]),
          zoom: 5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },),
    );
  }
}
