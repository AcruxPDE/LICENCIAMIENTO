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
    public partial class Sistemas : System.Web.UI.Page
    {
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;
        Guid idSistema;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void grdSistemas_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            SistemasNegocio neg = new SistemasNegocio();
            grdSistemas.DataSource = neg.ObtieneSistemas();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridDataItem item = grdSistemas.SelectedItems[0] as GridDataItem;
            idSistema = Guid.Parse(item.GetDataKeyValue("ID_SISTEMA").ToString());
            SistemasNegocio neg = new SistemasNegocio();
            E_RESULTADO resultado = neg.EliminaSistema(idSistema);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdSistemas.Rebind();
        }
    }
}