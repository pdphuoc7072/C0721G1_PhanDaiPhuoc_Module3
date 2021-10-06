public class Calculator {
    public static double calculate (double firstNumber, double secondNumber, char operator) throws ArithmeticException, UnsupportedOperationException {
        switch (operator) {
            case '+':
                return firstNumber + secondNumber;
            case '-':
                return firstNumber - secondNumber;
            case '*':
                return firstNumber * secondNumber;
            case '/':
                if (secondNumber > 0 || secondNumber < 0) {
                    return firstNumber / secondNumber;
                } else {
                    throw new ArithmeticException("Can't divide by zero");
                }
            default:
                throw new UnsupportedOperationException("Invalid operation");
        }
    }
}
