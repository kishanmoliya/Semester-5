using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorial_Projects
{
    internal class Lab_06
    {
        public Lab_06()
        {
            Console.WriteLine("1 -> ArrayList()\n2 -> Areas()\n3 -> Areas2()\n4 -> ICICI()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {

                case "1": ArrayList(); break;
                //  case "2": Areas area = new Areas(); break;
                //  case "3": Areas2 area2 = new Areas2(); break;
                //  case "4": ICICI bank = new ICICI(); break; 
                default: Console.WriteLine("Please Enter Valid Program Number"); break;
            }
        }

        /*1. Create an ArrayList for StudentName and perform following operations:
        a.Add() - To Add new student in list
        b.Remove() - To Remove Student with specified index
        c.RemoveRange() - To Remove student with specified range.
        d.Clear() - To clear all the student from the list*/
        void ArrayList()
        {
            ArrayList StudentName = new ArrayList();
            StudentName.Add("Kishan");
            StudentName.Add("xyz");
            StudentName.Remove("xyz");
            Console.Write(StudentName[0]);
        }

        /*2. Create a List for StudentName and perform following operations:
        a.Add() - To Add new student in list
        b.Remove() - To Remove Student with specified index
        c.RemoveRange() - To Remove student with specified range.
        d.Clear() - To clear all the student from the list*/

        /*3. Create a Stack which takes integer values and perform following
        operations:
        a.Push() - To Add new item in stack
        b.Pop() - To Remove item from the stack
        c.Peek() – To Return the top item from the stack.
        d.Contains() - To Checks whether an item exists in the stack or not.
        e.Clear() - To clear items from stack*/

        /*4. Create a Queue which takes integer values and perform following
        operations: 
        a.Enqueue() - Adds an item into the queue.
        b.Dequeuer() - Returns an item from the beginning of the queue and removes it from the queue.
        c.Peek() - Returns an first item from the queue without removing it.
        d.Contains() - Checks whether an item is in the queue or not
        e.Clear() - Removes all the items from the queue */

        class Sample
        {
            delegate T MyDel<T>(T n1, T n2);
            static void Add(int num1, int num2)
            {
                Console.WriteLine("Addition: " + (num1 + num2));
            }
            static void Sub(int num1, int num2)
            {
                Console.WriteLine("Substraction: " + (num1 - num2));
            }
            static void Mul(int num1, int num2)
            {
                Console.WriteLine("Multiplication: " + (num1 * num2));
            }
            static void Div(int num1, int num2)
            {
                Console.WriteLine("Division: " + (num1 / num2));
            }
        }
    }
}
