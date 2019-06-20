using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace AccesoDatos.Administracion
{
    public class SistemasOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List <SPE_OBTIENE_C_SISTEMA_Result> ObtenerSistemas(Guid? ID_SISTEMA = null, string CL_SISTEMA = null, string NB_SISTEMA = null, string CL_TIPO = null, string DS_SISTEMA = null)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_C_SISTEMA(ID_SISTEMA, CL_SISTEMA, NB_SISTEMA, CL_TIPO, DS_SISTEMA).ToList();
            }
        }

        public XElement InsertaActualizaSistema(E_TIPO_OPERACION_DB tipoTransaccion, E_SISTEMA vSistema, string usuario, string programa)
        {

            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_SISTEMA(pOutClRetorno, vSistema.ID_SISTEMA, vSistema.CL_SISTEMA, vSistema.NB_SISTEMA, vSistema.CL_TIPO, vSistema.DS_SISTEMA, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public XElement EliminaSistema(Guid idSistema)
        {

            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_SISTEMA(pOutClRetorno, idSistema);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
