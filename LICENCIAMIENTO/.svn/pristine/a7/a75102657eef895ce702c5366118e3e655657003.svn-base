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
    public class EmpresaNegocio
    {
        public List<SPE_OBTIENE_C_EMPRESA_Result> ObtenerEmpresas(Guid? ID_EMPRESA = null, string CL_EMPRESA = null, string NB_EMPRESA = null, string DS_EMPRESA = null)
        {
            EmpresaOperaciones operaciones = new EmpresaOperaciones();
            return operaciones.ObtenerEmpresas(ID_EMPRESA, CL_EMPRESA, NB_EMPRESA, DS_EMPRESA);
        }

        public E_RESULTADO InsertaActualizaEmpresa(E_TIPO_OPERACION_DB tipoTransaccion, E_EMPRESA vEmpresa, string usuario, string programa)
        {
            EmpresaOperaciones operaciones = new EmpresaOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaEmpresa(tipoTransaccion, vEmpresa, usuario, programa));
        }

        public E_RESULTADO EliminaEmpresa(Guid? ID_EMPRESA)
        {
            EmpresaOperaciones operaciones = new EmpresaOperaciones();
            return new E_RESULTADO(operaciones.EliminaEmpresa(ID_EMPRESA));
        }

    }
}
