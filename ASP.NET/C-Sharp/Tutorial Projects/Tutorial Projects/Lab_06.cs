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
            Console.WriteLine("1 -> ArrayList()\n2 -> StackDemo()\n3 -> Queue()\n4 -> Dictionary()");

            Console.Write("Enter the program number that you want to run : ");
            String choice = Console.ReadLine();
            Console.WriteLine("=========================================");

            switch (choice)
            {

                case "1": ArrayList(); break;
                case "2": StackDemo(); break;
                case "3": Queue(); break;
                case "4": Dictionary(); break; 
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
            ArrayList array = new ArrayList();
            // Insert an elements using Add(Object value) function in ArrayList.
            for (int i = 10; i <= 100; i += 10)
            {
                array.Add(i);
            }

            // Display elements of the ArrayList.
            foreach (var item in array)
            {
                Console.Write($"{item} | ");
            }
            Console.WriteLine();

            // Removes specific objects using Remove(Object obj) function from ArrayList.
            array.Remove(40);

            // Removes specific elements by indexes using RemoveAt(int index) function from ArrayList. 
            array.RemoveAt(4);

            // Removes elements by range using RemoveRange(int index, int count) function from ArrayList.
            array.RemoveRange(2, 4);

            // Check whether an element is present or not in the ArrayList.
            array.Contains(20);

            // Count the number of elements are actually present in the ArrayList.
            int count = array.Count;

            // Return the index of specified object of ArrayList.
            array.IndexOf(20);

            // Insert the element at the specified index into the ArrayList.
            array.Insert(2, 30);

            // Sort the ArrayList
            array.Sort();

            // Clear all the elements from the ArrayList.
            array.Clear();

        }

        /*2. Create a List for StudentName and perform following operations:
        a.Add() - To Add new student in list
        b.Remove() - To Remove Student with specified index
        c.RemoveRange() - To Remove student with specified range.
        d.Clear() - To clear all the student from the list*/
        void StackDemo()
        {
            Stack stk = new Stack();
            // Insert an elements using Push(Object value) function at the top of the Stack.
            for (int i = 10; i <= 100; i += 10)
            {
                stk.Push(i);
            }

            // Display elements of the Stack.
            foreach (var item in stk)
            {
                Console.Write($"{item} | ");
            }
            Console.WriteLine();

            // Remove and return the object at the top of the Stack.
            stk.Pop();

            // Return the object without removing at the top of the Stack.
            stk.Peek();

            // Check whether an element is present or not in the Stack.
            stk.Contains(20);

            // Count the number of elements are actually present in the Stack.
            int count = stk.Count;

            // Clear all the elements from the Stack.
            stk.Clear();
        }

        /*3. Create a Stack which takes integer values and perform following
        operations:
        a.Push() - To Add new item in stack
        b.Pop() - To Remove item from the stack
        c.Peek() – To Return the top item from the stack.
        d.Contains() - To Checks whether an item exists in the stack or not.
        e.Clear() - To clear items from stack*/
        void Queue()
        {
            Queue que = new Queue();
            // Insert an elements using Enqueue(Object value) function at the end of the Queue.
            for (int i = 10; i <= 100; i += 10)
            {
                que.Enqueue(i);
            }

            // Display elements of the Queue.
            foreach (var item in que)
            {
                Console.Write($"{item} | ");
            }
            Console.WriteLine();

            // Remove and return the object at the beginning of the Queue.
            que.Dequeue();

            // Return the object without removing at the top of the Queue.
            que.Peek();

            // Check whether an element is present or not in the Queue.
            que.Contains(20);

            // Count the number of elements are actually present in the Queue.
            int count = que.Count;

            // Clear all the elements from the Queue.
            que.Clear();
        }

        /*4. Create a Queue which takes integer values and perform following
        operations: 
        a.Enqueue() - Adds an item into the queue.
        b.Dequeuer() - Returns an item from the beginning of the queue and removes it from the queue.
        c.Peek() - Returns an first item from the queue without removing it.
        d.Contains() - Checks whether an item is in the queue or not
        e.Clear() - Removes all the items from the queue */

        void Dictionary()
        {
            Dictionary<string, dynamic> dict = new Dictionary<string, dynamic>();
            // Insert value with specified key in the Dictionary.
            dict.Add("name", "Kishan");
            dict.Add("age", 19);
            dict.Add("isDeveloper", true);
            dict.Add("hobby", "Reading");
            dict.Add("college", "Darshan University");

            // Display objects of the Dictionary..
            foreach (var key in dict.Keys)
            {
                Console.WriteLine($"{key} : {dict[key]}");
            }
            Console.WriteLine();

            // Remove specified object with help of key.
            dict.Remove("hobby");

            // Check whether the key is present or not in the Dictionary.
            dict.ContainsKey("age");

            // Check whether the value is present or not in the Dictionary.
            dict.ContainsValue("Kishan");

            // Count the number of objects are actually present in the Dictionary.
            int count = dict.Count;

            // Clear all the objects from the Dictionary.
            dict.Clear();
        }
    }
}
