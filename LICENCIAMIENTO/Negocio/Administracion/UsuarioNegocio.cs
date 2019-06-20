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
    public class UsuarioNegocio
    {

        public E_USUARIO AutenticaUsuario(string pClUsuario, string pClPassword)
        {
            E_USUARIO vUsuario = new E_USUARIO()
            {
                CL_USUARIO = pClUsuario,
                NB_PASSWORD = pClPassword
            };

            UsuarioOperaciones oUsuario = new UsuarioOperaciones();
            SPE_OBTIENE_USUARIO_AUTENTICACION_Result vAutenticacion = oUsuario.AutenticaUsuario(vUsuario);

            if (vAutenticacion != null && vUsuario.ValidarToken(vAutenticacion.CL_AUTENTICACION) && PasswordHash.PasswordHash.ValidatePassword(pClPassword, vAutenticacion.NB_PASSWORD))
            {
                vUsuario.NB_CORREO_ELECTRONICO = vAutenticacion.NB_CORREO_ELECTRONICO;
                vUsuario.NB_USUARIO = vAutenticacion.NB_USUARIO;
                vUsuario.FG_ACTIVO = vAutenticacion.FG_ACTIVO;
                vUsuario.ID_EMPLEADO = vAutenticacion.ID_EMPLEADO;
                vUsuario.ID_EMPLEADO_PDE = vAutenticacion.ID_EMPLEADO.ToString();
                //vUsuario.ID_PUESTO = vAutenticacion.ID_PUESTO;
                //vUsuario.ID_PUESTO_PDE = vAutenticacion.ID_PUESTO.ToString();
                vUsuario.oRol = new E_ROL() { NB_ROL = vAutenticacion.NB_ROL };
                //vUsuario.ID_EMPRESA = vAutenticacion.ID_EMPRESA;
                if (vAutenticacion.XML_DATA != null)
                    vUsuario.oFunciones = XElement.Parse(vAutenticacion.XML_DATA).Elements("FUNCION").Select(f => new E_FUNCION()
                    {
                        CL_FUNCION = f.Attribute("CL_FUNCION").Value,
                        CL_TIPO_FUNCION = f.Attribute("CL_TIPO_FUNCION").Value,
                        ID_FUNCION = (int)UtilXML.ValorAtributo(f.Attribute("ID_FUNCION"), E_TIPO_DATO.INT),
                        ID_FUNCION_PADRE = (int?)UtilXML.ValorAtributo(f.Attribute("ID_FUNCION_PADRE"), E_TIPO_DATO.INT),
                        NB_FUNCION = f.Attribute("NB_FUNCION").Value,
                        NB_URL = f.Attribute("NB_URL").Value,
                        XML_CONFIGURACION = f.Element("XML_CONFIGURACION").ToString()
                    }).OrderBy(o => o.NO_ORDEN).ToList();
            }
            return vUsuario;
        }
    }
}
