import 'package:flutter/material.dart';
import 'package:flutter_arch/actions/actions.dart';
import 'package:flutter_arch/res/strings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

import '../state.dart';
import 'components/custom_buttons.dart';
import 'components/custom_fields.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  TextEditingController controller;

  // TODO convert to middleware
  bool nickController(BuildContext context) {
    String s = controller.text;
    if (s != "") return true;
    return false;
  }

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
          appBar: AppBar(title: const Text(appTitleString)),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomInputField(
                    hint: nickHintString,
                    controller: controller = TextEditingController(text: viewModel.nick),
                  ),
                  MegaSimpleCustomButton(
                      onPressed: () {
                        if (nickController(context)) {
                          viewModel.updNick(controller.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                        else Toast.show(emptyNickToastString, context);
                      },
                      text: nickBtnString),
                ],
              ),
            ),
          ),
        ),
      );
}

class _ViewModel {
  final String nick;
  final Function(String) updNick;

  _ViewModel({this.nick, this.updNick});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      nick: store.state.nick,
      updNick: (nick) => store.dispatch(UpdNickAction(nick)),
    );
  }
}
