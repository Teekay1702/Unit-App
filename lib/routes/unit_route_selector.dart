import 'package:flutter/material.dart';
import 'package:unit_app/views/widgets/invalid_unit.dart';
import 'package:unit_app/views/widgets/unit_four.dart';
import 'package:unit_app/views/widgets/unit_one.dart';
import 'package:unit_app/views/widgets/unit_three.dart';
import 'package:unit_app/views/widgets/unit_two.dart';

class SelectedUnit extends StatelessWidget {
  const SelectedUnit({super.key, required this.unitNumberController});
  final TextEditingController unitNumberController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          int unitNumber = int.parse(unitNumberController.text);
          if (unitNumber == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnitOne()),
            );
          } else if (unitNumber == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnitTwo()),
            );
          } else if (unitNumber == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnitThree()),
            );
          } else if (unitNumber == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnitFour()),
            );
          } else if (unitNumber < 1 || unitNumber > 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InvalidUnit()),
            );
          }
        },
        child: const Text('Select one unit'),
      ),
    );
  }
}
