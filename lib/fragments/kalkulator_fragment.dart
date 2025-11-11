// lib/fragments/kalkulator_fragment.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/foundation.dart';

String _evaluateInIsolate(String expr) {
  try {
    Parser p = Parser();
    Expression exp = p.parse(expr);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    if (eval == eval.roundToDouble()) return eval.toInt().toString();
    return eval.toString();
  } catch (e) {
    debugPrint('Error evaluating: $e');
    return "Error";
  }
}


class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String equation = "0";
  String result = "0";
  bool _isComputing = false; 

  final int _maxExpressionLength = 80; 

  final List<String> buttons = [
    'C', 'x²', '√', '÷',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '⌫', '=',
  ];

  String _sanitize(String raw) {
    String out = raw.replaceAll('x', '*').replaceAll('÷', '/');
    out = out.replaceAll(' ', '');
    while (out.isNotEmpty && '+-*/^'.contains(out[out.length - 1])) {
      out = out.substring(0, out.length - 1);
    }
    return out;
  }

  Future<void> _onEqualPressed() async {
    if (_isComputing) return; 

    setState(() => _isComputing = true);

    String sanitized = _sanitize(equation);

    if (sanitized.isEmpty || sanitized == "0") {
      setState(() {
        _isComputing = false;
        result = "0";
      });
      return;
    }
    
    if (sanitized.length > _maxExpressionLength) {
      setState(() {
        result = "Error (too long)";
        _isComputing = false;
      });
      return;
    }

    final String evalResult = await compute(_evaluateInIsolate, sanitized);

    setState(() {
      result = evalResult;
      _isComputing = false;
    });
  }

  void buttonPressed(String buttonText) {
    debugPrint('[calc] pressed: $buttonText');

    String newEquation = equation;
    String newResult = result;

    if (buttonText == "C") {
      newEquation = "0";
      newResult = "0";
    } else if (buttonText == "⌫") {
      if (newEquation.length > 1) {
        newEquation = newEquation.substring(0, newEquation.length - 1);
      } else {
        newEquation = "0";
      }
    } else if (buttonText == "=") {
      _onEqualPressed();
      return; 
    } else if (buttonText == "x²") {
      if (newEquation != "0") newEquation = '($newEquation)^2';
    } else if (buttonText == "√") {
      if (newEquation != "0") newEquation = 'sqrt($newEquation)';
    } else {
      if (newEquation == "0" && buttonText != ".") {
        newEquation = buttonText;
      } else {
        if (newEquation.length < _maxExpressionLength) {
          newEquation = newEquation + buttonText;
        }
      }
    }

    setState(() {
      equation = newEquation;
      result = newResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // === LAYAR DISPLAY KALKULATOR ===
        Expanded(
          flex: 2, 
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomRight,
            child: Text(
              equation,
              style: const TextStyle(
                fontSize: 42, 
                color: Colors.black54,
              ),
              maxLines: 2, 
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.topRight,
            child: _isComputing 
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24, 
                        height: 24, 
                        child: CircularProgressIndicator(
                          strokeWidth: 3, 
                          color: Colors.pink[300]
                        )
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Menghitung...', 
                        style: TextStyle(
                          fontSize: 22, 
                          color: Colors.pink[300]
                        )
                      ),
                    ],
                  )
                : Text( 
                    result,
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE91E63), 
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ),

        const Divider(color: Colors.pinkAccent, height: 4, indent: 20, endIndent: 20,),

        // === TOMBOL-TOMBOL ===
        Expanded(
          flex: 5, 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, 
                childAspectRatio: 1.25, 
              ),
              itemBuilder: (BuildContext context, int index) {
                return MyButton(
                  buttonText: buttons[index],
                  onPressed: () {
                    buttonPressed(buttons[index]);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// === WIDGET TOMBOL KUSTOM (BIAR CANTIK) ===
class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.buttonText, required this.onPressed});

  bool isOperator(String x) => x == '÷' || x == 'x' || x == '-' || x == '+' || x == '=';
  bool isFunction(String x) => x == 'C' || x == 'x²' || x == '√' || x == '⌫';

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color textColor = Colors.white;

    if (isOperator(buttonText)) {
      buttonColor = const Color(0xFFF48FB1);
    } else if (isFunction(buttonText)) {
      buttonColor = const Color(0xFFF8BBD0);
      textColor = Colors.black54;
    } else {
      buttonColor = Colors.white;
      textColor = Colors.black87;
    }
    if (buttonText == '=') {
      buttonColor = const Color(0xFFE91E63);
      textColor = Colors.white;
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
        ),
        child: Text(
          buttonText, 
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}