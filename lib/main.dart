import 'package:flutter/material.dart';
import 'dart:math' as math;

const double defaultAngle = math.pi / 4;
enum Step { first, second, third, fourth, fifth, sixth, seventh, eighth, ninth }
final Map<Step, double> _stepAngles = {
  Step.first: -defaultAngle,
  Step.second: -defaultAngle + (1 / 8).toDouble() * math.pi / 2,
  Step.third: -defaultAngle + (2 / 8).toDouble() * math.pi / 2,
  Step.fourth: -defaultAngle + (3 / 8).toDouble() * math.pi / 2,
  Step.fifth: -defaultAngle + (4 / 8).toDouble() * math.pi / 2,
  Step.sixth: -defaultAngle + (5 / 8).toDouble() * math.pi / 2,
  Step.seventh: -defaultAngle + (6 / 8).toDouble() * math.pi / 2,
  Step.eighth: -defaultAngle + (7 / 8).toDouble() * math.pi / 2,
  Step.ninth: -defaultAngle + (8 / 8).toDouble() * math.pi / 2,
};
void main() => runApp(MyApp());

class IndicatorIcon extends StatelessWidget {
  final Step step;
  IndicatorIcon(this.step, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget rotatedIndicator = Padding(
      child: Transform.rotate(
        alignment: Alignment.bottomCenter,
        angle: _stepAngles[step],
        child: Padding(
          padding: EdgeInsets.only(bottom: 270.0 / 2),
          //This padding is applied before transform, so no angle is under consideration
          child: Indicator(),
        ),
      ),
      padding: EdgeInsets.only(bottom: 270.0 / 2),
      //This padding is applied after transform so the padding added on the direction of the angle
    );
    return rotatedIndicator;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Little running man",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            _buildCircle(),
            IndicatorIcon(Step.first),
            IndicatorIcon(Step.second),
            IndicatorIcon(Step.third),
            IndicatorIcon(Step.fourth),
            IndicatorIcon(Step.fifth),
            IndicatorIcon(Step.sixth),
            IndicatorIcon(Step.seventh),
            IndicatorIcon(Step.eighth),
            IndicatorIcon(Step.ninth),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      height: 270,
      width: 270,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildLittleMan() {
    return Container();
  }
}

class Indicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 3.0,
      color: Colors.red,
    );
  }
}
