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
    public class RolOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_ROLES_Result> ObtenerRoles(int? pIdRol)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_ROLES(pIdRol).ToList();
            }
        }

        public SPE_OBTIENE_ROL_Result ObtieneRol(int? pIdRol)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_ROL(pIdRol).FirstOrDefault();
            }
        }

        public XElement EliminarRol(int pIdRol, string pClUsuario, string pNbPrograma)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_ROL(pOutClRetorno, pIdRol, pClUsuario, pNbPrograma);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
        public XElement InsertarActualizarRoles(E_TIPO_OPERACION_DB pClTipoOperacion, SPE_OBTIENE_C_ROL_Result pRol, XElement pXmlFunciones, string pClUsuario, string pNbPrograma)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_ROLES(pOutClRetorno, pRol.ID_ROL, pRol.CL_ROL, pRol.NB_ROL, pRol.FG_ACTIVO, pXmlFunciones.ToString(), pClUsuario, pNbPrograma, pClTipoOperacion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
