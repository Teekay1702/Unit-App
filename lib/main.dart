import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_app/routes/routes_management.dart';

import 'models/unit_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UnitData(),
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteManager.mainPage,
            onGenerateRoute: RouteManager.generateRoute,
          );
        });
  }
}
