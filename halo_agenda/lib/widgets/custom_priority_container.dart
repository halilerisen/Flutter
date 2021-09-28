import 'package:flutter/material.dart';
import 'package:haloagenda/enums/priority_kind.dart';

class CustomPriorityContainer extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final priorityKind;
  final priorityKindTemp;
  double offset;

  CustomPriorityContainer({
    this.onPressed,
    this.width = 36.0,
    this.height = 36.0,
    this.offset = 3,
    this.priorityKind,
    this.priorityKindTemp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Opacity(
          opacity: priorityKind == priorityKindTemp ? 1.0 : 0.3,
          child: Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PriorityKindClass.priorityKindColorList[priorityKind]
                    [300],
                boxShadow: [
                  BoxShadow(
                      color: PriorityKindClass
                          .priorityKindColorList[priorityKind][600],
                      offset: Offset(offset, offset),
                      blurRadius: 7.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color:
                          PriorityKindClass.priorityKindColorList[priorityKind],
                      offset: Offset(-offset, -offset),
                      blurRadius: 7.0,
                      spreadRadius: 1.0),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      PriorityKindClass.priorityKindColorList[priorityKind]
                          [300],
                      PriorityKindClass.priorityKindColorList[priorityKind]
                          [400],
                      PriorityKindClass.priorityKindColorList[priorityKind]
                          [500],
                      PriorityKindClass.priorityKindColorList[priorityKind]
                          [600],
                    ],
                    stops: [
                      0.1,
                      0.3,
                      0.8,
                      1
                    ])),
          ),
        ),
      ),
    );
  }
}
