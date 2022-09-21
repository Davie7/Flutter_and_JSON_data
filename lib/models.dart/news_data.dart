import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  // making getters for the private variables
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;


  Future<void> get fetchData async {
    final response = await get(
      Uri.parse('https://dl.dropbox.com/s/9kmcjupf2tztebh/persons.JSON?dl=0'),
    );
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error! connect to a stable network';
      _map = {};
    }

    notifyListeners();
  }

  void initialValues(){
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
