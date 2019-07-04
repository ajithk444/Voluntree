import 'package:call_for_code_2019/resources/themes/ColorsManager.dart';
import 'package:flutter/material.dart';

class StepperForm extends StatefulWidget {
  final int number;
  void Function(int number) onCounterChanged;

  StepperForm(this.number, this.onCounterChanged);

  @override
  State<StatefulWidget> createState() => StepperFormState();
}

class StepperFormState extends State<StepperForm> {
  int counter;
  @override
  void initState() {
    counter = widget.number;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onPressedRemoveButton,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: ColorsManager.lightBlue,
                  borderRadius: BorderRadius.circular(3)),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(counter.toString()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onPressedAddButton,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: ColorsManager.lightBlue,
                  borderRadius: BorderRadius.circular(3)),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onPressedAddButton() {
    setState(() {
      if (counter < 10) {
        counter++;
        widget.onCounterChanged(counter);
      }
    });
  }

  void onPressedRemoveButton() {
    setState(() {
      if (counter > 1) {
        counter--;
      }
      widget.onCounterChanged(counter);
    });
  }
}
