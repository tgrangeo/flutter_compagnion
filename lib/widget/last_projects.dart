import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class LastProjects extends StatelessWidget {
  final Profile p;
  const LastProjects({super.key, required this.p});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 360.0,
      decoration: s.Style.box,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "last projects validated:",
              style: s.Style.TextTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(4),
                itemBuilder: (BuildContext context, int index) {
                  return ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 35),
                      child: SizedBox(
                        height: 18,
                        child: Center(
                            child: Text(p.last_project[index],
                                style: s.Style.TextDiv)),
                      ));
                },
                itemCount: p.last_project.length),
          ),
        ],
      ),
    );
  }
}
