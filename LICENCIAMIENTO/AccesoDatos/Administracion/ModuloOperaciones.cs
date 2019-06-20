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
    public class ModuloOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_C_MODULO_Result> ObtenerModulos (Guid? ID_MODULO = null, string CL_MODULO= null, string NB_MODULO= null, string DS_MODULO= null, Guid? ID_SISTEMA = null, string CL_SISTEMA= null, string NB_SISTEMA= null)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_C_MODULO(ID_MODULO, CL_MODULO, NB_MODULO, DS_MODULO, ID_SISTEMA, CL_SISTEMA, NB_SISTEMA).ToList();
            }
        }


        public XElement InsertaActualizaModulo(E_TIPO_OPERACION_DB tipoTransaccion, E_MODULO vModulo, string usuario, string programa)
        {

            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_MODULO(pOutClRetorno, vModulo.ID_MODULO, vModulo.CL_MODULO, vModulo.NB_MODULO, vModulo.DS_MODULO, vModulo.ID_SISTEMA, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public XElement EliminarModulo(Guid? idModulo)
        {

            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_MODULO(pOutClRetorno, idModulo);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
