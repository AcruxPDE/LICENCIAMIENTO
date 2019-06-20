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
    public class LicenciaOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_C_LICENCIA_Result> ObtenerLicencias(Guid? ID_LICENCIA = null, string CL_LICENCIA = null, string NB_LICENCIA = null, bool? FG_PERIODO = null, bool? FG_VOLUMEN= null, string DS_LICENCIA = null)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_C_LICENCIA(ID_LICENCIA, CL_LICENCIA, NB_LICENCIA, FG_PERIODO, FG_VOLUMEN, DS_LICENCIA).ToList();
            }
        }


        public XElement InsertaActualizaLicencia(E_TIPO_OPERACION_DB tipoTransaccion, E_LICENCIA vLicencia, string usuario, string programa)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_LICENCIA(pOutClRetorno, vLicencia.ID_LICENCIA, vLicencia.CL_LICENCIA, vLicencia.NB_LICENCIA, vLicencia.FG_PERIODO, vLicencia.FG_VOLUMEN, vLicencia.DS_LICENCIA, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public XElement EliminaLicencia(Guid? ID_LICENCIA)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_LICENCIA(pOutClRetorno, ID_LICENCIA);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
