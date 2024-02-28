import 'package:flutter/material.dart';

import '../activity.dart';
import '../activity_card.dart';
import 'package:animated_reorderable_list/animated_reorderable_list.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<Activity> activities = [];
  late final TextEditingController _activityController;
  late final TextEditingController _whyController;

  @override
  void initState() {
    activities = Activity.activities;
    _activityController = TextEditingController();
    _whyController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _activityController.dispose();
    _whyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Your wall",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: deleteTodos,
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ))
        ],
      ),
      body: AnimatedReorderableGridView(
        padding: const EdgeInsets.all(16),
        items: activities,
        itemBuilder: (BuildContext context, int index) {
          final activity = activities[index];
          return ActivityCard(
            key: ValueKey(activity),
            activity: activity.activity,
            why: activity.why,
            color: Colors.primaries[index % Colors.primaries.length].shade50,
            selected: activity.selected,
            onChanged: (value) => _handleOnChanged(value, activity),
          );
        },
          sliverGridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            final activity = activities.removeAt(oldIndex);
            activities.insert(newIndex, activity);
          });
        },
        enterTransition: [
          SlideInRight(duration: const Duration(seconds: 1)),
          FlipInX(
              begin: 0.8,
              delay: const Duration(seconds: 1),
              duration: const Duration(
                seconds: 3,
              ),
              curve: Curves.bounceInOut)
        ],
        exitTransition: [SlideInLeft()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: _displayDialog,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void _handleOnChanged(bool? value, Activity activity) {
    setState(() {
      activity.selected = !activity.selected;
    });
  }

  void deleteTodos() {
    setState(() {
      activities.removeWhere((activity) => activity.selected);
    });
  }

  void _addTodoItem(Activity activity) {
    setState(() {
      activities.insert(0, activity);
    });
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Add a todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _activityController,
                decoration: const InputDecoration(hintText: 'Type your todo'),
                autofocus: true,
              ),
              TextField(
                controller: _whyController,
                decoration: const InputDecoration(hintText: 'Type your why'),
              ),
            ],
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                final activity = Activity(
                    activity: _activityController.text,
                    why: _whyController.text,
                    selected: false);
                _addTodoItem(activity);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
