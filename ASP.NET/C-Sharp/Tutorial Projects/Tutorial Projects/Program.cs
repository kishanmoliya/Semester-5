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
                 Console.WriteLine("1 -> Lab - 1\n2 -> Lab - 2\n3 -> Lab - 3\n4 -> Lab - 4\n5 -> Lab -5\n6 -> Lab- 6");
                 Console.Write("Enter the Lab Number that you want to run : ");
                 String choice = Console.ReadLine();
                 Console.WriteLine("=========================================");

                 if (choice == "0")
                 {
                     Environment.Exit(0);
                 }
                 switch (choice)
                 {
                     case "1": Lab_01 lab1 = new Lab_01(); break;
                     case "2": Lab_02 lab2 = new Lab_02(); break;
                     case "3": Lab_03 lab3 = new Lab_03(); break;
                     case "4": Lab_04 lab4 = new Lab_04(); break;
                     case "5": Lab_05 lab5 = new Lab_05(); break;
                     case "6": Lab_06 lab6 = new Lab_06(); break;
                     default: Console.WriteLine("Please Enter Valid Program Number"); break;
                 }
             }
        }
    }       
 }