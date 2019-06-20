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
    public partial class VentanaVersiones : System.Web.UI.Page
    {
        string usuario;
        string programa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idVersion
        {
            get { return (Guid?)ViewState["vs_idVersion"]; }
            set { ViewState["vs_idVersion"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["VersionId"] !=null)
                {
                    idVersion = Guid.Parse(Request.QueryString["VersionId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                }else
                {
                    idVersion = null;
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                }

                ModuloNegocio mneg = new ModuloNegocio();
                rcbModulo.DataSource = mneg.ObtieneModulos();
                rcbModulo.DataTextField = "NB_MODULO";
                rcbModulo.DataValueField = "ID_MODULO";
                rcbModulo.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                VersionesNegocio neg = new VersionesNegocio();
                E_VERSION version = new E_VERSION();
                version.ID_VERSION = idVersion;
                version.NO_RELEASE = decimal.Parse(txtRelease.Text);
                version.DS_VERSION = txtDescripcion.Text;
                version.ID_MODULO = Guid.Parse(rcbModulo.SelectedValue);

                E_RESULTADO resultado = neg.InsertaActualizaVersion(vClOperacion, version, usuario, programa);
                string vMensaje= resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE;
                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE);
            }
        }

        public bool Valida()
        {
            bool valida = true;

            if (rcbModulo.SelectedValue=="" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un módulo", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtRelease.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el número de release", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtDescripcion.Text == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese una descripción", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            return valida;
        }

        public void CargarDatos()
        {
            VersionesNegocio neg = new VersionesNegocio();
            ModuloNegocio mod = new ModuloNegocio();
            SPE_OBTIENE_C_VERSION_Result resultado = neg.ObtenerVersiones(idVersion).FirstOrDefault();
            txtDescripcion.Text = resultado.DS_VERSION;
            txtRelease.Text = resultado.NO_RELEASE.ToString();
            rcbModulo.SelectedValue = resultado.ID_MODULO.ToString();
            rcbModulo.Text = (mod.ObtieneModulos(resultado.ID_MODULO).FirstOrDefault().NB_MODULO);
        }
    }
}