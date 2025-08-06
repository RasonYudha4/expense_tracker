import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE0E0E0),
        body: Stack(
          children: [
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF2D336B),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(200, 100),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(color: Color(0xFF2D336B)),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                width: 350,
                margin: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width - 350) / 2),
                decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Monthly Remaining",
                      style: TextStyle(
                          color: Color(0xFF2D336B),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Rp 675.000",
                      style: TextStyle(
                          color: Color(0xFF7886C7),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.my_location_rounded),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Initial Balance",
                                  style: TextStyle(
                                      color: Color(0xFF2D336B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Text(
                              "Rp 1.200.000",
                              style: TextStyle(
                                  color: Color(0xFF7886C7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.trending_up_rounded),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Total Expense",
                                  style: TextStyle(
                                      color: Color(0xFF2D336B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Text(
                              "Rp 525.000",
                              style: TextStyle(
                                  color: Color(0xFF7886C7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 380,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Target Savings",
                            style: TextStyle(
                                color: Color(0xFF2D336B),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 32,
                            color: Color(0xFF2D336B),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New PC",
                                  style: TextStyle(
                                    color: Color(0xFF7886C7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "14 December 2026",
                                      style: TextStyle(
                                        color: Color(0xFF7886C7),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "2.300.000",
                                          style: TextStyle(
                                            color: Color(0xFF2D336B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " / ",
                                          style: TextStyle(
                                            color: Color(0xFF7886C7),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "6.000.000",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New PC",
                                  style: TextStyle(
                                    color: Color(0xFF7886C7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "14 December 2026",
                                      style: TextStyle(
                                        color: Color(0xFF7886C7),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "2.300.000",
                                          style: TextStyle(
                                            color: Color(0xFF2D336B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " / ",
                                          style: TextStyle(
                                            color: Color(0xFF7886C7),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "6.000.000",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New PC",
                                  style: TextStyle(
                                    color: Color(0xFF7886C7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "14 December 2026",
                                      style: TextStyle(
                                        color: Color(0xFF7886C7),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "2.300.000",
                                          style: TextStyle(
                                            color: Color(0xFF2D336B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " / ",
                                          style: TextStyle(
                                            color: Color(0xFF7886C7),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "6.000.000",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New PC",
                                  style: TextStyle(
                                    color: Color(0xFF7886C7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "14 December 2026",
                                      style: TextStyle(
                                        color: Color(0xFF7886C7),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "2.300.000",
                                          style: TextStyle(
                                            color: Color(0xFF2D336B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          " / ",
                                          style: TextStyle(
                                            color: Color(0xFF7886C7),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          "6.000.000",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
