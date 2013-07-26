using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Example
{
    public class CustomObjectManager
    {
        private CustomObject[] _customObjects = new CustomObject[Int16.MaxValue];

        public void CreateObject(int id)
        {
            _customObjects[id] = new CustomObject();
        }

        public string GetObjectName(int id)
        {
            return _customObjects[id].Name;
        }

        public int GetObjectMoney(int id)
        {
            return _customObjects[id].Money;
        }

        public void SetObjectName(int id, string name)
        {
            _customObjects[id].Name = name;
        }

        public void SetObjectMoney(int id, int money)
        {
            _customObjects[id].Money = money;
        }

        public bool ObjectExists(int id)
        {
            return (_customObjects.Length >= id && _customObjects[id] != null);
        }
    }
}
