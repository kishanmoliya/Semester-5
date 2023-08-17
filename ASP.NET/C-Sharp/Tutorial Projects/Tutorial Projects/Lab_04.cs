using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TutorialProjects;

namespace Tutorial_Projects
{
    internal class Lab_04
    {
        public Lab_04()
        {
            Console.WriteLine("1 -> DivideByZero()\n2 -> IndezxOutOfRange()\n3 -> evenNumError()\n4 -> Calculate()\n5 -> Result()\n6 -> Areas()\n7 -> stringMethods()\n8 -> ChangeCase()\n9 -> longestWord()\n10 -> ChangeCharacterCase()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                case "1": DivideByZero(56, 0); break;
                case "2": IndezxOutOfRange(); break;
                case "3": evenNumError(); break;
                case "4": Calculate cl = new Calculate(); break;
                case "5": Result r = new Result(); break;
                case "6": Areas ar = new Areas(); break;
                case "7": stringMethods(); break;
                case "8": ChangeCase cs = new ChangeCase(); break;
                case "9": longestWord(); break;
                case "10": ChangeCharacterCase(); break;
                default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        //1.Write a program to Create a divide by zero exception and handle it.
        void DivideByZero(int a, int b)
        {
            try
            {
                int result = a / b;
                Console.WriteLine("Result: " + result);
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("Error: Cannot divide by zero!");
            }
        }

        //2.Write a program that reads 5 numbers from user.Demonstrate concept of IndexOutOfRange Exception.
        void IndezxOutOfRange()
        {
            int[] numbers = new int[5];
            try
            {
                Console.WriteLine("Enter 5 numbers:");

                for (int i = 0; i < 5; i++)
                {
                    Console.Write($"Number {i + 1}: ");
                    numbers[i] = int.Parse(Console.ReadLine());
                }

                // Attempting to access an element outside the valid range
                int sixthNumber = numbers[5];
                Console.WriteLine($"The sixth number is: {sixthNumber}");
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("Error: Index out of range!");
            }
            catch (FormatException)
            {
                Console.WriteLine("Error: Invalid input format!");
            }
        }


        //3.Write a program to accept a number from the user and throw an exception if the number is not an even number.
        void evenNumError()
        {
            try
            {
                Console.Write("Enter a number: ");
                int number = int.Parse(Console.ReadLine());

                if (number % 2 != 0)
                {
                    throw new Exception("Number must be even!");
                }

                Console.WriteLine("Number is even.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }


        //4.Write a program to create an abstract class Sum having abstract methods SumOfTwo(int a, int b) and SumOfThree(int a, int b, int c). Create another
        //class Calculate which extends the abstract class and implements the abstract methods.
        abstract class Sum
        {
            public abstract void sumOfTwo(int a, int b);
            public abstract void sumOfThree(int a, int b, int c);
        }

        class Calculate : Sum
        {
            public Calculate()
            {
                Console.Write("Enter num1 : ");
                int a = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter num2 : ");
                int b = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter num3 : ");
                int c = Convert.ToInt32(Console.ReadLine());
                sumOfTwo(a, b);
                sumOfThree(a, b, c);
            }
            public override void sumOfTwo(int a, int b)
            {
                Console.WriteLine("Sum of two Number: " + (a + b));
            }

            public override void sumOfThree(int a, int b, int c)
            {
                Console.WriteLine("Sum of Three Number: " + (a + b + c));
            }
        }

        //5. Write a program to create interface Calculate. In this interface we have two member functions Addition() and Subtraction(). Implements this interface
        //in another class named Result.
        interface Calculatee
        {
            void addition(int a, int b);
            void subtraction(int a, int b);
        }

        class Result : Calculatee
        {
            public Result()
            {
                Console.Write("Enter num1 : ");
                int a = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter num2 : ");
                int b = Convert.ToInt32(Console.ReadLine());
                addition(a, b);
                subtraction(a, b);
            }
            public void addition(int a, int b)
            {
                Console.WriteLine("Sum of two Number: " + (a + b));
            }

            public void subtraction(int a, int b)
            {
                Console.WriteLine("Substraction of two Number: " + (a - b));
            }
        }

        //6. Write a program to create interface named Shape.In this interface, we have three methods Circle(), Triangle() and Square() which calculates area
        //of Circle, Triangle and Square respectively.Implement Shape interface.
        interface Shape
        {
            void circle(double redis);
            void triangle(double height, double basee);
            void square(double area);
        }

        class Areas : Shape
        {
            public Areas()
            {
                Console.Write("Enter Redis : ");
                double redis = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter Height : ");
                double height = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter Base : ");
                double basee = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter Area : ");
                double area = Convert.ToDouble(Console.ReadLine());

                circle(redis);
                triangle(height, basee);
                square(area);
            }
            public void circle(double redis)
            {
                Console.WriteLine("Area of Circle:" + (3.14 * redis * redis));
            }
            public void triangle(double height, double basee)
            {
                Console.WriteLine("Area of Triangle: " + (height * basee / 2));
            }
            public void square(double area)
            {
                Console.WriteLine("Area of Square:" + (area * area));
            }
        }

        //7. Write program showing use of common methods of String class.
        void stringMethods()
        {
            string str = "Kishan Moliya";

            // Length
            Console.WriteLine("Length: " + str.Length);

            // Character at index
            Console.WriteLine("First character: " + str[0]);

            // Substring
            Console.WriteLine("Substring from index 7: " + str.Substring(7));

            // Concatenation
            string contant = " is ASP.Net core Developer";
            Console.WriteLine("Concatenated string: " + string.Concat(str, contant));

            // Replace
            Console.WriteLine("Replaced string: " + str.Replace('M', 'm'));

            // To lowercase and uppercase
            Console.WriteLine("Lowercase: " + str.ToLower());
            Console.WriteLine("Uppercase: " + str.ToUpper());

            // Check if starts/ends with
            Console.WriteLine("Starts with 'Kishan': " + str.StartsWith("Kishan"));
            Console.WriteLine("Ends with 'raman!': " + str.EndsWith("raman"));

            // Index of
            Console.WriteLine("Index of h: " + str.IndexOf("h"));

            // Trim leading and trailing whitespace
            string stringWithWhitespace = "   Hello, World!    ";
            Console.WriteLine("Trimmed string: " + stringWithWhitespace.Trim());
        }

        //8. Write a program to Replace lower case characters to upper case and Vice-versa.
        class ChangeCase
        {
            public ChangeCase()
            {
                lowerToUpper();
                upperToLower();
            }
            void lowerToUpper()
            {
                Console.Write("Enter the Characters in Lower Case: ");
                string lower = Console.ReadLine();

                Console.WriteLine("Upper Case: " + lower.ToUpper());
            }
            void upperToLower()
            {
                Console.Write("Enter the Characters in Upper Case: ");
                string upper = Console.ReadLine();

                Console.WriteLine("Lower Case: " + upper.ToLower());
            }
        }

        //9. Write a program to find the longest word in a string.
        void longestWord()
        {
            Console.Write("Enter a sentence:");
            string sentence = Console.ReadLine();

            string[] words = sentence.Split(' ');

            string longestWord = "";
            foreach (string word in words)
            {
                if (word.Length > longestWord.Length)
                {
                    longestWord = word;
                }
            }

            Console.WriteLine("Longest word: " + longestWord);
        }

        //10. Write a program to change the case of entered character.
        void ChangeCharacterCase()
        {
            Console.Write("Enter a character:");
            char ch= Console.ReadKey().KeyChar;

            if (char.IsLower(ch))
                Console.WriteLine("Your Character:" + char.ToUpper(ch));
            else if (char.IsUpper(ch))
                Console.WriteLine("Your Character:" + char.ToLower(ch));
            else
                Console.WriteLine("Enter the valid Character!");
        }
    }
}


