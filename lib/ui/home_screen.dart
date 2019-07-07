import 'package:flutter/material.dart';
import 'package:flutter_arch/actions/actions.dart';
import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/res/strings.dart';
import 'package:flutter_arch/ui/result_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../state.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) =>
            Scaffold(
              appBar: AppBar(
                title: Text(appTitleString),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      welcomeString + viewModel.nick + '!\n' +
                          ruleString + viewModel.counter.toString(),
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
                          /* in some examples you may find smth like this:
                          * onPressed: viewModel.increment(),
                          * don`t do this - increment would be called each second
                          * */
                          onPressed:  () => viewModel.increment(),
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
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen()));
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
            ),
      );
}

class _ViewModel {
  final String nick;
  final int counter;
  final Function() increment;

  _ViewModel({this.nick, this.counter, this.increment});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      nick: store.state.nick,
      counter: store.state.counter,
      increment: () => store.dispatch(IncrementCounterAction()),
    );
  }
}

