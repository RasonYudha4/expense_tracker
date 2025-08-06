import 'package:expense_tracker/app/bloc/auth_bloc.dart';
import 'package:expense_tracker/home/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthBloc bloc) => bloc.state.user);

    return Scaffold(
      backgroundColor: Color(0xFFBFBFBF),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Avatar(photo: user.photo),
                    const SizedBox(height: 4),
                    Text(user.email ?? '', style: textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(user.name ?? '', style: textTheme.headlineSmall),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          LogoutButton()
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthBloc>().add(const AuthLogoutPressed());
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 0.5))),
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
    );
  }
}
