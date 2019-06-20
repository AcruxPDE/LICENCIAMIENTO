using Entidades.Administracion;
using Entidades.Externas;
using Negocio.Administracion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Comunes;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        private const int TICKET_VERSION = 1;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UsuarioNegocio nUsuario = new UsuarioNegocio();

            E_USUARIO vUsuario = nUsuario.AutenticaUsuario(txtUsuario.Value, txtPassword.Value);

            if (vUsuario.FG_ACTIVO)
            {
                if (vUsuario.oFunciones != null)
                {
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(TICKET_VERSION, FormsAuthentication.FormsCookieName, DateTime.Now, DateTime.Now.AddMinutes(FormsAuthentication.Timeout.TotalMinutes), false, string.Empty, FormsAuthentication.FormsCookiePath);//FormsAuthentication.Timeout.TotalMinutes
                    string cookie = FormsAuthentication.Encrypt(ticket);
                    Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, cookie));
                    Session["UniqueUserId"] = Guid.NewGuid();
                    ContextoUsuario.oUsuario = vUsuario;
                    var rol = ContextoUsuario.oUsuario.oRol.NB_ROL;
                    //Determinar si solo tiene la funcion de PDE enviar a PDE                    
                    if (vUsuario.oFunciones.Where(x => x.CL_FUNCION.Substring(0, 1) != "P" && x.CL_FUNCION != "Q" && x.CL_FUNCION != "E").Count() == 0)
                    {
                        //Response.Redirect("/PDE/VentanaInicioPDE.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    UtilMensajes.MensajeResultadoDB(RadWindowManager1, "El rol del usuario no tiene permisos.", E_TIPO_RESPUESTA_DB.WARNING);
                }
            }
            else
            {
                UtilMensajes.MensajeResultadoDB(RadWindowManager1, "El usuario o la contraseña son incorrectos.", E_TIPO_RESPUESTA_DB.WARNING);
            }
        }
    }
}