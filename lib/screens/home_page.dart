import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'file:///D:/Projects/today_news_app/lib/screens/search_news.dart';
import 'full_news_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  List data;

  Future<String> fetchData() async {
    var response = await http.get(
      Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch"),
      headers: {"X-API-Key": "b1b78bce890e485b875d6a920beecf5e"},
    );

    if (response.statusCode == 200) {
      var rawData = jsonDecode(response.body);

      setState(
        () {
          data = rawData["articles"];
        },
      );
    } else {
      throw ("Can't Retrieve Data");
    }

    return "Approved";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchNews(data),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          centerTitle: true,
          title: Text("LATEST UPDATES"),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 45,
          ),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullNewsPage(
                        author: data[index]["author"],
                        title: data[index]["title"],
                        description: data[index]["description"],
                        urlToImage: data[index]["urlToImage"],
                        publishedAt: data[index]["publishedAt"],
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        child: Image.network(
                          data[index]["urlToImage"],
                          fit: BoxFit.cover,
                          height: 400.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 380),
                      child: Container(
                        height: 200,
                        width: 400,
                        child: Material(
                          borderRadius: BorderRadius.circular(
                            40.0,
                          ),
                          elevation: 10,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Text(
                                  data[index]["title"],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            autoplay: false,
            itemCount: data == null ? 0 : data.length,
            scale: 0.9,
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}
