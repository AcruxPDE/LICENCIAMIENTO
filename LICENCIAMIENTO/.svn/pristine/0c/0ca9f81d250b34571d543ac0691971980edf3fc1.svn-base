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
    public partial class VentanaGestion : System.Web.UI.Page
    {
        string usuario;
        string programa;
        E_IDIOMA_ENUM vClIdimoma= E_IDIOMA_ENUM.ES;

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idPeriodo
        {
            get { return (Guid?)ViewState["vs_idModulo"]; }
            set { ViewState["vs_idModulo"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;

            if (!IsPostBack)
            {
                if (Request.QueryString["PeriodoId"]!=null)
                {
                    idPeriodo = Guid.Parse(Request.QueryString["PeriodoId"]);
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                    CargarDatos();
                }else
                {
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                    ClienteNegocio cliente = new ClienteNegocio();
                    SistemasNegocio sistema = new SistemasNegocio();
                    rcbCliente.DataSource = cliente.ObtieneClientes();
                    rcbCliente.DataValueField = "ID_CLIENTE";
                    rcbCliente.DataTextField = "NB_CLIENTE";
                    rcbCliente.DataBind();
                    rcbSistema.DataSource = sistema.ObtieneSistemas();
                    rcbSistema.DataValueField = "ID_SISTEMA";
                    rcbSistema.DataTextField = "NB_SISTEMA";
                    rcbSistema.DataBind();
                }
                LicenciaNegocio licencia = new LicenciaNegocio();
                rcbLicencia.DataSource = licencia.ObtenerLicencias();
                rcbLicencia.DataValueField = "ID_LICENCIA";
                rcbLicencia.DataTextField = "NB_LICENCIA";
                rcbLicencia.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                E_GESTION_PERIODO vPeriodo = new E_GESTION_PERIODO();
                vPeriodo.ID_GESTION_PERIODO = idPeriodo;
                vPeriodo.ID_CLIENTE = Guid.Parse(rcbCliente.SelectedValue);
                vPeriodo.ID_EMPRESA = Guid.Parse(rcbEmpresa.SelectedValue);
                vPeriodo.ID_SISTEMA = Guid.Parse(rcbSistema.SelectedValue);
                vPeriodo.ID_MODULO = Guid.Parse(rcbModulo.SelectedValue);
                vPeriodo.ID_VERSION = Guid.Parse(rcbVersion.SelectedValue);
                vPeriodo.ID_LICENCIA = Guid.Parse(rcbLicencia.SelectedValue);
                vPeriodo.FE_INICIO = rdpFechaIni.SelectedDate;
                vPeriodo.FE_FIN = rdpFechafin.SelectedDate;
                if (txtVolumen.Text!="")
                {
                    vPeriodo.NO_VOLUMEN = int.Parse(txtVolumen.Text);
                }
                GestionPeriodosNegocio neg = new GestionPeriodosNegocio();
                E_RESULTADO resultado = neg.InsertaActualizaPeriodo(vClOperacion, vPeriodo, usuario, programa);
                string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdimoma.ToString())).FirstOrDefault().DS_MENSAJE;
                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE);
            }
        }

        protected void rcbCliente_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            ClienteNegocio cliente = new ClienteNegocio();
            List<E_CLIENTES> empresas = cliente.ObtieneClientesCatalogos(Guid.Parse(rcbCliente.SelectedValue));
            rcbEmpresa.Text = "";
            rcbEmpresa.SelectedValue = "";
            rcbEmpresa.DataSource = empresas[0].CLIENTE_EMPRESAS;
            rcbEmpresa.DataValueField = "ID_EMPRESA";
            rcbEmpresa.DataTextField = "NB_EMPRESA";
            rcbEmpresa.DataBind();
        }

        protected void rcbSistema_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            ModuloNegocio modulo = new ModuloNegocio();
            rcbModulo.Text = "";
            rcbModulo.SelectedValue = "";
            rcbModulo.DataSource = modulo.ObtieneModulos(ID_SISTEMA: Guid.Parse(rcbSistema.SelectedValue));
            rcbModulo.DataValueField = "ID_MODULO";
            rcbModulo.DataTextField = "NB_MODULO";
            rcbModulo.DataBind();
        }

        protected void rcbModulo_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            VersionesNegocio versiones = new VersionesNegocio();
            rcbVersion.Text = "";
            rcbVersion.SelectedValue = "";
            rcbVersion.DataSource = versiones.ObtenerVersiones(ID_MODULO: Guid.Parse(rcbModulo.SelectedValue));
            rcbVersion.DataValueField = "ID_VERSION";
            rcbVersion.DataTextField = "NO_RELEASE";
            rcbVersion.DataBind();
        }

        protected void rcbLicencia_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LicenciaNegocio licNeg = new LicenciaNegocio();
            SPE_OBTIENE_C_LICENCIA_Result resultado = licNeg.ObtenerLicencias(Guid.Parse(rcbLicencia.SelectedValue)).FirstOrDefault();
            if (resultado.FG_PERIODO == "SI")
            {
                rdpFechaIni.Enabled = true;
                rdpFechafin.Enabled = true;
            }
            else
            {
                rdpFechaIni.SelectedDate = null;
                rdpFechafin.SelectedDate = null;
                rdpFechaIni.Enabled = false;
                rdpFechafin.Enabled = false;
            }
            if (resultado.FG_VOLUMEN=="SI")
            {
                txtVolumen.Enabled = true;
            }else
            {
                txtVolumen.Enabled = false;
                txtVolumen.Text = "";
            }
        }

        public bool Valida()
        {
            bool valida = true;

            if (rcbCliente.SelectedValue=="" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un cliente", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbEmpresa.SelectedValue=="" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione una empresa", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbSistema.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un sistema", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbModulo.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un módulo", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbVersion.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione una version", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (rcbLicencia.SelectedValue == "" && valida)
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione una licencia", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            if (valida && rdpFechaIni.Enabled)
            {
                if (rdpFechaIni.SelectedDate==null || rdpFechafin.SelectedDate == null)
                {
                    valida = false;
                    UtilMensajes.MensajeDB(rwmAlertas, "Seleccione la fecha inicial y final", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
                }

                if (rdpFechafin.SelectedDate<rdpFechaIni.SelectedDate)
                {
                    valida = false;
                    UtilMensajes.MensajeDB(rwmAlertas, "La fecha final no puede ser menor a la inicial", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
                }
            }

            if (txtVolumen.Enabled && valida && txtVolumen.Text=="")
            {
                valida = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el volumen", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }
            return valida;
        }

        public void CargarDatos()
        {
            GestionPeriodosNegocio periodo = new GestionPeriodosNegocio();
            SPE_OBTIENE_K_GESTION_PERIODOS_Result resultado = periodo.ObtienePeriodos(idPeriodo).FirstOrDefault();
            ClienteNegocio clienteNeg = new ClienteNegocio();
            SistemasNegocio sistemaNeg = new SistemasNegocio();
            EmpresaNegocio empresaNeg = new EmpresaNegocio();
            ModuloNegocio moduloNeg = new ModuloNegocio();
            VersionesNegocio versionNeg = new VersionesNegocio();
            LicenciaNegocio licenciaNeg = new LicenciaNegocio();

            SPE_OBTIENE_C_LICENCIA_Result resLicencia= licenciaNeg.ObtenerLicencias(resultado.ID_LICENCIA).FirstOrDefault();

            rcbCliente.SelectedValue = resultado.ID_CLIENTE.ToString();
            rcbCliente.Text = clienteNeg.ObtieneClientes(resultado.ID_CLIENTE).FirstOrDefault().NB_CLIENTE;
            rcbCliente.Enabled = false;
            rcbSistema.SelectedValue = resultado.ID_SISTEMA.ToString();
            rcbSistema.Text = sistemaNeg.ObtieneSistemas(resultado.ID_SISTEMA).FirstOrDefault().NB_SISTEMA;
            rcbSistema.Enabled = false;
            rcbEmpresa.SelectedValue = resultado.ID_EMPRESA.ToString();
            rcbEmpresa.Text = empresaNeg.ObtenerEmpresas(resultado.ID_EMPRESA).FirstOrDefault().NB_EMPRESA;
            rcbEmpresa.Enabled = false;
            rcbModulo.SelectedValue = resultado.ID_MODULO.ToString();
            rcbModulo.Text = moduloNeg.ObtieneModulos(resultado.ID_MODULO).FirstOrDefault().NB_MODULO;
            rcbModulo.Enabled = false;
            rcbVersion.SelectedValue = resultado.ID_VERSION.ToString();
            rcbVersion.Text = versionNeg.ObtenerVersiones(resultado.ID_VERSION).FirstOrDefault().NO_RELEASE.ToString();
            rcbVersion.Enabled = false;
            rcbLicencia.SelectedValue = resultado.ID_LICENCIA.ToString();
            rcbLicencia.Text = resLicencia.NB_LICENCIA;
            rcbLicencia.Enabled = false;

            if (resLicencia.FG_PERIODO=="SI")
            {
                rdpFechaIni.Enabled = true;
                rdpFechafin.Enabled = true;
                rdpFechaIni.SelectedDate = resultado.FE_INICIO;
                rdpFechafin.SelectedDate = resultado.FE_FIN;
            }

            if (resLicencia.FG_VOLUMEN == "SI")
            {
                txtVolumen.Enabled = true;
                txtVolumen.Text = resultado.NO_VOLUMEN.ToString();
            }
        }
    }
}



