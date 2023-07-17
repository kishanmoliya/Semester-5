using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TutorialProjects;

namespace Tutorial_Projects
{
    internal class Lab_05
    {
        public Lab_05()
        {
            Console.WriteLine("1 -> addTwoNum()\n2 -> Areas()\n3 -> Areas2()\n4 -> Calculate()\n5 -> Result()\n6 -> Areas()\n7 -> stringMethods()\n8 -> ChangeCase()\n9 -> longestWord()\n10 -> ChangeCharacterCase()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                case "1": addTwoNum num = new addTwoNum(); break;
                case "2": Areas area = new Areas(); break;
                case "3": Areas2 area2 = new Areas2(); break;
                    //case "4": Calculate cl = new Calculate(); break;
                    //case "5": Result r = new Result(); break;
                    //case "6": Areas ar = new Areas(); break;
                    //case "7": stringMethods(); break;
                    //case "8": ChangeCase cs = new ChangeCase(); break;
                    //case "9": longestWord(); break;
                    //case "10": ChangeCharacterCase(); break;
                default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        //1. Write a program using method overloading by changing datatype of arguments to perform addition of two integer numbers and two float numbers.
        class addTwoNum
        {
            public addTwoNum()
            {
                Console.Write("Ente the int num1: ");
                int a = Convert.ToInt32(Console.ReadLine());
                Console.Write("Ente the int num2: ");
                int b = Convert.ToInt32(Console.ReadLine());
                addIntNum(a, b);

                Console.Write("Ente the float num1: ");
                double x = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the float num2: ");
                double y = Convert.ToDouble(Console.ReadLine());
                addIntNum(x, y);

            }
            void addIntNum(int a, int b)
            {
                Console.WriteLine("Sum a and b is: " + (a + b));
            }

            void addIntNum(double a, double b)
            {
                Console.WriteLine("Sum a and b is: " + (a + b));
            }
        }

        //2. Write a program using method overloading by changing number of arguments to calculate area of square and rectangle.
        class Areas
        {
            public Areas()
            {
                Console.Write("Ente the Area: ");
                double area = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the Width: ");
                double width = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the Height: ");
                double height = Convert.ToDouble(Console.ReadLine());
                squareArea(area);
                rectangleArea(width, height);

            }
            public void squareArea(double area)
            {
                Console.WriteLine("Area of Square is: " + (area * area));
            }

            public 
                void rectangleArea(double width, double height)
            {
                Console.WriteLine("Area of Rectangle is: " + (width + height));
            }
        }

        //3. Write a programs to Find Area of Square, Rectangle and Circle using Method Overloading.
        class Areas2 : Areas
        {
            public Areas2()
            {
                Console.Write("Ente the Redis: ");
                double redis = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the Area: ");
                double area = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the Width: ");
                double width = Convert.ToDouble(Console.ReadLine());
                Console.Write("Ente the Height: ");
                double height = Convert.ToDouble(Console.ReadLine());
                circleArea(redis);
                squareArea(area);
                rectangleArea(width, height);
            }
            void circleArea(double redis)
            {
                Console.WriteLine("Area of Circle is: " + (redis * redis));
            }
        }

        //4. Create a class named RBI with calculateInterest() method.Create another classes HDFC, SBI, ICICI which overrides calculateInterest() method.

        //5. Create a class Hospital with HospitalDetails() method.Create another classes Apollo, Wockhardt, Gokul_Superspeciality which overrides
        //HospitalDetails() method.

        //6. Write a program to return the factorial from the method using delegate.

        //7. Write a program to create a delegate called TrafficDel and a class called TrafficSignal with the following delegate methods.
        /*     Public static void Yellow()
             {
                 Console.WriteLine(“Yellow Light Signal To Get Ready”);
             }
             Public static void Green()
             {
                 Console.WriteLine(“Green Light Signal To Go”);
             }
             Public static void Red()
             {
                 Console.WriteLine(“Red Light Signal To Stop”);
             }
             */
        //8. Write a program to create a delegate calculator to demonstrate the example of generic delegate.
    }
}
