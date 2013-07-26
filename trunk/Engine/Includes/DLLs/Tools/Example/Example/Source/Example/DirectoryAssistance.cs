using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Example
{
    public class DirectoryAssistance
    {
        public string CombinePaths(string path1, string path2)
        {
            return System.IO.Path.Combine(path1, path2); // can you return strings yet?
        }
    }
}
