import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class ProfilePicture extends StatelessWidget {
  final Profile p;
  const ProfilePicture({super.key, required this.p});
  @override
  Widget build(BuildContext context) {
    
    double maxWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: 53),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: maxWidth * 0.3,
        child: CircleAvatar(
          radius: maxWidth *0.29,
          backgroundImage: NetworkImage(p.picture),
        ),
      ),
    );
  }
}
