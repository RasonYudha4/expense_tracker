import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            alignment: Alignment.bottomCenter,
            height: 90,
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView(padding: EdgeInsets.all(15), children: [
              NotificationCard(),
              SizedBox(
                height: 20,
              ),
              NotificationCard(),
            ]),
          )
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {},
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          color: Colors.deepPurple,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Study Circle",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            "Start your productive group now!",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
