using AccesoDatos.Administracion;
using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Administracion
{
    public class ModuloNegocio
    {
        public List<SPE_OBTIENE_C_MODULO_Result> ObtieneModulos(Guid? ID_MODULO = null, string CL_MODULO = null, string NB_MODULO = null, string DS_MODULO = null, Guid? ID_SISTEMA = null, string CL_SISTEMA = null, string NB_SISTEMA = null)
        {
            ModuloOperaciones operaciones = new ModuloOperaciones();
            return operaciones.ObtenerModulos(ID_MODULO, CL_MODULO, NB_MODULO, DS_MODULO, ID_SISTEMA, CL_SISTEMA, NB_SISTEMA);
        }

        public E_RESULTADO InsertaActualizaSistema(E_TIPO_OPERACION_DB tipoTransaccion, E_MODULO vModulo, string usuario, string programa)
        {
            ModuloOperaciones operaciones = new ModuloOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaModulo(tipoTransaccion, vModulo, usuario, programa));
        }

        public E_RESULTADO EliminaModulo(Guid? idModulo)
        {
            ModuloOperaciones operaciones = new ModuloOperaciones();
            return new E_RESULTADO(operaciones.EliminarModulo(idModulo));
        }
    }
}
