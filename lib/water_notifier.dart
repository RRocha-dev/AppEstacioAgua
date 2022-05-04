import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WaterNotifier extends ChangeNotifier {
  String value = '0';

  Future<void> getValues() async {
    while (true) {
      var response =
          await http.get("http://estacioapi.herokuapp.com/estacio/get");
      value = response.body;
      Future.delayed(Duration(seconds: 1));
      notifyListeners();
    }
  }
}

Stream<WaterNotifier> start() async* {
  yield WaterNotifier();
}
