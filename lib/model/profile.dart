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
  late Map<String, bool> projects = {};
  late Map<String, double> skills = {};

  // constructor
  Profile(json) {
    picture = json["image"]["versions"]["medium"] ?? "";
    real_name = json["usual_full_name"] ??  "";
    login = json["login"] ?? "";
    campus = json["campus"][0]["name"] ?? "";
    email = json["email"] ?? "";
    mobile = json["phone"] ?? "";
    level = json["cursus_users"][1]["level"] ?? "";
    eval_point = json["cursus_users"][1]["user"]["correction_point"] ?? "";
    year = json["pool_year"] != null ? int.parse(json["pool_year"]) : 0;
    wallet = json["wallet"] ?? "" ;
    if (json["cursus_users"][1]["skills"] != null){
      for (var skill in json["cursus_users"][1]["skills"]) {
        skills[skill["name"]] = skill["level"];
      }
    }
    else {skills[""] = 0 ;}
    int i = 0;
    if (json["projects_users"] != null){
      for (var proj in json["projects_users"]) {
        if (i >= 5) {
          break;
        }
        if (proj["validated?"] != null) {
          projects[proj["project"]["name"]] = proj["validated?"];
          i++;
        }
      }
    }
    else{projects[""] = true;}
  }
}
