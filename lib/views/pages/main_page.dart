import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_app/models/unit_model.dart';
import 'package:unit_app/routes/routes_management.dart';
import 'package:unit_app/views/widgets/unit_review_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    context.read<UnitData>().fetchUnitsInfo;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Unit Reflection',
        ),
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
        child: Center(
          child: Consumer<UnitData>(
            builder: (context, value, child) {
              return value.units.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Could not load. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )

                      //Display All units
                      : ListView.builder(
                          itemCount: value.units['Specs'].length,
                          itemBuilder: (context, index) {
                            return UnitReviewCard(
                                unit: value.units['Specs'][index]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
