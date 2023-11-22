import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<String> groceryItems = [];
  TextEditingController itemm=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: groceryItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(groceryItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        groceryItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: itemm,
                    // onSubmitted: (value) {
                    //   if (value.isNotEmpty) {
                    //     setState(() {
                    //       groceryItems.add(value);
                    //     });
                    //     // Clear the text field after adding an item
                    //     TextEditingController().clear();
                    //   }
                    // },
                    decoration: InputDecoration(
                      hintText: 'Enter a grocery item',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Manually close the keyboard
                    FocusScope.of(context).unfocus();

                    // Add the item to the list
                    if (itemm.text.isNotEmpty) {
                      setState(() {
                        groceryItems.add(itemm.text);
                      });
                      // Clear the text field after adding an item
                      TextEditingController().clear();
                    }
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
}
