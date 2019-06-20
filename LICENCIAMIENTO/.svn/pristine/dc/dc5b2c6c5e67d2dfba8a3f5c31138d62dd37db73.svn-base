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
    public class SistemasNegocio
    {
        public List<SPE_OBTIENE_C_SISTEMA_Result> ObtieneSistemas(Guid? ID_SISTEMA = null, string CL_SISTEMA = null, string NB_SISTEMA = null, string CL_TIPO = null, string DS_SISTEMA = null)
        {
            SistemasOperaciones operaciones = new SistemasOperaciones();
            return operaciones.ObtenerSistemas(ID_SISTEMA, CL_SISTEMA, NB_SISTEMA, CL_TIPO, DS_SISTEMA);
        }

        public E_RESULTADO InsertaActualizaSistema(E_TIPO_OPERACION_DB tipoTransaccion, E_SISTEMA vSistema, string usuario, string programa)
        {
            SistemasOperaciones operaciones = new SistemasOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaSistema(tipoTransaccion, vSistema, usuario, programa));
        }

        public E_RESULTADO EliminaSistema(Guid idSistema)
        {

            SistemasOperaciones operaciones = new SistemasOperaciones();
            return new E_RESULTADO(operaciones.EliminaSistema(idSistema));
            
        }
    }

}
