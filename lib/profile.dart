import 'package:flutter/material.dart';
import 'dart:ffi';
import 'dart:convert';

// profile picture , login , email , mobile , level , location ,  wallet ,

class Profile {
  late String picture;
  late String login;
  late String email;
  late String mobile;
  late int year;
  late double level;

  // constructor
  Profile(json) {
    picture = json["image_url"] as String;
    login = json["login"] as String;
    email = json["email"] as String;
    mobile = json["phone"] as String;
    level = json["cursus_users"][1]["level"];
    year = int.parse(json["pool_year"]);
  }
}
