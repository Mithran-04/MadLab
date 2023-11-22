import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  CollectionReference _collection = FirebaseFirestore.instance.collection('items');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase CRUD Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _collection.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var document = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(document['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showUpdateDialog(document.id, document['name']);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteItem(document.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Item Name'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addItem();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addItem() {
    _collection.add({'name': _controller.text});
    _controller.clear();
  }

  void _deleteItem(String documentId) {
    _collection.doc(documentId).delete();
  }

  void _showUpdateDialog(String documentId, String currentName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: TextField(
            controller: TextEditingController(text: currentName),
            onChanged: (value) {
              currentName = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _updateItem(documentId, currentName);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _updateItem(String documentId, String newName) {
    _collection.doc(documentId).update({'name': newName});
  }
}
