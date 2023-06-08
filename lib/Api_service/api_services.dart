import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class ApiServices {
  static Future fetchUser() async {
    var url = Uri.parse('https://apiserverplan.azurewebsites.net/api/TbUsers');
    return await http.get(url);
  }
}
