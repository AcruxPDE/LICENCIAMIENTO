using Entidades;
using Entidades.Externas;
using Negocio.Administracion;
using Negocio.Gestion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebApp.Comunes;

namespace WebApp.Gestion
{
    public partial class GestionPeriodos : System.Web.UI.Page
    {
        Guid? idPeriodo;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private Guid? idCliente
        {
            get { return (Guid?)ViewState["vsIdCliente"]; }
            set { ViewState["vsIdCliente"] = value; }
        }

        private List<E_GESTION_PERIODO> lstGestionPeriodos
        {
            get { return (List<E_GESTION_PERIODO>)ViewState["vslstGestionPeriodos"]; }
            set { ViewState["vslstGestionPeriodos"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                idCliente = Guid.NewGuid();
                ClienteNegocio clienteNeg = new ClienteNegocio();
                rcbCliente.DataSource = clienteNeg.ObtieneClientes();
                rcbCliente.DataValueField = "ID_CLIENTE";
                rcbCliente.DataTextField = "NB_CLIENTE";
                rcbCliente.DataBind();
            }
        }

        protected void grdPeriodos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GestionPeriodosNegocio neg = new GestionPeriodosNegocio();
            grdPeriodos.DataSource = neg.ObtienePeriodos(ID_CLIENTE:idCliente);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GestionPeriodosNegocio neg = new GestionPeriodosNegocio();
            GridDataItem item = grdPeriodos.SelectedItems[0] as GridDataItem;
            idPeriodo = Guid.Parse(item.GetDataKeyValue("ID_GESTION_PERIODO").ToString());
            E_RESULTADO resultado = neg.EliminaPeriodo(idPeriodo);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdPeriodos.Rebind();
        }

        protected void rcbCliente_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
           idCliente = Guid.Parse(rcbCliente.SelectedValue);
           grdPeriodos.Rebind();
        }
    }
}