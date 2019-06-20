using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace AccesoDatos.Gestion
{
    public class GestionPeriodosOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_K_GESTION_PERIODOS_Result> ObtenerPeriodos(Guid? ID_GESTION_PERIODO = null, Guid? ID_CLIENTE= null, Guid? ID_SISTEMA = null, Guid? ID_EMPRESA = null, Guid? ID_MODULO = null, Guid? ID_VERSION = null, Guid? ID_LICENCIA = null, DateTime? FE_INICIO = null, DateTime? FE_FIN = null, int? NO_VOLUMEN = null)
        {
            using (context=new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_K_GESTION_PERIODOS(ID_GESTION_PERIODO, ID_CLIENTE, ID_SISTEMA, ID_EMPRESA, ID_MODULO, ID_VERSION, ID_LICENCIA, FE_INICIO, FE_FIN, NO_VOLUMEN).ToList();
            }
        }

        public XElement InsertaActualizaPeriodo(E_TIPO_OPERACION_DB tipoTransaccion, E_GESTION_PERIODO vPeriodo, string usuario, string programa)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_K_GESTION_PERIODO(pOutClRetorno, vPeriodo.ID_GESTION_PERIODO, vPeriodo.ID_CLIENTE, vPeriodo.ID_SISTEMA, vPeriodo.ID_EMPRESA, vPeriodo.ID_MODULO, vPeriodo.ID_VERSION, vPeriodo.ID_LICENCIA, vPeriodo.FE_INICIO, vPeriodo.FE_FIN, vPeriodo.NO_VOLUMEN, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public XElement EliminaPeriodo(Guid? ID_GESTION_PERIODO = null)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_K_GESTION_PERIODO(pOutClRetorno, ID_GESTION_PERIODO);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }
    }
}
