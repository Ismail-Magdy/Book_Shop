import 'package:flutter/material.dart';

class SearchListModel {
  final String title;
  final String image;
  final Color color;
  final String category;

  SearchListModel({
    required this.category,
    required this.title,
    required this.image,
    required this.color,
  });
}
