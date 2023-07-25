using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics.Metrics;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using TutorialProjects;

namespace Tutorial_Projects
{
    internal class Lab_02{
        public Lab_02() {
            Console.WriteLine("1 -> BMI()\n2 -> percentageCal()\n3 -> primeNumber()\n4 -> leapYear()\n5 -> fibbo()\n6 -> decimalToBinary()\n7 -> calculate_nPr()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                case "1": BMI(); break;
                case "2": percentageCal(); break;
                case "3": primeNumber(); break;
                case "4": leapYear(); break;
                case "5": fibbo(); break;
                case "6": decimalToBinary(); break;
                case "7": calculate_nPr(); break;
                default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        //1. Body Mass Index (BMI) is a measure of health on weight. It can be calculated by taking your weight in kilograms and dividing by the square of
        // your height in meters.Write a program that prompts the user to enter aweight in pounds and height in inches and displays the BMI.(Note: - 1 pound = 0.45359237 Kg and 1 inch = 0.0254 meters)
        void BMI()
        {
            Console.Write("Enter your Weight in kilograms = ");
            double pound = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter your Weight in kilograms = ");
            double inch = Convert.ToDouble(Console.ReadLine());

            double BMI = (pound * 0.45359237) / ((inch * 0.0254) * (inch * 0.0254));

            Console.WriteLine("BMI = " + BMI);
        }

        //2. The marks obtained by a student in 5 different subjects are input through the keyboard.The student gets a grade as per the following rules:
        //  a.Percentage above or equals to 60-first grade
        //  b.Percentage between 50 to 59-second grade
        //  c.Percentage between 40 and 49-Third grade
        //  d.Percentage less than 40-poor Grade
        void percentageCal()
        {
            Console.Write("Enter Subject 1 Marks = ");
            double sub1 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Subject 2 Marks = ");
            double sub2 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Subject 3 Marks = ");
            double sub3 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Subject 4 Marks = ");
            double sub4 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Subject 5 Marks = ");
            double sub5= Convert.ToDouble(Console.ReadLine());

            double percentage = (sub1 + sub2 + sub3 + sub4 + sub5) / 5;

            if (percentage >= 60) Console.WriteLine("Firse Grade");
            else if (percentage >= 50 && percentage < 60) Console.WriteLine("Second Grade");
            else if (percentage >= 40 && percentage < 50) Console.WriteLine("Third Grade");
            else Console.WriteLine("Poor Grade");
        }

        //3. Write a program to check prime number.
        void primeNumber()
        {
            Console.Write("Enter the Number : ");
            int n = Convert.ToInt32(Console.ReadLine());

            bool flage = false;

            for(int i= 2; i < n; i++)
            {
                if(n % i == 0) flage = true; break;
            }

            if (flage) Console.Write("Not Prime");
            else Console.Write("Prime");
        }

        //4. Write a program to find out whether a given year is a leap year or not.
        void leapYear()
        {
            Console.Write("Enter the Number : ");
            int year = Convert.ToInt32(Console.ReadLine());

            if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) Console.Write("Leap Year");
            else Console.Write("Not Leap Year");
        }

        //5. Write a program to print Fibonacci series.
        void fibbo()
        {
            Console.Write("Enter the Number : ");
            int n = Convert.ToInt32(Console.ReadLine());

            int a = 0, b = 1, sum = 0;
            for(int i=0; i < n; i++) {
                Console.Write(a);
                sum = a + b;
                b = a;
                a = sum;
            }
        }

        //6. Write a program that takes a number as input and displays its equivalent binary form.
        void decimalToBinary()
        {
            Console.Write("Enter the decimal number : ");
            int decimalNumber = Convert.ToInt32(Console.ReadLine());

            String binaryNumber = "";

            while (decimalNumber != 0)
            {
                int remainder = decimalNumber % 2;
                binaryNumber += remainder.ToString();
                decimalNumber = Convert.ToInt32(decimalNumber / 2);
            }

            for (int i = binaryNumber.Length - 1; i >= 0; i--)
            {
                Console.Write(binaryNumber[i]);
            }
        }

        //7. Write a program to calculate the nPr. (nPr = n! / (n - r)!)
        void calculate_nPr()
        {
            Console.Write("Enter the N : ");
            int n = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the R : ");
            int r = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("{0}P{1} = {2}", n, r, (factorial(n) / factorial(n - r)));
        }

        int factorial(int n)
        {
            if(n == 1) return 1;

            return n * factorial(n - 1);
        }
    }
}
