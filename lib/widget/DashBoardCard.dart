import 'package:flutter/material.dart';
import 'package:kadamcounter/goal.dart';
import 'package:kadamcounter/widget/imageContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
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
                size: 35,
              )),
          alignment: Alignment.bottomRight,
        ),
        const SizedBox(
          height: 30,
        ),
        SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            // axisLineStyle: AxisLineStyle(color: Colors.white,),
              // minimum: double.parse(steps.toString()),
              // maximum: double.parse(goal.toString()),
          //
          // // [NeedlePointer(value:90, )]
          //
              pointers:  <GaugePointer> [
                RangePointer(
                  value:  59,
                  color: Colors.red,
                  width: 25,
                  enableAnimation: true,
                ),
              ],

              ranges: <GaugeRange>[
                GaugeRange(
                    startValue:0,
                    endValue: double.parse(widget.goal.toString()),
                    color: const Color(0XFFF38064C),
                    startWidth: 25,
                    endWidth: 25)
              ],
              showLabels: false,
              showTicks: false,

              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Goal :${widget.goal.toString()}",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(widget.steps.toString(),
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 80,
                            )),
                      ],
                    )),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageContainer(
                "assets/locations.png", widget.miles.toStringAsFixed(3), "Miles"),
            imageContainer(
                "assets/fire.png", widget.calories.toStringAsFixed(3), "Calories"),
            imageContainer(
                "assets/time.png", widget.duration.toStringAsFixed(3), "Duration"),
          ],
        ),
      ],
    );
  }
}
