import 'package:flutter/material.dart';

class SearchNews extends StatefulWidget {
  final List dataSearched;

  SearchNews(this.dataSearched);

  @override
  _SearchNewsState createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  List searchedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Post',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          onChanged: (val) {
            setState(() {
              searchedData = widget.dataSearched
                  .where(
                    (el) => el.title.contains(val),
                  )
                  .toList();
            });
          },
        ),
      ),
      //  searchedData.isEmpty ?
      body: Center(
        child: Text(
          'No match',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      // : ListView.builder(
      //     itemCount: searchedData.length,
      //     itemBuilder: (ctx, i) {
      //       return Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: <Widget>[
      //           ListTile(
      //             title: Text(searchedData[i].title),
      //             subtitle: Text(searchedData[i].description),
      //           ),
      //           Divider(
      //             height: 0,
      //           )
      //         ],
      //       );
      //     },
      //   ),
    );
  }
}
