import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap,this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: KBottomContainerColors,
        width: double.infinity,
        margin: EdgeInsets.only(top: KBottomContainerHeight),
        padding: EdgeInsets.only(bottom: 20.0),
        height: 80.0,
        child: Center(
          child: Text(
            buttonTitle,

            style: KResultButtom,
          ),
        ),
      ),
    );
  }
}