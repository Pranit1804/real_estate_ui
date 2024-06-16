import 'package:flutter/material.dart';
import 'package:real_estate_ui/modules/search/data/model/menu_item_model.dart';

class SearchConstants {
  static List<MenuItemModel> menuItems = [
    MenuItemModel(id: 0, icon: Icons.architecture, name: 'Cosy areas'),
    MenuItemModel(
      id: 1,
      icon: Icons.price_change,
      name: 'Price',
    ),
    MenuItemModel(id: 2, icon: Icons.factory_outlined, name: 'Infrastructure'),
    MenuItemModel(id: 3, icon: Icons.layers, name: 'Without any layer'),
  ];
}
