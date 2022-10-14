import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class LastProjects extends StatelessWidget {
  final Profile p;
  const LastProjects({super.key, required this.p});


  Widget getText(key){
    if(p.projects[key] == true){
      return Text(key,style: s.Style.projectDone);
    }else{
      return Text(key,style: s.Style.projectFailed);
    }
  }

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
              "last projects:",
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
                  String key = p.projects.keys.elementAt(index);
                  return ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 35),
                      child: SizedBox(
                        height: 18,
                        child: Center(
                            child: getText(key),
                          )
                        )
                  );
                },
                itemCount: p.projects.length),
          ),
        ],
      ),
    );
  }
}
