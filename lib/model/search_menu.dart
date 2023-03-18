import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

class CustomSearch extends SearchDelegate{
  final String? hintText;
  CustomSearch({this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        query=' ';
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    String city=query;
    return HomePage(city);

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

}