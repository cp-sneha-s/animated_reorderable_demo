
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
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
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.activity} - WHY",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Checkbox(value: widget.selected, onChanged: widget.onChanged)
            ],
          ),
          Text(
            widget.why,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}