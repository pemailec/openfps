using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OpenFPS_CalculationLib
{
    public class OpenFPSClass
    {
        public double OpenFPS_DistanceFormula(float x1, float y1, float z1, float x2, float y2, float z2)
        {
            float x_result = ((x1 - x2) * (x1 - x2));
            float y_result = ((y1 - y2) * (y1 - y2));
            float z_result = ((z1 - z2) * (z1 - z2));
            double delta = x_result + y_result + z_result;
            //return Math.Sqrt(delta);
            return 1;
        }
    }
}