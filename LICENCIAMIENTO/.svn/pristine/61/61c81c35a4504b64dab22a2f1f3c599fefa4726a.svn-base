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
    public partial class VentanaLicencias : System.Web.UI.Page
    {
        string usuario;
        string programa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idLicencia
        {
            get { return (Guid?)ViewState["vsIdLicencias"]; }
            set { ViewState["vsIdLicencias"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["LicenciaId"]!=null)
                {
                    idLicencia = Guid.Parse(Request.QueryString["LicenciaId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                }else
                {
                    idLicencia = null;
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                LicenciaNegocio neg = new LicenciaNegocio();
                E_LICENCIA vLicencia = new E_LICENCIA();
                vLicencia.ID_LICENCIA = idLicencia;
                vLicencia.CL_LICENCIA = txtClave.Text;
                vLicencia.NB_LICENCIA = txtNombre.Text;
                vLicencia.DS_LICENCIA = txtNombre.Text;
                vLicencia.FG_PERIODO = chkPeriodo.Checked;
                vLicencia.FG_VOLUMEN = chkVolumen.Checked;
                E_RESULTADO resultado = neg.InsertaActualizaLicencia(vClOperacion, vLicencia, usuario, programa);
                string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE);
            }
        }

        public bool Valida()
        {
            bool valida = true;

            if (txtClave.Text=="" && valida)
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
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese la descripción", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (chkVolumen.Checked == false && chkPeriodo.Checked == false )
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un tipo de licencia", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            return valida;
        }

        public void CargarDatos()
        {
            LicenciaNegocio neg = new LicenciaNegocio();
            SPE_OBTIENE_C_LICENCIA_Result resultado = neg.ObtenerLicencias(idLicencia).FirstOrDefault();
            txtClave.Text = resultado.CL_LICENCIA;
            txtNombre.Text = resultado.NB_LICENCIA;
            txtDescripcion.Text = resultado.DS_LICENCIA;
            if (resultado.FG_PERIODO=="SI")
            {
                chkPeriodo.Checked = true;
            }
            if (resultado.FG_VOLUMEN=="SI")
            {
                chkVolumen.Checked = true;
            }
        }
    }
}