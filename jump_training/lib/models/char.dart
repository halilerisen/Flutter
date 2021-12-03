import 'package:flutter/material.dart';

class Chart {
  final String name;
  final int mount;
  final Color barColor;

  Chart({
    required this.name,
    required this.mount,
    this.barColor = Colors.blue,
  });
}
