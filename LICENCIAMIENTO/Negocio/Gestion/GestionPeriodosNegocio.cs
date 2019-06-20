using AccesoDatos.Gestion;
using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Gestion
{
    public class GestionPeriodosNegocio
    {
        public List<SPE_OBTIENE_K_GESTION_PERIODOS_Result> ObtienePeriodos(Guid? ID_GESTION_PERIODO = null, Guid? ID_CLIENTE = null, Guid? ID_SISTEMA = null, Guid? ID_EMPRESA = null, Guid? ID_MODULO = null, Guid? ID_VERSION = null, Guid? ID_LICENCIA = null, DateTime? FE_INICIO = null, DateTime? FE_FIN = null, int? NO_VOLUMEN = null)
        {
            GestionPeriodosOperaciones operaciones = new GestionPeriodosOperaciones();
            return operaciones.ObtenerPeriodos(ID_GESTION_PERIODO, ID_CLIENTE, ID_SISTEMA, ID_EMPRESA, ID_MODULO, ID_VERSION, ID_LICENCIA, FE_INICIO, FE_FIN, NO_VOLUMEN);
        }

        public E_RESULTADO InsertaActualizaPeriodo(E_TIPO_OPERACION_DB tipoTransaccion, E_GESTION_PERIODO vPeriodo, string usuario, string programa)
        {
            GestionPeriodosOperaciones operaciones = new GestionPeriodosOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaPeriodo(tipoTransaccion, vPeriodo, usuario, programa));
        }

        public E_RESULTADO EliminaPeriodo(Guid? ID_GESTION_PERIODO)
        {
            GestionPeriodosOperaciones operaciones = new GestionPeriodosOperaciones();
            return new E_RESULTADO(operaciones.EliminaPeriodo(ID_GESTION_PERIODO));
        }
    }
}
