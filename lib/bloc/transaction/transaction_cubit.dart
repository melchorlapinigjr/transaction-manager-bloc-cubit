import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_manager/model/transaction_model.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState>{
  TransactionCubit() : super(InitialState());
  
  void transactionList() {
      List<Transaction> transactionList = [
      Transaction(
      name: "Buy Laptop i9 20gb Ram",
      description: "This is the description",
      date: '8/10/2020',
      amount: 5300.00,
      category:  'Gadgets',
      isExpense: true,
      icon: Icons.laptop_windows,
      ),
      Transaction(
      name: "Kita sa pamayot didto ila Joel dapit.",
      description: "This is the description",
      date: '8/13/2020',
      amount: 3200.00,
      category:  'Pangkwarta',
      isExpense: false,
      icon: Icons.fastfood,
      ),
      Transaction(
      name: "Buy Cellpon nga Samsung TwelveCore 20gb Ram",
      description: "This is the description",
      date: '8/1/2020',
      amount: 900.00,
      category:  'Gadgets',
      isExpense: true,
      icon: Icons.network_cell
      ),
      Transaction(
      name: "Kita sa pang hingi sa mga buang nga tambay.",
      description: "This is the description",
      date: '8/1/2020',
      amount: 9060.00,
      category:  'Kwarta',
      isExpense: false,
      icon: Icons.computer
      ),
      Transaction(
      name: "Buy Cellpon nga Samsung TwelveCore 20gb Ram",
      description: "This is the description",
      date: '8/1/2020',
      amount: 7800.00,
      category:  'Gadgets',
      isExpense: true,
      icon: Icons.insert_emoticon
      ),
      Transaction(
      name: "Buy Cellpon nga Samsung TwelveCore 20gb Ram",
      description: "This is the description",
      date: '8/1/2020',
      amount: 7300.00,
      category:  'Gadgets',
      isExpense: false,
      icon: Icons.pages
      )
    ]; 

    emit(TransactionListLoadedState(transactionList));
  } 


}