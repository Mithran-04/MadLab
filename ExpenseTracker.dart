import 'package:flutter/material.dart';

class MyExpense extends StatefulWidget {
  @override
  _MyExpenseState createState() => _MyExpenseState();
}

class _MyExpenseState extends State<MyExpense> {
  final List<Transaction> _transactions = [];
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  double get _totalSpending {
    return _transactions.fold(0.0, (sum, item) => sum + item.amount);
  }

  void _addTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    setState(() {
      _transactions.add(Transaction(
        title: enteredTitle,
        amount: enteredAmount,
      ));
    });

    _titleController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    onSubmitted: (_) => _addTransaction(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _addTransaction(),
                  ),
                  ElevatedButton(
                    onPressed: _addTransaction,
                    child: Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Expenses:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${_totalSpending.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Expanded(
             child: ListView.builder(
                 // shrinkWrap: true,
                  itemCount: _transactions.length,
                  itemBuilder:(context,index){

                    Transaction tr=_transactions[index];
                    return ListTile(
                      title: Text(tr.title),
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                      tileColor: Colors.blueAccent,
                      selectedTileColor: Colors.orange[100],
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(tr.amount.toString()),
                          Icon(Icons.monetization_on)
                        ],
                      ),
                    );
                  }),
           ),

        ],
      ),
    );
  }
}

class Transaction {
  final String title;
  final double amount;

  Transaction({required this.title, required this.amount});
}
