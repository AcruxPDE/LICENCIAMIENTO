using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Externas
{
    [Serializable]
    public class E_LICENCIA
    {
        public System.Guid? ID_LICENCIA { get; set; }
        public string CL_LICENCIA { get; set; }
        public string NB_LICENCIA { get; set; }
        public bool? FG_PERIODO { get; set; }
        public bool? FG_VOLUMEN { get; set; }
        public string DS_LICENCIA { get; set; }
    }
}
