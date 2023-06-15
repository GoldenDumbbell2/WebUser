import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:webspc/DTO/user.dart';
import '../DTO/section.dart';

class LoginService {
  static Future<bool> login({
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await get(
      Uri.parse("https://apiserverplan.azurewebsites.net/api/TbUsers"),
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        if (email == data[i]['email'] && password == data[i]['pass'] ||
            phoneNumber == data[i]['phoneNumber'] &&
                password == data[i]['pass']) {
          Session.loggedInUser = Users(
            userId: data[i]['userId'],
            email: data[i]['email'],
            pass: data[i]['pass'],
            phoneNumber: data[i]['phoneNumber'],
            fullname: data[i]['fullname'],
            identitiCard: data[i]['identitiCard'],
            familyId: data[i]['familyId'],
          );
          return true;
        }
      }
    }
    return false;
  }

  static Future<bool> update() async {
    final response = await get(
      Uri.parse("https://apiserverplan.azurewebsites.net/api/TbUsers"),
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        if (Session.loggedInUser.userId == data[i]['userId']) {
          Session.loggedInUser = Users(
            userId: data[i]['userId'],
            email: data[i]['email'],
            pass: data[i]['pass'],
            phoneNumber: data[i]['phoneNumber'],
            fullname: data[i]['fullname'],
            identitiCard: data[i]['identitiCard'],
            familyId: data[i]['familyId'],
          );
          return true;
        }
      }
    }
    return false;
  }
}
