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
    public partial class Empresas : System.Web.UI.Page
    {
        Guid? idEmpresa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void grdEmpresas_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            EmpresaNegocio neg = new EmpresaNegocio();
            grdEmpresas.DataSource = neg.ObtenerEmpresas();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridDataItem item = grdEmpresas.SelectedItems[0] as GridDataItem;
            idEmpresa = Guid.Parse(item.GetDataKeyValue("ID_EMPRESA").ToString());
            EmpresaNegocio neg = new EmpresaNegocio();
            E_RESULTADO resultado = neg.EliminaEmpresa(idEmpresa);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdEmpresas.Rebind();
        }
    }
}