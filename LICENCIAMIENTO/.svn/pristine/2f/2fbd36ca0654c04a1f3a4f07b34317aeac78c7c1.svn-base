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
    public partial class VentanaSistemas : System.Web.UI.Page
    {
        string usuario;
        string programa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idSistema
        {
            get { return (Guid?)ViewState["vs_idSistema"]; }
            set { ViewState["vs_idSistema"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["SistemaId"] != null)
                {
                    idSistema = Guid.Parse(Request.QueryString["SistemaId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                }
                else
                {
                    idSistema = null;
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                SistemasNegocio neg = new SistemasNegocio();
                E_SISTEMA sistema = new E_SISTEMA();
                sistema.CL_SISTEMA = txtClave.Text;
                sistema.CL_TIPO = rcbTipoSist.SelectedValue;
                sistema.NB_SISTEMA = txtNombre.Text;
                sistema.DS_SISTEMA = txtDescripcion.Text;
                sistema.ID_SISTEMA = idSistema;
                E_RESULTADO resultado = neg.InsertaActualizaSistema(vClOperacion, sistema, usuario, programa);
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
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese la clave", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (txtNombre.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el nombre", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (txtDescripcion.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese una descripción", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbTipoSist.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccioine el tipo de sistema", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            return valida;
        }

        public void CargarDatos()
        {
            SistemasNegocio neg = new SistemasNegocio();
            SPE_OBTIENE_C_SISTEMA_Result resultado = neg.ObtieneSistemas(idSistema).FirstOrDefault();
            txtClave.Text = resultado.CL_SISTEMA;
            txtNombre.Text = resultado.NB_SISTEMA;
            txtDescripcion.Text = resultado.DS_SISTEMA;
            rcbTipoSist.SelectedValue = resultado.CL_TIPO;
            rcbTipoSist.Text = resultado.CL_TIPO;
        }
    }
}