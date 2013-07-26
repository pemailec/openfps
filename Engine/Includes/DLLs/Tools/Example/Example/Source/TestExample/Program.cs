using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Example;

namespace TestExample
{
    class Program
    {
        static void Main(string[] args)
        {
            CustomObjectManager manager = new CustomObjectManager();
            manager.CreateObject(5);
            manager.SetObjectMoney(5, 100);
            manager.SetObjectName(5, "Hello");
            Console.WriteLine(manager.GetObjectName(5));
            Console.WriteLine(manager.GetObjectMoney(5));
            Console.WriteLine(manager.ObjectExists(1));
            Console.WriteLine(manager.ObjectExists(5));
            Console.WriteLine(manager.ObjectExists(27));

            System.Threading.Thread.Sleep(1000);
        }
    }
}
