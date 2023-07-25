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
            Console.WriteLine("1 -> addTwoNum()\n2 -> Areas()\n3 -> Areas2()\n4 -> ICICI()\n5 -> Hospital()\n6 -> Factorial()\n7 -> TrafficSignal()\n8 -> genericDelegate()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                case "1": addTwoNum num = new addTwoNum(); break;
                case "2": Areas area = new Areas(); break;
                case "3": Areas2 area2 = new Areas2(); break;
                case "4": ICICI bank = new ICICI(); break;
                case "5": Gokul_Suoerspeciality hospital = new Gokul_Suoerspeciality(); break;
                case "6": Factorial fa = new Factorial(); break;
                case "7": TrafficSignal tr = new TrafficSignal(); break;
                case "8": genericDelegate gd = new genericDelegate(); break;
                //default: Console.WriteLine("Please Enter Valid Program Number"); break;
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
        class Areas2
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

        //4. Create a class named RBI with calculateInterest() method.Create another classes HDFC, SBI, ICICI which overrides calculateInterest() method.
        class RBI
        {
            void calculateInterest()
            {
                Console.WriteLine("RBI class");
            }
        }

        class HDFC : RBI
        {
            void calculateInterest()
            {
                Console.WriteLine("HDFC class");
            }
        }

        class SBI : RBI
        {
            void calculateInterest()
            {
                Console.WriteLine("SBI class");
            }
        }

        class ICICI : RBI
        {
            public ICICI() { calculateInterest(); }
            void calculateInterest()
            {
                Console.WriteLine("ICICI class");
            }
        }

        //5. Create a class Hospital with HospitalDetails() method.Create another classes Apollo, Wockhardt, Gokul_Superspeciality which overrides
        //HospitalDetails() method.
        class Hospital
        {
            void hospitalDetails()
            {
                Console.WriteLine("Hospital class");
            }
        }

        class Apollo
        {
            void hospitalDetails() { Console.WriteLine("Apollo class"); }
        }

        class Wockhardt
        {
            void hospitalDetails() { Console.WriteLine("Wockhardt class"); }
        }

        class Gokul_Suoerspeciality
        {
            public Gokul_Suoerspeciality() { hospitalDetails(); }
            void hospitalDetails() { Console.WriteLine("Gokul_Suoerspeciality class"); }
        }

        //6. Write a program to return the factorial from the method using delegate.
        class Factorial
        {
            public Factorial() { callDelegate(); }
            public delegate void findFactorial(int n);
            public void factorial(int n)
            {
                int factorial = 1;
                for (int i = 1; i <= n; i++)
                {
                    factorial *= i;
                }

                Console.WriteLine("{0}! = {1}", n, factorial);
            }

            void callDelegate()
            {
                //Original Method...
                //Factorial fac = new Factorial();
                //findFactorial obj = new findFactorial(fac.factorial);
                //obj(5);
                findFactorial obj = new findFactorial(factorial);
                obj(5);
            }
        }

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
        class TrafficSignal
        {
            public TrafficSignal() { callDelegate(); }
            public delegate void TrafficDel();

            void Yellow()
            {
                Console.WriteLine("Yellow Light Signal To Get Ready");
            }
            void Green()
            {
                Console.WriteLine("Green Light Signal To Go");
            }
            void Red()
            {
                Console.WriteLine("Red Light Signal To Stop");
            }

            void callDelegate()
            {
                //Original Method...
                //Factorial fac = new Factorial();
                //findFactorial obj = new findFactorial(fac.factorial);
                //obj(5);
                TrafficDel obj = new TrafficDel(Yellow);
                TrafficDel obj1 = new TrafficDel(Green);
                TrafficDel obj2 = new TrafficDel(Red);
                obj(); obj1(); obj2();
            }
        }

        //8. Write a program to create a delegate calculator to demonstrate the example of generic delegate.
        class genericDelegate
        {
            public genericDelegate() { callDelegate(); }

            delegate void MyDel<T>(T n1, T n2);
            void Add(int num1, int num2)
            {
                Console.WriteLine("Addition: " + (num1 + num2));
            }
            void Sub(int num1, int num2)
            {
                Console.WriteLine("Substraction: " + (num1 - num2));
            }
            void Mul(int num1, int num2)
            {
                Console.WriteLine("Multiplication: " + (num1 * num2));
            }
            void Div(int num1, int num2)
            {
                Console.WriteLine("Division: " + (num1 / num2));
            }
            void callDelegate()
            {
                MyDel<int> obj = new MyDel<int>(Add);
                MyDel<int> obj1 = new MyDel<int>(Sub);
                MyDel<int> obj2 = new MyDel<int>(Mul);
                MyDel<int> obj4 = new MyDel<int>(Div);
                obj(5, 5); obj1(5, 5); obj2(5, 5); obj4(5, 5);
            }
        }
    }
}
