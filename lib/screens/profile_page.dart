import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: ProfilePage());

  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
