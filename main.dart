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
        "\n              ---Linear Calculator---              \n              *************************              ");

    String equation, operator;
    int? firstOperand, secondOperand;

    do {
      bool continueSwitch = false;
      int i = 0;
      print(
          "\nPlease Enter your Equation in the Shape a (+,-,*,/) b\n*****************************************************\n");
      equation = stdin.readLineSync().toString();

      equation.runes.forEach((element) {
        i++;

        String value = String.fromCharCode(element);
        if (value == '+' || value == '-' || value == '*' || value == '/') {
          try {
            firstOperand = int.parse(equation.substring(0, i - 1));
            print(firstOperand);
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the First Operand\n");
            continueSwitch = true;
          }

          try {
            secondOperand = int.parse(equation.substring(i));
            print(secondOperand);
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the Second Operand\n");
            continueSwitch = true;
          }

          i = 0;
        } else if (i == equation.length) {
          print("ERROR: Please Enter One of these Operators ( + , - , * , / )");
          continueSwitch = true;
        }
        ;
      });
      if (continueSwitch) continue;
    } while (equation != "0");
  }
}

main() {
  Calculator myCalculator = Calculator();
  myCalculator.printResult();
}
