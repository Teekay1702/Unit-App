import 'package:flutter/material.dart';
import 'package:unit_app/views/pages/navigation.dart';
import 'package:unit_app/views/widgets/unit_four.dart';
import 'package:unit_app/views/widgets/unit_one.dart';
import 'package:unit_app/views/widgets/unit_three.dart';
import 'package:unit_app/views/widgets/unit_two.dart';

import '../views/pages/main_page.dart';

class RouteManager {
  static const String mainPage = '/';
  static const String unitPage = '/unitpage';
  static const String unitOne = '/unitOne';
  static const String unitTwo = '/unittwo';
  static const String unitThree = '/unitthree';
  static const String unitFour = '/unitfour';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case unitPage:
        return MaterialPageRoute(
          builder: (context) => const UnitPageSelector(),
        );
      case unitOne:
        return MaterialPageRoute(
          builder: (context) => const UnitOne(),
        );
      case unitTwo:
        return MaterialPageRoute(
          builder: (context) => const UnitTwo(),
        );
      case unitThree:
        return MaterialPageRoute(
          builder: (context) => const UnitThree(),
        );
      case unitFour:
        return MaterialPageRoute(
          builder: (context) => const UnitFour(),
        );
      default:
        throw const FormatException('Sorry not working');
    }
  }
}
