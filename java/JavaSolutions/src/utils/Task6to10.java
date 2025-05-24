package utils;

import java.util.Scanner;
import java.util.Random;

public class Task6to10 {
    private static Scanner sc;

    public static void main(String[] args) {
        sc = new Scanner(System.in);

        // Uncomment to run a specific task:
        // dataTypeDemo();
        // typeCastingExample();
        // operatorPrecedence();
        // gradeCalculator();
        // numberGuessingGame();

        sc.close();
    }

    // Task 6: Data Type Demonstration
    public static void dataTypeDemo() {
        int num = 25;
        float pi = 3.14f;
        double gpa = 9.75;
        char grade = 'A';
        boolean isPassed = true;

        System.out.println("Integer: " + num);
        System.out.println("Float: " + pi);
        System.out.println("Double: " + gpa);
        System.out.println("Char: " + grade);
        System.out.println("Boolean: " + isPassed);
    }

    // Task 7: Type Casting Example
    public static void typeCastingExample() {
        double d = 9.85;
        int i = (int) d; // explicit casting
        System.out.println("Double to Int: " + i);

        int x = 20;
        double y = x; // implicit casting
        System.out.println("Int to Double: " + y);
    }

    // Task 8: Operator Precedence
    public static void operatorPrecedence() {
        int result1 = 10 + 5 * 2;
        int result2 = (10 + 5) * 2;
        int result3 = 100 / 10 + 5 * 2;

        System.out.println("10 + 5 * 2 = " + result1 + " (Multiplication before addition)");
        System.out.println("(10 + 5) * 2 = " + result2 + " (Parentheses first)");
        System.out.println("100 / 10 + 5 * 2 = " + result3 + " (Division and multiplication first, then addition)");
    }

    // Task 9: Grade Calculator
    public static void gradeCalculator() {
        System.out.print("Enter marks out of 100: ");
        int marks = sc.nextInt();

        if (marks >= 90 && marks <= 100)
            System.out.println("Grade: A");
        else if (marks >= 80)
            System.out.println("Grade: B");
        else if (marks >= 70)
            System.out.println("Grade: C");
        else if (marks >= 60)
            System.out.println("Grade: D");
        else
            System.out.println("Grade: F");
    }

    // Task 10: Number Guessing Game
    public static void numberGuessingGame() {
        Random rand = new Random();
        int numberToGuess = rand.nextInt(100) + 1;
        int guess = -1;

        System.out.println("Guess a number between 1 and 100:");

        while (guess != numberToGuess) {
            guess = sc.nextInt();
            if (guess < numberToGuess)
                System.out.println("Too low! Try again:");
            else if (guess > numberToGuess)
                System.out.println("Too high! Try again:");
            else
                System.out.println("Correct! You guessed the number.");
        }
    }
}