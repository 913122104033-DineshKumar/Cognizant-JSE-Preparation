package utils;
import java.util.Scanner;

public class Task1to5 {

    private static Scanner scanner;

    public static void main (String[] args) {
        scanner = new Scanner(System.in);
        // Task 2 simpleCalculator();
        // Task 3 oddOrEven();
        // Task 4 leapYear();
        // Task 5 multiplicationTable();
        scanner.close();
    }

    public static void simpleCalculator () {
        int a = scanner.nextInt();
        int b = scanner.nextInt();
        System.out.println("Option 1 for Addition");
        System.out.println("Option 2 for Subtraction");
        System.out.println("Option 3 for Multiplication");
        System.out.println("Option 4 for Division");
        System.out.println("Enter the Option: ");
        int option = scanner.nextInt();
        switch (option) {
            case 1:
                System.out.println("Result: " + (a + b));
                break;
            case 2:
                System.out.println("Result: " + (a - b));
                break;
            case 3:
                System.out.println("Result: " + (a * b));
                break;
            case 4:
                System.out.println("Result: " + (a / b));
                break;
            default:
                System.out.println("Invalid input");
                break;
        }
    }

    private static void oddOrEven () {
        System.out.println("Enter a number: ");
        int num = scanner.nextInt();
        System.out.println(num % 2 == 0 ? "Even" : "Odd");
    }

    private static void leapYear () {
        System.out.println("Enter a year: ");
        int year = scanner.nextInt();
        System.out.println(((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) ? "Leap year" : "Not a leap year");
    }

    private static void multiplicationTable () {
        int num = scanner.nextInt();
        for (int i = 1; i <= 10; i++) {
            System.out.println(num + " * " + i + " = " + num * i);
        }
    }

}
