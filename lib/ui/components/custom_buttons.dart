import 'package:flutter/material.dart';
import 'package:flutter_arch/res/colors.dart';

class MegaSimpleCustomButton extends StatelessWidget {
  MegaSimpleCustomButton({@required this.onPressed, this.text});

  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: primaryGreen,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: SizedBox(
          width:  200.0,
          height: 40.0,
          child: Center(
              child: Text(
                text,
                maxLines: 3,
                style: TextStyle(color: textLightColor),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(width: 0)),
    );
  }
}
