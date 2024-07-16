import 'package:flutter/material.dart';

import '../../model/cash_collection.dart';

class TransactionScreen extends StatefulWidget {
  final CashCollectionResponsse apiResponse;

  TransactionScreen({required this.apiResponse});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _selectedDateRange = 'Today';
  List<CashCollection> _filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    _filterTransactions();
  }

  void _filterTransactions() {
    DateTime startDate;
    DateTime endDate = endOfToday();

    if (_selectedDateRange == 'Today') {
      startDate = startOfToday();
    } else if (_selectedDateRange == 'Yesterday') {
      startDate = startOfYesterday();
      endDate = startOfToday();
    } else if (_selectedDateRange == 'This Week') {
      startDate = startOfWeek();
    } else if (_selectedDateRange == 'This Month') {
      startDate = startOfMonth();
    } else {
      startDate = DateTime(2000); // Default to all time
    }

    setState(() {
      _filteredTransactions = filterTransactions(widget.apiResponse.data, startDate, endDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedDateRange,
            onChanged: (String? newValue) {
              setState(() {
                _selectedDateRange = newValue!;
                _filterTransactions();
              });
            },
            items: <String>['Today', 'Yesterday', 'This Week', 'This Month', 'All Time']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTransactions.length,
              itemBuilder: (context, index) {
                CashCollection transaction = _filteredTransactions[index];
                return ListTile(
                  title: Text('Order ID: ${transaction.orderId}'),
                  subtitle: Text('Amount After Commission: ${transaction.amountAfterCommission}'),
                  trailing: Text('Commission: ${transaction.commission}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  List<CashCollection> filterTransactions(List<CashCollection> transactions, DateTime startDate, DateTime endDate) {
    return transactions.where((transaction) {
      return transaction.transactionDate.isAfter(startDate) && transaction.transactionDate.isBefore(endDate);
    }).toList();
  }

  DateTime startOfToday() {
    return DateTime.now().subtract(Duration(
      hours: DateTime.now().hour,
      minutes: DateTime.now().minute,
      seconds: DateTime.now().second,
      milliseconds: DateTime.now().millisecond,
      microseconds: DateTime.now().microsecond,
    ));
  }

  DateTime startOfYesterday() {
    return startOfToday().subtract(Duration(days: 1));
  }

  DateTime startOfWeek() {
    DateTime now = DateTime.now();
    return now.subtract(Duration(days: now.weekday - 1));
  }

  DateTime startOfMonth() {
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  DateTime endOfToday() {
    return startOfToday().add(Duration(days: 1)).subtract(Duration(seconds: 1));
  }




}
