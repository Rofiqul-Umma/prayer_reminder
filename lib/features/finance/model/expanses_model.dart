import 'package:flutter/material.dart';

class ExpansesModel {
  final String id;
  final String category;
  final String description;
  final int amount;
  final DateTime date;

  ExpansesModel({
    String? id,
    required this.category,
    required this.description,
    required this.amount,
    DateTime? date,
  }) : id = UniqueKey().toString(),
       date = DateTime.now();

  // Method to convert ExpansesModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  // Factory method to create ExpansesModel from JSON
  factory ExpansesModel.fromJson(Map<String, dynamic> json) {
    return ExpansesModel(
      id: json['id'],
      category: json['category'],
      description: json['description'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }

  // Method to copy ExpansesModel with new values
  ExpansesModel copyWith({
    String? id,
    String? category,
    String? description,
    int? amount,
    DateTime? date,
  }) {
    return ExpansesModel(
      id: id ?? this.id,
      category: category ?? this.category,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }
}
