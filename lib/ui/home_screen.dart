import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/res/strings.dart';
import 'package:flutter_arch/ui/result_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';


class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitleString),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ruleString + _counter.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textDefaultColor,
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "incr_btn",
                  onPressed: _incrementCounter,
                  backgroundColor: primaryGreen,
                  child: Icon(
                    Icons.add,
                    color: textLightColor,
                  ),
                ),
                FloatingActionButton(
                  heroTag: "get_btn",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultScreen(counter: _counter)));
                  },
                  backgroundColor: primaryGreen,
                  child: Text(getBtnString,
                      style: TextStyle(color: textLightColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}