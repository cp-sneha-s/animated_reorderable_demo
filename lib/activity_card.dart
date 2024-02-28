
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String activity;
  final String why;
  final Color color;
  final bool selected;
  final Function(bool?)? onChanged;

  const ActivityCard({super.key,
    required this.activity,
    required this.why,
    required this.color,
    required this.selected,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "$activity - WHY",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Material(
                color: color,
                  child: Checkbox(value: selected, onChanged: onChanged))
            ],
          ),
          Expanded(
            child: Text(
              why,
              overflow: TextOverflow.fade,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}