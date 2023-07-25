using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Linq;
using static System.Formats.Asn1.AsnWriter;

namespace Tutorial_Projects
{
    internal class Lab_03
    {
        public Lab_03()
        {
            Console.WriteLine("1 -> Candidate()\n2 -> Staff()\n3 -> Bank_Account()\n4 -> Student()\n5 -> Salary()\n6 -> Distance()\n7 -> Rectangle()\n8 -> Furniture()\n9 -> Interest()\n10 -> Employee()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {
                 case "1": Candidate cd = new Candidate(); break;
                 case "2": Staff st = new Staff(); break;
                 case "3": Bank_Account ba = new Bank_Account(); break;
                 case "4": Student stu = new Student(21010101128, "Kishan", 5, 8.68, 8.50); break;
                 case "5": Salary sa = new Salary(500, 1000); break;
                 case "6": Distance dt = new Distance(50, 45); break;
                 case "7": Rectangle rt = new Rectangle(); break;
                 case "8": Table tb = new Table(); break;
                 case "9": Interest it = new Interest(); break;
                 case "10": Employee ep = new Employee(); break;
                 default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        //1. Write a program to create a class named Candidate with ID, Name, Age, Weight and Height as data members & also create a member functions like
        //   GetCandidateDetails() and DisplayCandidateDetails(). 
        class Candidate
        {
            long id;
            String name;
            int age;
            double weight, height;

            public Candidate()
            {
                getCandidateDetails();
                displayCandidateDetails();
            }

            public void getCandidateDetails()
            {
                Console.Write("Enter the Candidate ID : ");
                id = Convert.ToInt64(Console.ReadLine());
                Console.Write("Enter the Candidate Name : ");
                name = Console.ReadLine();
                Console.Write("Enter the Candidate Age : ");
                age = Convert.ToInt32(Console.ReadLine());
                Console.Write("Enter the Candidate Weight : ");
                weight = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter the Candidate Height : ");
                height = Convert.ToDouble(Console.ReadLine());
            }

            public void displayCandidateDetails()
            {
                Console.WriteLine("Candidate ID : " + id);
                Console.WriteLine("Candidate Name : " + name);
                Console.WriteLine("Candidate Age : " + age);
                Console.WriteLine("Candidate Weight : " + weight);
                Console.WriteLine("Candidate Height : " + height);
            }
        }

        //2. Write a program to create a class Staff having data members as Name, Department, Designation, Experience & Salary.Accept this data for 5
        //different staffs and display only names & salary of those staff who are HOD.
        class Staff
        {
            string[] department = new string[5];
            string[] name = new string[5];
            string[] designation = new string[5];
            string[] experience = new string[5];
            double[] salary = new double[5];
            public Staff()
            {
                getCandidateDetails();
                displayCandidateDetails();
            }

            void getCandidateDetails()
            {
                for (int i = 0; i < 5; i++)
                {
                    Console.WriteLine("Enter Staff {0} Details...", i + 1);
                    Console.Write("Enter the Staff Name : ");
                    name[i] = Console.ReadLine();
                    Console.Write("Enter the Department Name : ");
                    department[i] = Console.ReadLine();
                    Console.Write("Enter the Designation : ");
                    designation[i] = Console.ReadLine();
                    Console.Write("Enter the Experince : ");
                    experience[i] = Console.ReadLine();
                    Console.Write("Enter the Salary : ");
                    salary[i] = Convert.ToDouble(Console.ReadLine());
                    Console.WriteLine("=====================================");
                }
            }

            void displayCandidateDetails()
            {
                for (int i = 0; i < 5; i++)
                {
                        if (designation[i].ToLower() == "hod")
                        {
                            Console.WriteLine("Name : " + name[i]);
                            Console.WriteLine("Salary : " + salary[i]);
                            Console.WriteLine("-----------------------");
                        }
                }
            }
        }


        //3. Write a pogram to Create a class Bank_Account with Account_No, Email, User_Name, Account_Type and Account_Balance as data members.Also
        //create a Member function GetAccountDetails() &DisplayAccountDetails().
        class Bank_Account
        {
            long account_no;
            String user_name, email_address, account_type;
            public double balance;

            public Bank_Account()
            {
                getAccountDetails();
                displayAccountDetails();
            }
            void getAccountDetails()
            {
                Console.Write("Enter the Account number : ");
                account_no = Convert.ToInt64(Console.ReadLine());
                Console.Write("Enter the User name : ");
                user_name = Console.ReadLine();
                Console.Write("Enter the Email Address : ");
                email_address = Console.ReadLine();
                Console.Write("Enter the Account type : ");
                account_type = Console.ReadLine();
                Console.Write("Enter the Balance : ");
                balance = Convert.ToDouble(Console.ReadLine());
            }

            void displayAccountDetails()
            {
                Console.WriteLine("===== Account Details =====");
                Console.WriteLine("Account No. : " + account_no);
                Console.WriteLine("User name : " + user_name);
                Console.WriteLine("Email Address : " + email_address);
                Console.WriteLine("Account Type : " + account_type);
                Console.WriteLine("Balance : " + balance);
            }
        }

        //4. Write a program with following specifications: 
        //Class Name: Student Data Members: Enrollment_No, Student_Name, Semester, CPI and SPI
        //Get Students Details using constructor and DisplayStudentDetails() using member function.
        class Student
        {
            long enrollment_no;
            int sem;
            double spi, cpi;
            String name;

            public Student(long enrollment_no, String name, int sem, double spi, double cpi)
            {
                this.enrollment_no = enrollment_no;
                this.sem = sem;
                this.spi = spi;
                this.cpi = cpi;
                this.name = name;

                displayStudentDetails();
            }

            void displayStudentDetails()
            {
                Console.WriteLine("Enrollment No. = " + enrollment_no);
                Console.WriteLine("Student Name = " + name);
                Console.WriteLine("Semester = " + sem);
                Console.WriteLine("SPI = " + spi);
                Console.WriteLine("CPI = " + cpi);
            }
        }

        //5.Write a program to Define a class Salary which will contain member variable Basic, TA, DA, HRA. Write a program using Constructor with default 
        //values for DA and HRA and calculate the salary of employee
        class Salary
        {
            static double da = 0.5, hra = 0.85;
            double basic, ta;

            public Salary(double basic, double ta)
            {
                this.basic = basic;
                this.ta = ta;

                displaySalary();
            }

            public void displaySalary()
            {
                Console.WriteLine($"Salary = {basic + ta + da + hra}");
            }
        }

        //6. Write a program to Define a class Distance have data members dist1, dist2, dist3.Initialize the two data members using constructor and store their
        //addition in third data member using function and display addition.
        class Distance
        {
            double distance1, distance2, distance3;
            public Distance(double dist1, double dist2)
            {
                this.distance1 = dist1;
                this.distance2 = dist2;

                calculate();
                Console.WriteLine("Total distance = " + distance3);
            }

            double calculate()
            {
                return distance3 = distance1 + distance2;
            }
        }

        //7. Write a program to calculate area of a Rectangle using constructor.
        class Rectangle
        { 
            public Rectangle()
            {
                Console.Write("Enter the Length of Rectengle : ");
                double length = Convert.ToDouble(Console.ReadLine());
                Console.Write("Enter the Width of Rectengle : ");
                double width = Convert.ToDouble(Console.ReadLine());

                Console.WriteLine("Area of Rectangle = " + length * width);
            }
        }

        //8. Create a class Furniture with material ,price as data members. Create another class Table with Height, surface_area as data members.Write a
        //program to implement single inheritance.
        class Furniture
        {
            public String material = "Playwood";
            public double price = 25456.78;
        }
        class Table : Furniture
        {
            double height = 25;
            double surface_area = 235.12;

            public Table()
            {
                Console.WriteLine("Material : " + material);
                Console.WriteLine("Price : " + price);
                Console.WriteLine("Height : " + height);
                Console.WriteLine("Surface_are : " + surface_area);
            }
        }

        //9.Write a program for implementing single inheritance which creates one class Account_Details for getting account information and another class
        //Interest for calculating and displaying total interest from the data inserted from account details.
        class Interest : Bank_Account
        {
            public Interest()
            {
                //7.5% Interest Rate per Year
                Console.WriteLine("======================");
                Console.WriteLine("7.5% Interest Rate per Year");   
                double interest =(balance * 7.5 * 1) / 100;
                Console.WriteLine("Total Interest = " + interest);
                Console.WriteLine("Finale Balence = " + (interest + balance));
            }
        }

        //10. Program to implement the following multiple inheritance using 
        public interface Gross
        {
            void Gross_sal();
        }

        public class salary
        {
            double da = 0.5, hra = 0.85, ta = 1000;

            public double displaySalary()
            {
                return ta + da + hra;
            }
        }

         public class Employee : salary, Gross
        {
            string name;

            public double basic_sal()
            {
                return 45358.85;
            }

            public void Gross_sal()
            {
                Console.Write("Gross Salary = " + basic_sal() + displaySalary());
            }

            public Employee()
            {
                Gross_sal();
            }
        }
    }
}
