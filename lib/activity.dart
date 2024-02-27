

class Activity {
  final String activity;
  final String why;
  bool selected;

  Activity({required this.activity, required this.why,required this.selected});
  static List<Activity> activities = [
    Activity(
        activity: "Wake up routine",
        why:
        "I want to complete important tasks and plan my day with a clear mind",selected: false),
    Activity(
        activity: "Better sleep",
        why: "I want to regulate my body's internal clock",selected: false),
    Activity(
        activity: "Running",
        why:
        "I want to maintain regular running routine to support weight loss.",selected: false),
    Activity(activity: "Aerobics", why: "I want to run a 5K without stopping",selected: false),
    Activity(
        activity: "Gym",
        why: "I want to achieve weight loss and transform my body",selected: false),
    Activity(
        activity: "Learn new things",
        why: "I want to maintain my learning habits",selected: false),
    Activity(
        activity: "No smoking",
        why:
        "My goal is to lead a smoke free life and reduce the risks of smoking related illness",selected: false),
    Activity(
        activity: "Spend time with nature",
        why:
        "I want to give myself a peaceful nature retreat at least once a week",selected: false)
  ];


}

