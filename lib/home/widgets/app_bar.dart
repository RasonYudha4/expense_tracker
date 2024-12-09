import 'package:authentication_repository/authentication_repository.dart';
import 'package:expense_tracker/home/widgets/avatar.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello ${user.name ?? ''}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      "Check your expenses",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("clicked");
                      },
                      child: Avatar(
                        photo: user.photo,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          print("clicked");
                        },
                        icon: Icon(
                          Icons.notifications,
                          size: 40,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}