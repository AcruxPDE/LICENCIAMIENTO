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
    public class VersionesNegocio
    {
        public List<SPE_OBTIENE_C_VERSION_Result> ObtenerVersiones(Guid? ID_VERSION = null, Guid? ID_MODULO = null, decimal? NO_RELEASE = null, string DS_VERSION = null)
        {
            VersionesOperaciones operaciones = new VersionesOperaciones();
            return operaciones.ObtenerVersiones(ID_VERSION, ID_MODULO, NO_RELEASE, DS_VERSION);
        }

        public E_RESULTADO InsertaActualizaVersion(E_TIPO_OPERACION_DB tipoTransaccion, E_VERSION version, string usuario, string programa)
        {
            VersionesOperaciones operaciones = new VersionesOperaciones();
            return new E_RESULTADO (operaciones.InsertaActualizaVersion(tipoTransaccion, version, usuario, programa));
        }

        public E_RESULTADO EliminaVersion(Guid? ID_VERSION)
        {
            VersionesOperaciones operaciones = new VersionesOperaciones();
            return new E_RESULTADO(operaciones.EliminaVersion(ID_VERSION));
        }
    }
}
