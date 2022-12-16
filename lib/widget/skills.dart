import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class Skills extends StatelessWidget {
  final Profile p;
  const Skills({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: maxWidth * 0.8,
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
                        constraints: const BoxConstraints.expand(height: 60),
                        child: Column(children: [
                          Text(key,
                              textAlign: TextAlign.left,
                              style: s.Style.TextDiv,
                              maxLines: 1,),
                          SizedBox(
                              width: maxWidth * 0.7,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
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
