import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                "Profile",
                style: TextStyle(
                    color: Color(0xFFF1F1F1),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<AuthBloc>().add(const AuthLogoutPressed());
                  },
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: Color(0xFF10403B),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Log Out",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Color(0xFF10403B),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
