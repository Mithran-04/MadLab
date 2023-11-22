import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Dress {
  final String name;
  final String description;

  Dress({required this.name, required this.description});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dress Catalog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DressListPage(),
    );
  }
}

class DressListPage extends StatelessWidget {
  final List<Dress> dresses = [
    Dress(name: 'Casual Dress', description: 'Comfortable and stylish casual dress.'),
    Dress(name: 'Evening Gown', description: 'Elegant evening gown for special occasions.'),
    Dress(name: 'Summer Dress', description: 'Light and breezy dress perfect for summer.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dress Catalog'),
      ),
      body: ListView.builder(
        itemCount: dresses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dresses[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DressDetailPage(dress: dresses[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DressDetailPage extends StatelessWidget {
  final Dress dress;

  DressDetailPage({required this.dress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dress Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dress.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              dress.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
