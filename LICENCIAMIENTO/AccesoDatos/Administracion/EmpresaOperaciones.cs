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
    public class EmpresaOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_C_EMPRESA_Result> ObtenerEmpresas(Guid? ID_EMPRESA = null, string CL_EMPRESA = null, string NB_EMPRESA = null, string DS_EMPRESA = null)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_C_EMPRESA(ID_EMPRESA, CL_EMPRESA, NB_EMPRESA, DS_EMPRESA).ToList();
            }
        }

        public XElement InsertaActualizaEmpresa(E_TIPO_OPERACION_DB tipoTransaccion, E_EMPRESA vEmpresa, string usuario, string programa)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_EMPRESA(pOutClRetorno, vEmpresa.ID_EMPRESA, vEmpresa.CL_EMPRESA, vEmpresa.NB_EMPRESA, vEmpresa.DS_EMPRESA, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
           }
        }

        public XElement EliminaEmpresa(Guid? ID_EMPRESA)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_EMPRESA(pOutClRetorno, ID_EMPRESA);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
