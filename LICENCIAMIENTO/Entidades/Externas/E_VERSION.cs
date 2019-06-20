using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Externas
{
    [Serializable]
    public class E_VERSION
    {
        public System.Guid? ID_VERSION { get; set; }
        public decimal? NO_RELEASE { get; set; }
        public string DS_VERSION { get; set; }
        public System.Guid? ID_MODULO { get; set; }
        public string NB_MODULO { get; set; }
        public string CL_MODULO { get; set; }
    }
}
