using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Intrinsics.Arm;
using System.Text;
using System.Threading.Tasks;
using TutorialProjects;

namespace Tutorial_Projects
{
    internal class Lab_01
    {
        public Lab_01() {
            Console.WriteLine("1 -> printYourDetails()\n2 -> printTwoNum()\n3 -> printdemo()\n4 -> findArea()\n5 -> areas()\n6 -> convertTemperature()\n7 -> simpleInterestCal()\n8 -> simpleCal()\n9 -> findLargesr()\n10 -> swapValue()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                case "1":printYourDetails();break;
                case "2": printTwoNum(); break;
                case "3": printdemo(); break;
                case "4": findArea(); break;
                case "5": areas(); break;
                case "6": convertTemperature(25); break;
                case "7": simpleInterestCal(); break;
                case "8": simpleCal(); break;
                case "9": findLargesr(); break;
                case "10": swapValue(); break;
                default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        //1. Write a program to print your name, address, contact number & city.
        void printYourDetails()
        {
            Console.WriteLine("I am Kishan Moliya");
        }

        //2. Write a program to get two numbers from user and print those two 
        //numbers
        void printTwoNum()
        {
            Console.Write("Enter the First number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the Second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine(num1 + " and " + @num2);
        }

        //3. Write program to prompt a user to input his/her name and country name 
        //and then output will be shown as given: Hello<yourname> from country
        //<countryname>.
        void printdemo()
        {
            Console.Write("Enter Your name : ");
            String name = Console.ReadLine();
            Console.Write("Enter Your Country name : ");
            String country = Console.ReadLine();

            Console.WriteLine("Hello " + name + " from country " + country);
        }

        //4. Write a program to calculate the size of the area in square-feet based on
        //Specified length and width.
        void findArea()
        {
            Console.Write("Enter Length : ");
            int length = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter Width : ");
            int width = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Area is = " + length * width);
        }

        //5. Write a program to calculate area of Square, Rectangle and Circle.
        void areas()
        {
            Console.Write("Enter the Redis = ");
            double redis = double.Parse(Console.ReadLine());

            Console.Write("Enter the Height = ");
            double height = double.Parse(Console.ReadLine());

            Console.Write("Enter the Base = ");
            double basee = double.Parse(Console.ReadLine());

            Console.Write("Enter the Area = ");
            double a = double.Parse(Console.ReadLine());

            Console.WriteLine("Area of Circle = " + 3.14 * redis * redis);
            Console.WriteLine("Area of Triangle = " + height * basee / 2);
            Console.WriteLine("Area of Squre = " + a * a);
        }

        //6. Write a program to calculate Celsius to Fahrenheit and vice-versa using 
        //function
        void convertTemperature(int temperature)
        {
            //Fahrenheit to Celsius
            Console.WriteLine("Celsius = " + (temperature - 32) * 5 / 9);

            //Celsius to Fahrenheit
            double Celsius = (temperature * 9) / 5 + 32;
            Console.WriteLine("Fahrenheit = " + Celsius);
        }

        //7. Write a program to find out Simple Interest using function. (I = PRN/100)
        void simpleInterestCal()
        {
            Console.Write("Enter the Prize = ");
            double p = double.Parse(Console.ReadLine());

            Console.Write("Enter the Interese Rate = ");
            double r = double.Parse(Console.ReadLine());

            Console.Write("Enter the Time = ");
            double n = double.Parse(Console.ReadLine());

            Console.WriteLine("Interese is = " + p * r * n / 100);
        }

        //8. Write a program to create a Simple Calculator for two numbers (Addition, 
        //Multiplication, Subtraction, Division) [Also using if…else & Switch Case]
        void simpleCal()
        {
            //Using If..else
            Console.Write("Enter the First number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the Second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter your choice : ");
            String op = Console.ReadLine();

            if (op == "+")
                Console.WriteLine("Addition is = " + (num1 + num2));
            else if (op == "-")
                Console.WriteLine("Subtraction is = " + (num1 - num2));
            else if (op == "*")
                Console.WriteLine("Multiplication is = " + (num1 * num2));
            else if (op == "/")
                Console.WriteLine("Division is = " + (num1 / num2));
            else
                Console.WriteLine("Please Enter between +, -, *, /");

            //Using Switch Case
            switch (op)
            {
                case "+": Console.WriteLine("Addition is = " + (num1 + num2)); break;
                case "-": Console.WriteLine("Subtraction is = " + (num1 - num2)); break;
                case "*": Console.WriteLine("Multiplication is = " + (num1 * num2)); break;
                case "/": Console.WriteLine("Division is = " + (num1 / num2)); break;
                default: Console.WriteLine("Please Enter between +, -, *, /"); break;
            }
        }

        //9. Write a program to find maximum numbers from given 3 numbers.
        void findLargesr()
        {
            Console.Write("Enter the First number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the Second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the Third number : ");
            int num3 = Convert.ToInt32(Console.ReadLine());

            
            int largest = num1 > num2 ? (num1 > num3) ? num1 : num3 : (num2 > num3) ? num2 : num3;

            Console.WriteLine("Largest = "+ largest);
        }

        //10. Write a program to Swapping without using third variable.
        void swapValue()
        {
            Console.Write("Enter the First number : ");
            int num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter the Second number : ");
            int num2 = Convert.ToInt32(Console.ReadLine());

            num1 = num1 + num2;
            num2 = num1 - num2;
            num1 = num1 - num2;

            Console.WriteLine(num1);
            Console.WriteLine(num2);
        }
    }
}