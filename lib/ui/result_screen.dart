import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/res/strings.dart';


class ResultScreen extends StatefulWidget {
  ResultScreen({Key key, @required this.counter}) : super(key: key);
  final int counter;

  @override
  ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
  @override
  ResultScreen get widget => super.widget;
  var pokemons = {
    0: "Slowpoke",
    1: "Slakoth",
    2: "Gloom",
    3: "Chameleon",
    4: "Raichu",
    5: "Pidgeotto",
  };

  @override
  Widget build(BuildContext context) {
    String pokemon = pokemons[widget.counter % pokemons.length];
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitleString),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultString + pokemon,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textDefaultColor,
                fontSize: 20,
              ),
            ),
            Image.asset('assets/' + pokemon + '.png'),
            Text(
              disclString,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textDefaultColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
