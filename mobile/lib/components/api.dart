import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class API2 {
  final String _url = 'http://10.0.2.2:1111/api/user/auth';
  postData(data,apiUrl) async {
    var fullUrl=_url;

    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders()=>{
    'Content-type' : 'application/json',
    'Accept':'application/json',
  };
}

