import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'bottombutton.dart';
import 'calculate_brain.dart';

enum GendorEnum{
  Male,
  Famele,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GendorEnum SelectedGender;
  int height=180;
  int weight=25;
  int age=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(

            // The First Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(

                  child: Row(
                  children: <Widget>[

                    //Male Expended
                    Expanded(
                      child: ReusableCard(
                        onPressed: (){
                          setState(() {
                            SelectedGender=GendorEnum.Male;
                          });
                        },
                      colour: SelectedGender==GendorEnum.Male?KActiveCardColour:KInActiveCardColor,
                      cardChild: IconContent(icone: FontAwesomeIcons.mars,label: 'MALE',),
                    ),
                    ),

                    //Female Expanded

                    Expanded(
                      child: ReusableCard(
                        onPressed: (){
                          setState(() {
                            SelectedGender=GendorEnum.Famele;
                          });
                        },
                      colour: SelectedGender==GendorEnum.Famele?KActiveCardColour:KInActiveCardColor,
                      cardChild: IconContent(icone: FontAwesomeIcons.venus , label: 'FAMELE',),
                    ),),
                  ],
                ),),
              ],
            ),
          ),

        Expanded(

          //the second row

          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: KActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: KStyleNumber,
                          ),
                          Text(
                            'cm',
                            style: KLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: KBottomContainerColors,
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),

                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height=newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                ),

              ),
            ],
          ),
        ),

          // the third row

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KStyleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                              inOrde: (){
                                  setState(() {
                                    weight=weight-1;
                                  });
                              },


                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              inOrde: (){
                                setState(() {
                                  weight=weight+1;
                                });
                              },
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KStyleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              inOrde: (){
                                setState(() {
                                  age=age-1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              inOrde: (){
                                setState(() {
                                  age=age+1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //the result row

          BottomButton(
            buttonTitle: 'Calculate',
            onTap: (){
              setState(() {
                CalculateBrain calc=CalculateBrain(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    //resultName: calc.getResult(),
                    result: calc.calculateBMI(),
                    advice: calc.getInterpretation(),
                    resultName: calc.getResult(),
                  ),),);
              });

            },
          ),
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.inOrde});
  final IconData icon;
  final Function inOrde;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: inOrde,
      child: Icon(icon),
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),

    );
  }
}
