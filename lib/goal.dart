import 'package:flutter/material.dart';
import 'package:kadamcounter/dahboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  int goal = 0;

  void setGoal() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('goal', goal);
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
        backgroundColor: const Color(0xff111328),
      ),
      body: Container(
        color: const Color(0xff111328),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                onChanged: (value) {
                  goal = int.parse(value);
                  setGoal();
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Please enter your today goal steps... ",
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.90,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.width * 0.13,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {
                            if (goal <= 90000) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dashboard()),
                              );

                              // Navigator.pop(context);

                            } else {
                              print("set step under not more than 90000");
                            }
                          },
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
