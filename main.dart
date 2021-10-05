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

  void printResult() {
    print(
        "\n              ---Linear Calculator---              \n              *************************              ");

    String equation, operator = '';
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
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the First Operand\n");
            continueSwitch = true;
          }

          try {
            secondOperand = int.parse(equation.substring(i));
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the Second Operand\n");
            continueSwitch = true;
          }

          operator = equation.substring(i - 1, i);

          i = 0;
        } else if (i == equation.length && equation != '0') {
          print("ERROR: Please Enter One of these Operators ( + , - , * , / )");
          continueSwitch = true;
        }
        ;
      });

      if (continueSwitch || equation == '0') continue;

      switch (operator) {
        case '+':
          print("\nThe Result is ==> ${addition(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '-':
          print("\nThe Result is ==> ${subtraction(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '*':
          print("\nThe Result is ==> ${multiplication(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '/':
          print("\nThe Result is ==> ${division(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
         
          break;

        default:
          print("must be handeled before!");
      }
    } while (equation != "0");
  }
}

main() {
  Calculator myCalculator = Calculator();
  myCalculator.printResult();
}
