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
    public partial class Modulos : System.Web.UI.Page
    {
        Guid? idModulo;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridDataItem item = grdModulos.SelectedItems[0] as GridDataItem;
            idModulo = Guid.Parse(item.GetDataKeyValue("ID_MODULO").ToString());
            ModuloNegocio neg = new ModuloNegocio();
            E_RESULTADO resultado = neg.EliminaModulo(idModulo);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdModulos.Rebind();
        }

        protected void grdModulos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ModuloNegocio neg = new ModuloNegocio();
            grdModulos.DataSource = neg.ObtieneModulos();
        }
    }
}