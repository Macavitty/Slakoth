import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/res/strings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../state.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
          appBar: AppBar(
            title: Text(appTitleString),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  wellDoneString +
                  viewModel.nick + '! ' +
                  resultString + viewModel.pokemons[viewModel.counter % viewModel.pokemons.length],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textDefaultColor,
                    fontSize: 20,
                  ),
                ),
                Image.asset('assets/' + viewModel.pokemons[viewModel.counter % viewModel.pokemons.length] + '.png'),
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
        ),
      );
}

class _ViewModel {
  final String nick;
  final int counter;
  final Map<int, String> pokemons;

  _ViewModel({this.nick, this.counter, this.pokemons});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      nick: store.state.nick,
      counter: store.state.counter,
      pokemons: store.state.pokemons,
    );
  }
}
