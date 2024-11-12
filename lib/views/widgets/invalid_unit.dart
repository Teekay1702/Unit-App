import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_app/models/unit_model.dart';
import '../../routes/routes_management.dart';

class InvalidUnit extends StatelessWidget {
  const InvalidUnit({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UnitData>().fetchUnitsInfo;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Unit Reflections'),
      ),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteManager.unitPage);
            },
            child: const Text('Select one Unit'),
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<UnitData>().fetchUnitsInfo;
        },
        child: Column(
          children: [
            const Text(
              'My TPG316C Units',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic),
            ),
            Center(
              child: Consumer<UnitData>(
                builder: (context, value, child) {
                  return value.units.isEmpty && !value.error
                      ? const CircularProgressIndicator()
                      : value.error
                          ? Text(
                              'Could not load. ${value.errorMessage}',
                              textAlign: TextAlign.center,
                            )
                          //Displays invalid unit number entered screen
                          : const Text(
                              'Unit Number Does not exist',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
