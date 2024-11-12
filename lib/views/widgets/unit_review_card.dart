import 'package:flutter/material.dart';

class UnitReviewCard extends StatelessWidget {
  const UnitReviewCard({super.key, required this.unit});
  final Map<String, dynamic> unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 25,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${unit['image']}'),
              const SizedBox(
                height: 10,
              ),
              Text('${unit['unit']}'),
              const SizedBox(
                height: 10,
              ),
              Text('${unit['concepts']}'),
              const SizedBox(
                height: 10,
              ),
              Text('${unit['definition']}'),
            ],
          ),
        ),
      ),
    );
  }
}
