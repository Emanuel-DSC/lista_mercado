// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:lista_mercado/widgets/item_card_widget.dart';
import 'package:provider/provider.dart';

import '../lists.dart';
import '../models/category_item_model.dart';

class CategoryPage extends StatefulWidget {
  final String name;
  static List<CategoryItem> itemList = [];

  CategoryPage({Key? key, required this.name}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    CategoryPage.itemList = categoryMap[widget.name] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(widget.name)),
          Expanded(
            child: ListView.builder(
              itemCount: CategoryPage.itemList.length,
              itemBuilder: (BuildContext context, index) {
                final item = CategoryPage.itemList[index];
                return ChangeNotifierProvider<CategoryItem>.value(
                  value: item,
                  child: ItemCard(text: item.name, index: index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
