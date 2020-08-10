import 'package:flutter/material.dart';

class Transaction {
  final String name;
  final String description;
  final String date;
  final double amount;
  final String category;
  final bool isExpense;
  final IconData icon;

  const Transaction({
    this.name,
    this.description,
    this.date,
    this.amount,
    this.category,
    this.isExpense,
    this.icon
  });
}