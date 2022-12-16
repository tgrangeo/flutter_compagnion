import 'package:flutter/material.dart';
import '../styles.dart' as s;
import '../model/profile.dart';

class MainInfo extends StatelessWidget {
  final Profile p;
  const MainInfo({super.key, required this.p});

  double getLevel() {
    double res = p.level - p.level.toInt();
    return res;
  }

  String getLogin() {
    if (p.login == "frfrey") {
      return "Awesome frfrey";
    } else {
      return p.login;
    }
  }

  @override
  Widget build(BuildContext context) {
   double maxWidth = MediaQuery.of(context).size.width;
   //double maxHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        width: maxWidth * 0.8,
        height: 42.0,
        decoration: s.Style.box,
        child: Center(
          child: Text(
            getLogin(),
            style: s.Style.loginText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(10),
          width: maxWidth * 0.8,
          decoration: s.Style.box,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "name: ${p.real_name}",
                  textAlign: TextAlign.left,
                  style: s.Style.TextDiv,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("campus: ${p.campus}",
                    textAlign: TextAlign.left, style: s.Style.TextDiv),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text("level: ${p.level}", style: s.Style.TextDiv),
                  ),
                  SizedBox(
                    width: maxWidth * 0.35,
                    child: LinearProgressIndicator(
                      value: getLevel(),
                      backgroundColor: Colors.grey.shade500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("evaluation points: ${p.eval_point}",
                      textAlign: TextAlign.left, style: s.Style.TextDiv)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("year: ${p.year}",
                    textAlign: TextAlign.left, style: s.Style.TextDiv),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("wallet: ${p.wallet}",
                    textAlign: TextAlign.left, style: s.Style.TextDiv),
              ),
            ],
          )),
    ]);
  }
}
