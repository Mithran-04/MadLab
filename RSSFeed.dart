import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  RssFeed? feed; // Allow null value for feed
  @override
  void initState() {
    super.initState();
    fetchFeed('https://www.nasa.gov/rss/dyn/breaking_news.rss').then((result) {
      setState(() {feed = result;});
    });}
  Future<RssFeed> fetchFeed(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return RssFeed.parse(response.body);
    } else {
      throw Exception('Failed to load RSS feed');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS Reader'),
        centerTitle: true,
        backgroundColor: Colors.black,),
      body: _buildBody(),);
  }

  Widget _buildBody() {
    if (feed == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        itemCount: feed!.items!.length,
        itemBuilder: (BuildContext context, int index) {
          var item = feed!.items![index];
          return ListTile(
            title: Text(item.title ?? 'No title'),
            subtitle: Text(item.pubDate.toString() ?? 'No date'),
            onTap: () {},
          );
        },);}}
}
