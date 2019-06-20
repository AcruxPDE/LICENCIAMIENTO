using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebApp.Comunes;
using Negocio.Administracion;

namespace WebApp.Administracion.Catalogos
{
    public partial class Clientes : System.Web.UI.Page
    {
        Guid idCliente;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private List<E_CLIENTES> vClientes
        {
            get { return (List<E_CLIENTES>)ViewState["vsClientes"]; }
            set { ViewState["vsClientes"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                vClientes = new List<E_CLIENTES>();
            }
        }

        protected void grdClientes_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ClienteNegocio neg = new ClienteNegocio();
            vClientes = neg.ObtieneClientes();
            grdClientes.DataSource = vClientes;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ClienteNegocio neg = new ClienteNegocio();
            GridDataItem item = grdClientes.SelectedItems[0] as GridDataItem;
            idCliente = Guid.Parse(item.GetDataKeyValue("ID_CLIENTE").ToString());
            E_RESULTADO resultado = neg.EliminaCliente(idCliente);
            string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE; ;
            UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE, pCallBackFunction: null);
            grdClientes.Rebind();
        }

        protected void grdClientes_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                //Get the instance of the right type
                GridDataItem dataBoundItem = e.Item as GridDataItem;
                Guid? idCliente = Guid.Parse(dataBoundItem.GetDataKeyValue("ID_CLIENTE").ToString());
                RadLabel lblTelefonos = (RadLabel)e.Item.FindControl("lblDescTelefonos");
                lblTelefonos.Text = getTelefonos(idCliente);
            }
        }

        public string getTelefonos(Guid? pIdCliente)
        {
            string resultado = string.Empty;

            var Cliente = vClientes.Where(w => w.ID_CLIENTE == pIdCliente).FirstOrDefault();
            if (Cliente != null)
            {
                resultado = Cliente.DS_TELEFONOS;
            }

            return resultado;
        }
    }
}