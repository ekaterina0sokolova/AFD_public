import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final String textData;
  final Color btnColor;

  QuizWidget({required this.textData, required this.btnColor});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedOverflowBox(
            size: const Size(320, 60),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: widget.btnColor,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.textData,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF234C6D),
                    fontSize: 23,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
