import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'country.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;

  getCountries() async {
    var response = await Dio().get("https://restcountries.eu/rest/v2/all");

    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    getCountries().then((data){
      setState(() {
        countries = filteredCountries = data;
      });
    });

    super.initState();
  }

//  void _filtercountries(value)
//  {
//
//      setState(() {
//        filteredCountries = countries.where((country)=>country['name'].toLowerCase() == value).toList();
//      });
//
//  }

  @override
  Widget build(BuildContext context) {
//    print(countries);
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: !isSearching
              ? Text('All Countries')
              : TextFormField(onChanged: (value){
               setState(() {
                  filteredCountries = countries.where((u)=>(u['name'].toLowerCase().contains(value.toLowerCase()))).toList();

               });


          },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: 'Search Country Here',
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(
                      Icons.cancel,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        filteredCountries = countries;
                      });
                    })
                : IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    })
          ],
        ),
        body:  countries.length > 0 ?ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: filteredCountries.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Country(country: filteredCountries[index])));
              },
              child: Card(
                elevation: 5,
                child: Center(
                    child: Text(
                      filteredCountries[index]['name'],
                      textScaleFactor: 1.9,
                    )),
              ),
            );
          },
        ):Center(child:CircularProgressIndicator()));
  }
}
