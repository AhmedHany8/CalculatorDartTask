import 'dart:io';

class Calculator {
  int addition({int firstOperand: 0, int secondOperand: 0}) =>
      firstOperand + secondOperand;

  int subtraction({int firstOperand: 0, int secondOperand: 0}) =>
      firstOperand - secondOperand;

  int multiplication({int firstOperand: 0, int secondOperand: 0}) =>
      firstOperand * secondOperand;

  int division({int firstOperand: 0, int secondOperand: 0}) =>
      firstOperand ~/ secondOperand;

  printResult() {
    print(
          "\nLinear Calculator\n");

    String equation, operator;
    int? firstOperand, secondOperand;
    int i = 0;
    do {
      print(
          "\nPlease Enter your Equation in the Shape a (+,-,*,/) b\n*****************************************************\n");
      equation = stdin.readLineSync().toString();

      equation.runes.forEach((element) {
        i++;
        String value = String.fromCharCode(element);
        if (value == '+' || value == '-' || value == '*' || value == '/') {
          try {
            firstOperand = int.parse(equation.substring(0, i - 1));
          } catch (e) {
            print(
                "Please Enter an Interger Number\n                  *******************************");
          }
        }
        ;
      });
    } while (equation != "0");
  }
}

main() {
  Calculator myCalculator = Calculator();
  myCalculator.printResult();
}
