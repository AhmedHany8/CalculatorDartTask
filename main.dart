import 'dart:io';
import 'calculator.dart';

main() {
  calculatorHandler();
}

                                                    //Controller function
void calculatorHandler() {
    print(
        "\n              ---Linear Calculator---              \n              *************************              ");
    Calculator myCalculator = Calculator();
    String equation, operator = '';
    int? firstOperand, secondOperand;

    do {
      bool continueSwitch = false;   //continue the loop outside the for each method becouse it doesn't support the break or continue
      int i = 0;                     //counter for each charcter in the string used in the substring function to split the numbers and the operator
      print(
          "\nPlease Enter your Equation in the Shape a (+,-,*,/) b\n*****************************************************\n");
      equation = stdin.readLineSync().toString();   //assign the user's equation to this variable

      equation.runes.forEach((element) {            //foreach loop to seach for the operator then splits the first and the second operand
        i++;

        String value = String.fromCharCode(element);   // converts the value of the element from ascii code to string
        if (value == '+' || value == '-' || value == '*' || value == '/') {
          try {                                           // handle the wrong entry for first operand
            firstOperand = int.parse(equation.substring(0, i - 1));     
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the First Operand\n");
            continueSwitch = true;
          }

          try {                                            // handle the wrong entry for first operand
            secondOperand = int.parse(equation.substring(i));        
          } catch (e) {
            print(
                "ERROR: Please Enter an Interger Number in the Second Operand\n");
            continueSwitch = true;
          }

          operator = equation.substring(i - 1, i);

          i = 0;                                           // reset the counter to avoid the else if handler below
        } else if (i == equation.length && equation != '0') {                   //handles the non operational equation
          print("ERROR: Please Enter One of these Operators ( + , - , * , / )");
          continueSwitch = true;
        }
        ;
      });

      if (continueSwitch || equation == '0') continue;                          //skip the swich if the foreach method cathes any errors

      switch (operator) {                                                       //calculate and print the operation
        case '+':
          print("\nThe Result is ==> ${myCalculator.addition(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '-':
          print("\nThe Result is ==> ${myCalculator.subtraction(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '*':
          print("\nThe Result is ==> ${myCalculator.multiplication(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
          
          break;
        case '/':
          print("\nThe Result is ==> ${myCalculator.division(
              firstOperand: int.parse(firstOperand.toString()),
              secondOperand: int.parse(secondOperand.toString()))}");
         
          break;

        default:
          print("must be handeled before!");
      }
    } while (equation != "0");                                                  //breakes when the user enter
  }