import 'package:flutter/material.dart';

class TransactionFormWidget extends StatefulWidget {
  final Function addNewTransaction;

  TransactionFormWidget(this.addNewTransaction);

  @override
  _TransactionFormWidgetState createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitDate() {
    final titleValue = titleController.text;
    final amountValue = double.parse(amountController.text);

    if (titleValue.isEmpty || amountValue <= 0) {
      return;
    }
    widget.addNewTransaction(
        titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (value) => submitDate(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (value) => submitDate(),
            ),
            FlatButton(
              child: Text('submit'),
              onPressed: submitDate,
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
