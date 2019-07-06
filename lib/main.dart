import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_arch/res/colors.dart';
import 'package:flutter_arch/state.dart';
import 'package:flutter_arch/ui/start_screen.dart';
import 'package:flutter_arch/reducers/reducers.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) => StoreProvider (
    store: this.store,
    child: MaterialApp(
      theme: new ThemeData(
        brightness: brightness,
        primaryColor: primaryGreen,
        accentColor: accentColor,
      ),
      home: StartScreen()
    ),
  );
}
