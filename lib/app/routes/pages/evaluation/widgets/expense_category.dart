import 'package:flutter/material.dart';

class ExpenseCategoryItem extends StatelessWidget {
  final String categoryName;
  final String amount;
  final double percentage;
  final Color barColor;

  const ExpenseCategoryItem({
    Key? key,
    required this.categoryName,
    required this.amount,
    required this.percentage,
    this.barColor = const Color(0xFF2D336B),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 10),
                  Text(
                    amount,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Text(
                "${percentage.toStringAsFixed(1)}%",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 6,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage / 100,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: barColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
