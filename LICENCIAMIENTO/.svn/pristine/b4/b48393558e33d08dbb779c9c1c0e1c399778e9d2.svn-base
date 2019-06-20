using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos.WS
{
    public class LicenciamientoOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        //public SPE_OBTIENE_LICENCIAMIENTO_Result obtieneLicenciamiento(string clCliente = null, string clPassword=null, string clSistema = null, string clEmpresa = null, string clModulo = null, decimal? noVersion = null, string clLicencia = null)
        //{
        //    using (context= new ACRUXLICENCIAMIENTOEntities())
        //    {
        //        return context.SPE_OBTIENE_LICENCIAMIENTO(clCliente, clPassword, clSistema, clEmpresa, clModulo, noVersion, clLicencia).FirstOrDefault();
        //    }
        //}

        public SPE_OBTIENE_INFORMACION_CLIENTE_Result generaXmlIdentificacion(string clCliente, string clPassword)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_INFORMACION_CLIENTE(clCliente, clPassword).FirstOrDefault();
            }
        }

        public SPE_OBTIENE_LICENCIAS_Result ObtieneLicenciasXml(string clCliente, string clPassword)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_LICENCIAS(clCliente, clPassword).FirstOrDefault();
            }
        }
    }
}
