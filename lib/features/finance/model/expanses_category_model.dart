import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';

class ExpansesCategoryModel {
  final String id;
  final String name;
  final IconData icon;

  ExpansesCategoryModel({String? id, required this.name, required this.icon})
    : id = id ?? UniqueKey().toString();
}

List<ExpansesCategoryModel> expansesData = [
  ExpansesCategoryModel(name: 'Food', icon: HugeIcons.strokeRoundedStreetFood),
  ExpansesCategoryModel(
    id: UniqueKey().toString(),
    name: 'Transport',
    icon: HugeIcons.strokeRoundedCar01,
  ),
  ExpansesCategoryModel(
    name: 'Shopping',
    icon: HugeIcons.strokeRoundedShoppingBag01,
  ),
  ExpansesCategoryModel(
    name: 'Entertainment',
    icon: HugeIcons.strokeRoundedGame,
  ),
  ExpansesCategoryModel(
    name: 'Health',
    icon: HugeIcons.strokeRoundedHeartCheck,
  ),
  ExpansesCategoryModel(name: 'Utilities', icon: HugeIcons.strokeRoundedBulb),
  ExpansesCategoryModel(name: 'Other', icon: HugeIcons.strokeRoundedMore01),
];
