import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kadamcounter/widget/DashBoardCard.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  var currDt = DateTime.now();
  int day = 0;
  double previousDistacne = 0.0;
  double distance = 0.0;
  var goal = 100;

  void setSteps() async {
    int d = currDt.day;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('steps', steps);
    await prefs.setInt('day', d);
    print(steps);
  }

  Future<int?> gettingSteps() async {
    final prefs = await SharedPreferences.getInstance();
    int? steps = prefs.getInt('steps');
    return steps;
  }

  Future<int?> gettingday() async {
    final prefs = await SharedPreferences.getInstance();
    int? day = prefs.getInt('day');
    return day;
  }

  void getSteps() async {
    day = (await gettingday())!;
    if (day != currDt.day) {
      final prefs = await SharedPreferences.getInstance();
      final success = await prefs.remove('steps');
    } else {
      steps = (await gettingSteps())!;
    }
  }

  Future<int?> gettingGoal() async {
    final prefs = await SharedPreferences.getInstance();
    int? goal = prefs.getInt('goal');
    return goal;
  }

  void getGoal() async {
    goal = (await gettingGoal())!;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getSteps();
    getGoal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Kadam Counter',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff111328),
      ),
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapShort) {
          if (snapShort.hasData) {
            x = snapShort.data!.x;
            y = snapShort.data!.y;
            z = snapShort.data!.z;
            distance = getValue(x, y, z);
            if (distance > 11) {
              steps++;
              setSteps();
            }
            calories = calculateCalories(steps);
            duration = calculateDuration(steps);
            miles = calculateMiles(steps);
          }
          return Container(
            color: Color(0xff111328),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: dashboardCard(steps, miles, calories, duration, goal),
          );
        },
      ),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}
