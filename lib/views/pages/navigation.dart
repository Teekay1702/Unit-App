import 'package:flutter/material.dart';
import 'package:unit_app/models/unit_model.dart';
import 'package:unit_app/routes/routes_management.dart';
import 'package:unit_app/routes/unit_route_selector.dart';
import 'package:unit_app/views/widgets/text_field_viewer.dart';
import 'package:provider/provider.dart';

class UnitPageSelector extends StatefulWidget {
  const UnitPageSelector({super.key});

  @override
  State<UnitPageSelector> createState() => _UnitPageSelectorState();
}

class _UnitPageSelectorState extends State<UnitPageSelector> {
  TextEditingController unitNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    unitNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Select Unit No.'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldViewer(
              unitNumberController: unitNumberController,
            ),
            const SizedBox(
              height: 10,
            ),
            SelectedUnit(unitNumberController: unitNumberController),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<UnitData>().fetchUnitsInfo;
                  Navigator.of(context).pushNamed(RouteManager.mainPage);
                },
                child: const Text('Go back to home screen'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
