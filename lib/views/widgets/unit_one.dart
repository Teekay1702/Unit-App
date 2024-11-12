import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_app/models/unit_model.dart';
import 'package:unit_app/views/widgets/unit_review_card.dart';

import '../../routes/routes_management.dart';

class UnitOne extends StatelessWidget {
  const UnitOne({super.key});

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

                      //Display unit one
                      : ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return UnitReviewCard(
                                unit: value.units['Specs'][0]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
