import 'package:flutter/material.dart';

import '../widgets/donut_piechart.dart';
import '../widgets/expense_category.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFF2D336B)),
            child: Center(
              child: Text(
                "Evaluation",
                style: TextStyle(
                    color: Color(0xFFF1F1F1),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Expense Categories",
                            style: TextStyle(
                                color: Color(0xFF2D336B),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: DonutPieChartWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: Column(
                    children: [
                      ExpenseCategoryItem(
                        categoryName: "Food",
                        amount: "Rp 300.000",
                        percentage: 37.5,
                        barColor: Color(0xFF2D336B),
                      ),
                      ExpenseCategoryItem(
                        categoryName: "Transport",
                        amount: "Rp 160.000",
                        percentage: 20.0,
                        barColor: Color(0xFF7886C7),
                      ),
                      ExpenseCategoryItem(
                        categoryName: "Shopping",
                        amount: "Rp 240.000",
                        percentage: 30.0,
                        barColor: Color(0xFF9BB3F0),
                      ),
                      ExpenseCategoryItem(
                        categoryName: "Entertainment",
                        amount: "Rp 100.000",
                        percentage: 12.5,
                        barColor: Color(0xFFB8C7F5),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
