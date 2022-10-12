import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../profile.dart';

class Skills extends StatelessWidget {
  final Profile p;
  const Skills({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 240.0,
      //height: 160.0,
      decoration: s.Style.box,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              "skills:",
              style: s.Style.loginText,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(2),
                itemBuilder: (BuildContext context, int index) {
                  String key = p.skills.keys.elementAt(index);
                  return Column(
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.expand(height: 35),
                        child: Column(children: [
                          Text(key, textAlign: TextAlign.left),
                          SizedBox(
                            width: 220,
                            child: LinearProgressIndicator(
                              value: p.skills[key]! / 20.0,
                              backgroundColor: Colors.grey.shade500,
                              color: Colors.black,
                            ),
                          ),
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
