import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../profile.dart';

class ProfilePicture extends StatelessWidget {
  final Profile p;
  const ProfilePicture({super.key, required this.p});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 53),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 95,
        child: CircleAvatar(
          radius: 90,
          backgroundImage: NetworkImage(p.picture),
        ),
      ),
    );
  }
}
