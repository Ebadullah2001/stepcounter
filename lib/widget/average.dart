import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kadamcounter/widget/dayCount.dart';
import 'package:kadamcounter/widget/textWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dailyAverage extends StatefulWidget {
  dailyAverage(
      {required this.steps, required this.goal, required this.dateFormat});

  int steps;
  int goal;
  String dateFormat;

  @override
  State<dailyAverage> createState() => _dailyAverageState();
}

class _dailyAverageState extends State<dailyAverage> {
  var day = "";
  double Monday = 0;
  double Tuesday = 0;
  double Wednesday = 0;
  double Thursday = 0;
  double Friday = 0;
  double Satday = 0;
  double Sunday = 0;

  void setstepsforday(double v) async {
    final prefs = await SharedPreferences.getInstance();
    // dateFormat = DateFormat('EEEE').format(currDt);
    if (widget.dateFormat == "Monday") {
      await prefs.setDouble('Monday', v);
    } else if (widget.dateFormat == "Tuesday") {
      await prefs.setDouble('Tuesday', v);
    } else if (widget.dateFormat == "Wednesday") {
      await prefs.setDouble('Wednesday', v);
    } else if (widget.dateFormat == "Thursday") {
      await prefs.setDouble('Thursday', v);
    } else if (widget.dateFormat == "Friday") {
      await prefs.setDouble('Friday', v);
    } else if (widget.dateFormat == "Saturday") {
      await prefs.setDouble('Saturday', v);
    } else if (widget.dateFormat == "Sunday") {
      await prefs.setDouble('Sunday', v);
    }
  }

  double getvalue() {
    double v = widget.steps / widget.goal;
    setstepsforday(v);
    return v;
  }

  Future<List?> gettingdays() async {
    print("inmnnnnnnnnnnnnn");
    final prefs = await SharedPreferences.getInstance();
    final days = List.filled(7, null, growable: false);

    days[0] = prefs.getDouble('Monday') as Null;
    days[1] = prefs.getDouble('Tuesday') as Null;
    days[2] = prefs.getDouble('Wednesday') as Null;
    days[3] = prefs.getDouble('Thursday') as Null;
    days[4] = prefs.getDouble('Friday') as Null;
    days[5] = prefs.getDouble('Saturday') as Null;
    days[6] = prefs.getDouble('Sunday') as Null;

    // if (abc == "Monday") {
    // double? m = prefs.getDouble('Monday');
    // print(m);
    // return m;
    //
    //
    // } else if (abc == "Tuesday") {
    //   double? m = prefs.getDouble('Tuesday');
    //   print(m);
    //   return m;
    // } else if (abc == "Wednesday") {
    //   double? m = prefs.getDouble('Wednesday');
    //   print(m);
    //   return m;
    // } else if (abc == "Thursday") {
    //   double? m = prefs.getDouble('Thursday');
    //   print(m);
    //   return m;
    // } else if (abc == "Friday") {
    //   double? m = prefs.getDouble('Friday');
    //   print(m);
    //   return m;
    // } else if (abc == "Saturday") {
    //   double? m = prefs.getDouble('Saturday');
    //   print(m);
    //   return m;
    // } else if (abc == "Sunday") {
    //   double? m = prefs.getDouble('Sunday');
    //   print(m);
    //   return m;
    // }
    print("every thing getssssssssss..");
    return days;
  }

  void getdays() async {
    print("in gettings............");
    List a = (await gettingdays())!;
    print("return daysssssssssssssss");
    Monday = a[0];
    Tuesday = a[1];
    Wednesday = a[2];
    Thursday = a[3];
    Friday = a[4];
    Satday = a[5];
    Sunday = a[6];

    print("getdays....");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdays();
    print("init..");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0XFFF38064B),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              print(Friday);
              print(Thursday);
            }, child: Text("pressed")),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: text("Daily average :")),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  circularDay(
                      "S",
                      widget.dateFormat == "Sunday" ? getvalue() : Sunday,
                      Colors.red),
                  circularDay(
                      "M",
                      widget.dateFormat == "Monday" ? getvalue() : Monday,
                      Colors.cyan),
                  circularDay(
                      "TU",
                      widget.dateFormat == "Tuesday" ? getvalue() : Tuesday,
                      Colors.teal),
                  circularDay(
                      "W",
                      widget.dateFormat == "Wednesday" ? getvalue() : Wednesday,
                      Colors.amber),
                  circularDay(
                      "TH",
                      widget.dateFormat != "Thursday" ? Thursday : getvalue(),
                      Colors.green),
                  circularDay(
                      "FRI",
                      widget.dateFormat == "Friday" ? getvalue() : Friday,
                      Colors.indigo),
                  circularDay(
                      "SAT",
                      widget.dateFormat == "Saturday" ? getvalue() : Satday,
                      Colors.purple),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
