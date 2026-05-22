import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;
  NewTransactions({required this.addTx, super.key});

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty || _amountController.text.isEmpty) {
      return;
    }

    final enteredDate = _selectedDate;
    final enteredTitle = _titleController.text.toString();
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, enteredDate);
    Navigator.of(context).pop();
  }

  void _presentDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2025),
            lastDate: DateTime(DateTime.now().year + 2))
        .then((datepicker) {
      if (datepicker == null) {
        return;
      }
      setState(() {
        _selectedDate = datepicker;
      });
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        // Add padding at the bottom equal to the viewInsets (keyboard height)
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _titleController,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Title"),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(labelText: "Amount"),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        _selectedDate == null
                            ? "No Date Chosen!"
                            : "Picked Date: ${DateFormat.yMMMEd().format(_selectedDate!)}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _selectedDate == null
                                ? Colors.red
                                : Colors.grey)),
                    TextButton(
                      onPressed: _presentDataPicker,
                      child: Text("Choose Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor)),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.black,
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  child: Text(
                    "Add Transaction",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
