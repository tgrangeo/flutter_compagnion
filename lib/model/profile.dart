import 'package:flutter/material.dart';
import 'dart:ffi';
import 'dart:convert';

// profile picture , login , email , mobile , level , location ,  wallet ,

class Profile {
  late String picture;
  late String login;
  late String email;
  late String real_name;
  late String mobile;
  late String campus;
  late int year;
  late int eval_point;
  late int wallet;
  late double level;
  late List<String> last_project = [];
  late Map<String, double> skills = {};

  // constructor
  Profile(json) {
    picture = json["image_url"];
    real_name = json["usual_full_name"];
    login = json["login"];
    campus = json["campus"][0]["name"];
    email = json["email"];
    mobile = json["phone"];
    level = json["cursus_users"][1]["level"];
    eval_point = json["cursus_users"][1]["user"]["correction_point"];
    year = int.parse(json["pool_year"]);
    wallet = json["wallet"];
    int i = 0;
    for (var project in json["projects_users"]) {
      if (i >= 5) {
        break;
      }
      if (project["status"] == "finished") {
        last_project.add(project["project"]["name"]);
        i++;
      }
    }
    for (var skill in json["cursus_users"][1]["skills"]) {
      skills[skill["name"]] = skill["level"];
    }
  }
}
