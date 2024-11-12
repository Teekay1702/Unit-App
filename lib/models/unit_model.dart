import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UnitData with ChangeNotifier {
  Map<String, dynamic> _units = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get units => _units;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchUnitsInfo async {
    final response = await get(
      Uri.parse(
          'https://dl.dropboxusercontent.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );

    if (response.statusCode == 200) {
      try {
        _units = jsonDecode(response.body);
        _error = false;
      } catch (error) {
        _error = true;
        _errorMessage = error.toString();
      }
    } else {
      _error = true;
      _errorMessage = 'error: file not found 404';
      _units = {};
    }
    notifyListeners();
  }
}
