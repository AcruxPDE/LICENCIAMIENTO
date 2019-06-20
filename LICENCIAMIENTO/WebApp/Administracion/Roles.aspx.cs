using Entidades.Externas;
using Negocio.Administracion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebApp.Comunes;

namespace WebApp.Administracion
{
    public partial class Roles : System.Web.UI.Page
    {
        private string vClUsuario;
        private string vNbPrograma;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        protected void Page_Load(object sender, EventArgs e)
        {
            vClUsuario = ContextoUsuario.oUsuario.CL_USUARIO;
            vNbPrograma = ContextoUsuario.nbPrograma;
        }

        protected void grdRoles_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RolNegocio nRol = new RolNegocio();
            grdRoles.DataSource = nRol.ObtieneRoles(null);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            RolNegocio nRol = new RolNegocio();

            foreach (GridDataItem item in grdRoles.SelectedItems)
            {
                E_RESULTADO vResultado = nRol.EliminaRol(int.Parse(item.GetDataKeyValue("ID_ROL").ToString()), vClUsuario, vNbPrograma);
                string vMensaje = vResultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;

                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, vResultado.CL_TIPO_MENSAJE, pCallBackFunction: "onCloseWindow");
            }
        }

    }
}