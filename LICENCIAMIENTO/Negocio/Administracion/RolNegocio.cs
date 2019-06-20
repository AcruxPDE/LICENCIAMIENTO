using AccesoDatos.Administracion;
using Entidades;
using Entidades.Administracion;
using Entidades.Externas;
using Negocio.Utilerias;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Negocio.Administracion
{
    public class RolNegocio
    {

        public List<SPE_OBTIENE_ROLES_Result> ObtieneRoles(int? pIdRol)
        {
            RolOperaciones oRol = new RolOperaciones();
            return oRol.ObtenerRoles(pIdRol);
        }

        public E_RESULTADO EliminaRol(int pIdRol, string pClUsuario, string pNbPrograma)
        {
            RolOperaciones oRol = new RolOperaciones();
            return UtilRespuesta.EnvioRespuesta(oRol.EliminarRol(pIdRol, pClUsuario, pNbPrograma));
        }

        public E_ROL ObtieneFuncionesRol(int? pIdRol)
        {
            RolOperaciones nRol = new RolOperaciones();
            SPE_OBTIENE_ROL_Result vRol = nRol.ObtieneRol(pIdRol);

            List<E_FUNCION> vFunciones = XElement.Parse(vRol.XML_AUTORIZACION).Elements("FUNCION").Select(el => new E_FUNCION
            {
                ID_FUNCION = (int?)UtilXML.ValorAtributo(el.Attribute("ID_FUNCION"), E_TIPO_DATO.INT),
                CL_FUNCION = el.Attribute("CL_FUNCION").Value,
                CL_TIPO_FUNCION = el.Attribute("CL_TIPO_FUNCION").Value,
                NB_FUNCION = el.Attribute("NB_FUNCION").Value,
                FG_SELECCIONADO = (bool)UtilXML.ValorAtributo(el.Attribute("FG_SELECCIONADO"), E_TIPO_DATO.BOOLEAN),
                ID_FUNCION_PADRE = (int?)UtilXML.ValorAtributo(el.Attribute("ID_FUNCION_PADRE"), E_TIPO_DATO.INT)
            }).ToList();

            return new E_ROL
            {
                ID_ROL = (vRol.ID_ROL < 0) ? (int?)null : vRol.ID_ROL,
                CL_ROL = vRol.CL_ROL,
                FG_ACTIVO = vRol.FG_ACTIVO,
                NB_ROL = vRol.NB_ROL,
                LST_FUNCIONES = vFunciones
            };
        }

        public E_RESULTADO InsertaActualizaRoles(E_TIPO_OPERACION_DB pClTipoOperacion, SPE_OBTIENE_C_ROL_Result pRol, XElement pXmlFunciones, string pClUsuario, string pNbPrograma)
        {
            RolOperaciones oRol = new RolOperaciones();
            return UtilRespuesta.EnvioRespuesta(oRol.InsertarActualizarRoles(pClTipoOperacion, pRol, pXmlFunciones, pClUsuario, pNbPrograma));
        }
    }
}
