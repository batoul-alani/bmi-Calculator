import 'package:bmi_calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottombutton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultName,@required this.result,@required this.advice});
  final String resultName;
  final String result;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
              'Your Result:',
                style: KStyleNumber,
            ),
          ),
          ), //your result
          Expanded(
            flex: 5,
            child:ReusableCard(
              colour: KActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //CalculateBrain().getResult().toUpperCase(),
                    resultName.toUpperCase(),
                    style: TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //CalculateBrain().getInterpretation(),
                      advice,
                      style: TextStyle(
                        fontSize: 22.0
                      ),
                      textAlign: TextAlign.center,
                  ),

                ],
              ),
              ),



          ),
          BottomButton(
            buttonTitle: 'RE-Calculate',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
