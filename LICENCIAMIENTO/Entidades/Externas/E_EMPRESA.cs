using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Externas
{
    [Serializable]
    public class E_EMPRESA
    {
        public System.Guid? ID_EMPRESA { get; set; }
        public System.Guid? ID_SISTEMA { get; set; }
        public System.Guid? ID_EMPRESA_CLIENTE { get; set; }
        public string CL_EMPRESA { get; set; }
        public string NB_EMPRESA { get; set; }
        public string DS_EMPRESA { get; set; }
    }
}
