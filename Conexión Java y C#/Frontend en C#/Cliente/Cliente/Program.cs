using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cliente
{
    internal class Program
    {
        static void Main(string[] args)
        {
            AreaWS.AreaWSClient areaDao = new AreaWS.AreaWSClient();

            BindingList<AreaWS.area> areas =
                new BindingList<AreaWS.area>(areaDao.listarTodas());

            foreach (AreaWS.area area in areas)
            {
                System.Console.WriteLine(area.id + ". " + area.nombre);
            }
        }
    }
}
