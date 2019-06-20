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

namespace WebApp.Administracion.Catalogos
{
    public partial class Versiones : System.Web.UI.Page
    {
        Guid? idVersion;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridDataItem item = grdVersiones.SelectedItems[0] as GridDataItem;
            idVersion = Guid.Parse(item.GetDataKeyValue("ID_VERSION").ToString());
            VersionesNegocio neg = new VersionesNegocio();
            E_RESULTADO resultado = neg.EliminaVersion(idVersion);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdVersiones.Rebind();
        }

        protected void grdVersiones_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            VersionesNegocio neg = new VersionesNegocio();
            grdVersiones.DataSource = neg.ObtenerVersiones();
        }
    }
}