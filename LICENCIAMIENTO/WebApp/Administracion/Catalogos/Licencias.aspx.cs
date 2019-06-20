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
    public partial class Licencias : System.Web.UI.Page
    {
        Guid? idLicencia;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void grdLicencias_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LicenciaNegocio neg = new LicenciaNegocio();
            grdLicencias.DataSource = neg.ObtenerLicencias();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridDataItem item = grdLicencias.SelectedItems[0] as GridDataItem;
            idLicencia = Guid.Parse(item.GetDataKeyValue("ID_LICENCIA").ToString());
            LicenciaNegocio neg = new LicenciaNegocio();
            E_RESULTADO resultado = neg.EliminaLicencia(idLicencia);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdLicencias.Rebind();
        }
    }
}