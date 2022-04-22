import 'package:flutter/material.dart';
import 'package:kadamcounter/goal.dart';
import 'package:kadamcounter/widget/imageContainer.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class dashboardCard extends StatefulWidget {
  int steps;
  int goal;
  double miles, calories, duration;

  dashboardCard(this.steps, this.miles, this.calories, this.duration, this.goal,
      {Key? key})
      : super(key: key);

  @override
  State<dashboardCard> createState() => _dashboardCardState();
}

class _dashboardCardState extends State<dashboardCard> {
  double getvalue() {
    double v = widget.steps / widget.goal;
    return v;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height*0.45,
      decoration: BoxDecoration(
        color: Color(0XFFF38064C),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
              alignment: Alignment.bottomLeft,
              child: Text(widget.steps.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 80))),
          Row(
            children: [
              Text(
                "Goal: ${widget.goal.toString()}",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Goal()),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 25,
                    )),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: LinearPercentIndicator(
              percent: getvalue(),
              progressColor: Colors.red,
              lineHeight: 20,
              animation: true,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              imageContainer("assets/locations.png",
                  widget.miles.toStringAsFixed(3), "Miles"),
              imageContainer("assets/fire.png",
                  widget.calories.toStringAsFixed(3), "Calories"),
              imageContainer("assets/time.png",
                  widget.duration.toStringAsFixed(3), "Duration"),
            ],
          ),
        ],
      ),
    );
  }
}
