
part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {}

class InitialState extends TransactionState{
    
  @override 
  List<Object> get props => [];

}

class TransactionListLoadedState extends TransactionState{
  final List<Transaction> transactionList; 
  
  TransactionListLoadedState(this.transactionList);

  @override 
  List<Object> get props => [transactionList];

}