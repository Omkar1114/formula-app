import 'package:flutter/material.dart';

import '../widgets/calculate_button.dart';
import '../widgets/input_field_widget.dart';
import '../widgets/output_result_widget.dart';

class PouringTimeScreen extends StatefulWidget {
  static const routeName = '/pouring-screen';

  @override
  _PouringTimeScreenState createState() => _PouringTimeScreenState();
}

class _PouringTimeScreenState extends State<PouringTimeScreen> {
  final _stdPouringTimeController = TextEditingController();
  final _gratingFactorController = TextEditingController();
  final _weightController = TextEditingController();
  double _pouringTime = 0;

  void _calculateData() {
    if(_stdPouringTimeController.text.isEmpty || _gratingFactorController.text.isEmpty || _weightController.text.isEmpty) {
      return;
    }

    final enteredStdPouringTime = double.parse(_stdPouringTimeController.text);
    final enteredGratingFactor = double.parse(_gratingFactorController.text);
    final enteredWeight = double.parse(_weightController.text);

    if(enteredStdPouringTime.isNegative || enteredGratingFactor.isNegative || enteredWeight.isNegative) {
      return;
    }

    setState(() {
     _pouringTime = enteredGratingFactor * enteredWeight / enteredStdPouringTime; 
    });

    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Color>;
    //final Color _color1 = routeArgs['color1'];
    final Color _color2 = routeArgs['color2'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pouring Time'),
        backgroundColor: _color2,
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          InputFieldWidget(
            'Std Pouring Time(usually 0.25-0.3 kg/sec)',
            _color2,
            _stdPouringTimeController,
            _calculateData,
          ),
          SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            'Grating Factor(usually 2.5)',
            _color2,
            _gratingFactorController,
            _calculateData,
          ),
          SizedBox(
            height: 20,
          ),
          InputFieldWidget(
            'Casting Weight(Kg)',
            _color2,
            _weightController,
            _calculateData,
          ),
          SizedBox(
            height: 20,
          ),
          CalculateButton(
            _color2,
            _calculateData,
          ),
          SizedBox(
            height: 20,
          ),
          OutputResultWidget(
            'Pouring Time',
            _pouringTime,
            'sec',
          ),
        ],
      ),
    );
  }
}
