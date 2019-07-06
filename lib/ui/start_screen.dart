import 'package:flutter/material.dart';
import 'package:flutter_arch/res/strings.dart';
import 'package:toast/toast.dart';

import 'components/custom_buttons.dart';
import 'components/custom_fields.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {

  TextEditingController controller = TextEditingController();

  void nickController(BuildContext context) {
    String s = controller.text;
    if (s != "") {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else {
      Toast.show(emptyNickToastString, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitleString)),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomInputField(hint: nickHintString, controller: controller,),
              MegaSimpleCustomButton(
                  onPressed: () {
                    nickController(context);},
                  text: nickBtnString),
            ],
          ),
        ),
      ),
    );
  }
}
