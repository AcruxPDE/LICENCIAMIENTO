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
    public class LicenciaNegocio
    {
        public List<SPE_OBTIENE_C_LICENCIA_Result> ObtenerLicencias(Guid? ID_LICENCIA = null, string CL_LICENCIA = null, string NB_LICENCIA = null, bool? FG_PERIODO = null, bool? FG_VOLUMEN = null, string DS_LICENCIA = null)
        {
            LicenciaOperaciones operaciones = new LicenciaOperaciones();
            return operaciones.ObtenerLicencias(ID_LICENCIA, CL_LICENCIA, NB_LICENCIA, FG_PERIODO, FG_VOLUMEN, DS_LICENCIA);
        }

        public E_RESULTADO InsertaActualizaLicencia(E_TIPO_OPERACION_DB tipoTransaccion, E_LICENCIA vLicencia, string usuario, string programa)
        {
            LicenciaOperaciones operaciones = new LicenciaOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaLicencia(tipoTransaccion, vLicencia, usuario, programa));
        }

        public E_RESULTADO EliminaLicencia(Guid? ID_LICENCIA)
        {
            LicenciaOperaciones operaciones = new LicenciaOperaciones();
            return new E_RESULTADO(operaciones.EliminaLicencia(ID_LICENCIA));
        }
    }
}
