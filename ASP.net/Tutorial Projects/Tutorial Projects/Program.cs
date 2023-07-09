// See https://aka.ms/new-console-template for more information
using System.ComponentModel;
using System.Drawing;
using Tutorial_Projects;

namespace TutorialProjects
{
    public class Program
    {
        public static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("=========================================");
                Console.WriteLine("Press Zero(0) to Exit");
                Console.WriteLine("1 -> Lab - 1\n2 -> Lab - 2\n3 -> Lab - 3");
                Console.Write("Enter the Lab Number that you want to run : ");
                String choice = Console.ReadLine();
                Console.WriteLine("=========================================");

                if(choice == "0") {
                    Environment.Exit(0);
                }
                switch (choice)
                {
                    case "1": Lab_01 lab1 = new Lab_01(); break;
                    case "2": Lab_02 lab2 = new Lab_02(); break;
                    case "3": Lab_03 lab3 = new Lab_03(); break;
                    default: Console.WriteLine("Please Enter Valid Program Number"); break;
                }
            }
        }
    }       
 }