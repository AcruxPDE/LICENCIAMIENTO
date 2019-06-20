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
    public partial class VentanaEmpresas : System.Web.UI.Page
    {
        string usuario;
        string programa;
        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idEmpresa
        {
            get { return (Guid?)ViewState["vs_idEmpresa"]; }
            set { ViewState["vs_idEmpresa"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["EmpresaId"] != null)
                {
                    idEmpresa = Guid.Parse(Request.QueryString["EmpresaId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                } else
                {
                    idEmpresa = null;
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                E_EMPRESA empresa = new E_EMPRESA();
                EmpresaNegocio neg = new EmpresaNegocio();

                empresa.ID_EMPRESA = idEmpresa;
                empresa.CL_EMPRESA = txtClave.Text;
                empresa.DS_EMPRESA = txtDescripcion.Text;
                empresa.NB_EMPRESA = txtNombre.Text;
                E_RESULTADO resultado = neg.InsertaActualizaEmpresa(vClOperacion, empresa, usuario, programa);
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
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese la descripción", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            return valida;
        }

        public void CargarDatos()
        {
            EmpresaNegocio neg = new EmpresaNegocio();
            SPE_OBTIENE_C_EMPRESA_Result resultado = neg.ObtenerEmpresas(idEmpresa).FirstOrDefault();
            txtClave.Text = resultado.CL_EMPRESA;
            txtNombre.Text = resultado.NB_EMPRESA;
            txtDescripcion.Text = resultado.DS_EMPRESA;
        }
    }
}