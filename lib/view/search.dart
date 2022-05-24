import 'package:flutter/material.dart';

import '../widget/widget.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize:Size.fromHeight(50),
        child: appBarMain(context),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.black12),
                color: Colors.black12,
              ),

              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              child: TextField(
                controller: searchEditingController,
                decoration: InputDecoration(
                  hintText: 'Search UserName ...',
                  suffixIcon: Icon(Icons.search)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
