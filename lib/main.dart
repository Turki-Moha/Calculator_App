import 'package:calculator/widgets/calc_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int fNum, sNum;
  late String history = '';
  late String textDisplay = '';
  late String result;
  late String opreation;

  void onClick(String btnVal) {
    try {
      if (btnVal == 'C') {
        textDisplay = '';
        fNum = 0;
        sNum = 0;
        result = '';
      } else if (btnVal == 'AC') {
        textDisplay = '';
        fNum = 0;
        sNum = 0;
        result = '';
        history = '';
      } else if (btnVal == '+/-') {
        if (textDisplay[0] != '-') {
          result = '-' + textDisplay;
        } else {
          result = textDisplay.substring(1);
        }
      } else if (btnVal == '<') {
        result = textDisplay.substring(0, textDisplay.length - 1);
      } else if (btnVal == '+' ||
          btnVal == '-' ||
          btnVal == 'X' ||
          btnVal == '÷') {
        fNum = int.parse(textDisplay);
        result = '';
        opreation = btnVal;
      } else if (btnVal == '=') {
        sNum = int.parse(textDisplay);
        if (opreation == '+') {
          result = (fNum + sNum).toString();
          history = fNum.toString() + opreation.toString() + sNum.toString();
        }
        if (opreation == '-') {
          result = (fNum - sNum).toString();
          history = fNum.toString() + opreation.toString() + sNum.toString();
        }
        if (opreation == '÷') {
          result = (fNum / sNum).toString();
          history = fNum.toString() + opreation.toString() + sNum.toString();
        }
        if (opreation == 'X') {
          result = (fNum * sNum).toString();
          history = fNum.toString() + opreation.toString() + sNum.toString();
        }
      } else {
        result = int.parse(textDisplay + btnVal).toString();
      }
      setState(() {
        textDisplay = result;
      });
    } catch (FormatException) {
      print(FormatException);
    } catch (RangeError) {
      print(RangeError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            //systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: const Text(
            'Flutter calculator',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xF000000),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(125, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1, 1),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    textDisplay,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: 0xFFD4D4D2,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: 'C',
                    fillColor: 0xFFD4D4D2,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '<',
                    fillColor: 0xFFD4D4D2,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '÷',
                    fillColor: 0xFFFF9500,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '8',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '9',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: 'X',
                    fillColor: 0xFFFF9500,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '4',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '5',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '6',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '-',
                    fillColor: 0xFFFF9500,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '1',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '2',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '3',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '+',
                    fillColor: 0xFFFF9500,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    fillColor: 0xFFD4D4D2,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '0',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '00',
                    fillColor: 0xFF505050,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                  CalculatorButton(
                    text: '=',
                    fillColor: 0xFFFF9500,
                    textColor: 0xFFFFFFFF,
                    textSize: 20,
                    callBack: onClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
