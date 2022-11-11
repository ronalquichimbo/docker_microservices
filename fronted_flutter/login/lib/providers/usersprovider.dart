import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:login/models/users.dart';

class UsersProvider extends ChangeNotifier {
  String _baseUrl = "192.168.1.5:5000";

  // List<Users> onDisplayMovies = [];
  UsersProvider() {
    print('MoviesProvider inicializado');
    getOnDisplayerMovies();
  }

  getOnDisplayerMovies() async {
    print('getOndDisplayerMOvies');

    var url = Uri.http(_baseUrl, '/users');
    print(url);

    final response;
    //   // Await the http get response, then decode the json-formatted response.
    try {
      response = await http.get(url);
    } on SocketException {
      throw Exception('No Internet connection');
    }
    print(url);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("fallo");
    }
  }
}


class name extends StatelessWidget {
  const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}