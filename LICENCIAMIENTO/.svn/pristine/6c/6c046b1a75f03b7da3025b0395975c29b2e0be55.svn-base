using Entidades;
using Entidades.Externas;
using Negocio.Administracion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Comunes;

namespace WebApp.Administracion.Catalogos
{
    public partial class VentanaModulos : System.Web.UI.Page
    {
        string usuario;
        string programa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idModulo
        {
            get { return (Guid?)ViewState["vs_idModulo"]; }
            set { ViewState["vs_idModulo"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ModuloId"] != null)
                {
                    idModulo = Guid.Parse(Request.QueryString["ModuloId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                }
                else
                {
                    idModulo = null;
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                }
                SistemasNegocio sneg = new SistemasNegocio();
                rcbSistema.DataSource = sneg.ObtieneSistemas();
                rcbSistema.DataTextField = "NB_SISTEMA";
                rcbSistema.DataValueField = "ID_SISTEMA";
                rcbSistema.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                ModuloNegocio neg = new ModuloNegocio();
                E_MODULO modulo = new E_MODULO();
                modulo.ID_MODULO = idModulo;
                modulo.CL_MODULO = txtClave.Text;
                modulo.NB_MODULO = txtNombre.Text;
                modulo.DS_MODULO = txtDescripcion.Text;
                modulo.ID_SISTEMA = Guid.Parse(rcbSistema.SelectedValue);
                E_RESULTADO resultado = neg.InsertaActualizaSistema(vClOperacion, modulo, usuario, programa);
                string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE);

            }
        }

        public bool Valida()
        {
            bool valida = true;

            if (txtClave.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese una clave", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtDescripcion.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese una descripción", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtNombre.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese un nombre", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (rcbSistema.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un sistema", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            return valida;
        }

        public void CargarDatos()
        {
            ModuloNegocio neg = new ModuloNegocio();
            SistemasNegocio sneg = new SistemasNegocio();

            SPE_OBTIENE_C_MODULO_Result resultado = neg.ObtieneModulos(idModulo).FirstOrDefault();
            txtClave.Text = resultado.CL_MODULO;
            txtDescripcion.Text = resultado.DS_MODULO;
            txtNombre.Text = resultado.NB_MODULO;
            rcbSistema.SelectedValue = resultado.ID_SISTEMA.ToString();
            rcbSistema.Text = (sneg.ObtieneSistemas(resultado.ID_SISTEMA).FirstOrDefault().NB_SISTEMA);
        }
    }
}