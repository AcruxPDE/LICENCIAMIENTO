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
    public class VersionesOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_C_VERSION_Result> ObtenerVersiones (Guid? ID_VERSION= null, Guid? ID_MODULO = null, decimal? NO_RELEASE = null, string DS_VERSION = null)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_C_VERSION(ID_VERSION, ID_MODULO, NO_RELEASE, DS_VERSION).ToList();
            }
        }

        public XElement InsertaActualizaVersion(E_TIPO_OPERACION_DB tipoTransaccion, E_VERSION version, string usuario, string programa)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_VERSION(pOutClRetorno, version.ID_VERSION, version.ID_MODULO, version.NO_RELEASE, version.DS_VERSION, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public XElement EliminaVersion(Guid? idVersion)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_VERSION(pOutClRetorno, idVersion);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
