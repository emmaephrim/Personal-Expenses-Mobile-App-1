import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPcOfAmount})
      : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPcOfAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 10),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPcOfAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
