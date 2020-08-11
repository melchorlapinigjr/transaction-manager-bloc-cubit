import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_manager/bloc/transaction/transaction_cubit.dart';
import 'package:transaction_manager/model/transaction_model.dart';
import 'package:transaction_manager/pages/homepage_drawer.dart';
import 'package:transaction_manager/pages/new_transaction.dart';
import 'package:transaction_manager/widgets/header_wedget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TransactionCubit transactionCubit = TransactionCubit();

  @override
  initState() {
    transactionCubit.transactionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                HeaderWidget(
                  "Current Balance",   
                  isHome: true,
                  currentBalance: "50,000", 
                  bottonRightFunction:() {},
                ),
                TransactionSummaryWidget(),
                SizedBox(height: 10.0),
                ListLabelWidget(),
                SizedBox(height: 8.0),
                Expanded(
                  child: Container( 
                    child: BlocBuilder(
                        cubit: transactionCubit,
                        builder: (context, TransactionState state) {
                          if (state is TransactionListLoadedState) {
                            return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: state.transactionList
                                  .map(
                                    (transaction) => TransactionListWidget(
                                      transaction: transaction,
                                    ),
                                  )
                                  .toList(),
                            );
                          }
                          return Container();
                        },
                      ),  
                  ),
                ), 
                BottomButtonsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListLabelWidget extends StatelessWidget {
  const ListLabelWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("TODAY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
              textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 5, 
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.category),
              onPressed: () {
                print("pressed");
              },
              color: Colors.black),
          IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) =>
                   NewTransaction())
                );
              },
              iconSize: 60,
              color: Colors.blue),
          IconButton(
              icon: Icon(Icons.library_books),
              onPressed: () {
                print("pressed");
              },
              color: Colors.black),
        ],
      ),
    );
  }
} 
 
class TransactionSummaryWidget extends StatelessWidget {
  const TransactionSummaryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 5,),
        Expanded( 
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Income",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      "P 100,000.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 5,),
        Expanded( 
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Expense",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Text(
                      "P50,000.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ), 
        SizedBox(width: 5,),
      ],
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xFFFEFEFE),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 55.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right   horizontally
              15.0, // Move to bottom  Vertically
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16.0,
            ),
            child: Icon(
              transaction.icon,
              size: 30,
              color: transaction.isExpense ? Colors.red : Colors.blue,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 14.0,
            ),
            width: 1,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadiusDirectional.circular(5),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(transaction.name),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    transaction.date,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Text(transaction.amount.toString(),
                style:
                    TextStyle(color: transaction.isExpense ? Colors.red : Colors.black)),
          ),
        ],
      ),
    );
  }
}
