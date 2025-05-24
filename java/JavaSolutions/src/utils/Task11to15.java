package utils;

import java.util.Scanner;

public class Task11to15 {
    private static Scanner sc;

    public static void main(String[] args) {
        sc = new Scanner(System.in);
        // Uncomment the method you want to run:
        // factorialCalculator();
        // methodOverloadingDemo();
        // recursiveFibonacci();
        // arraySumAverage();
        // reverseString();
        sc.close();
    }

    // Task 11: Factorial Calculator
    public static void factorialCalculator() {
        System.out.println("Enter a non-negative integer:");
        int num = sc.nextInt();
        long factorial = 1;

        for (int i = 1; i <= num; i++) {
            factorial *= i;
        }

        System.out.println("Factorial of " + num + " is: " + factorial);
    }

    // Task 12: Method Overloading
    public static void methodOverloadingDemo() {
        System.out.println("Add(int, int): " + add(10, 20));
        System.out.println("Add(double, double): " + add(3.5, 4.5));
        System.out.println("Add(int, int, int): " + add(5, 10, 15));
    }

    public static int add(int a, int b) {
        return a + b;
    }

    public static double add(double a, double b) {
        return a + b;
    }

    public static int add(int a, int b, int c) {
        return a + b + c;
    }

    // Task 13: Recursive Fibonacci
    public static void recursiveFibonacci() {
        System.out.println("Enter a positive integer n:");
        int n = sc.nextInt();
        System.out.println("Fibonacci number at position " + n + " is: " + fibonacci(n));
    }

    public static int fibonacci(int n) {
        if (n <= 1)
            return n;
        else
            return fibonacci(n - 1) + fibonacci(n - 2);
    }

    // Task 14: Array Sum and Average
    public static void arraySumAverage() {
        System.out.println("Enter the number of elements:");
        int n = sc.nextInt();
        int[] arr = new int[n];
        int sum = 0;

        System.out.println("Enter the elements:");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
            sum += arr[i];
        }

        double average = (double) sum / n;
        System.out.println("Sum: " + sum);
        System.out.println("Average: " + average);
    }

    // Task 15: String Reversal
    public static void reverseString() {
        System.out.println("Enter a string:");
        String input = sc.nextLine();
        StringBuilder reversed = new StringBuilder(input).reverse();
        System.out.println("Reversed String: " + reversed.toString());
    }
}