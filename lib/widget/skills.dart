import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class Skills extends StatelessWidget {
  final Profile p;
  const Skills({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 360.0,
      decoration: s.Style.box,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "skills:",
              style: s.Style.TextTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 2, bottom: 10),
                itemBuilder: (BuildContext context, int index) {
                  String key = p.skills.keys.elementAt(index);
                  return Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 60),
                        child: Column(children: [
                          Text(key,
                              textAlign: TextAlign.left,
                              style: s.Style.TextDiv),
                          SizedBox(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: LinearProgressIndicator(
                                  value: p.skills[key]! / 20.0,
                                  backgroundColor: Colors.grey.shade500,
                                  color: Colors.black,
                                ),
                              )),
                        ]),
                      ),
                    ],
                  );
                },
                itemCount: p.skills.length),
          ),
        ],
      ),
    );
  }
}
