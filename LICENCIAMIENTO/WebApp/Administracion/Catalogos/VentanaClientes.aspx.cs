using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using WebApp.Comunes;
using Negocio.Administracion;

namespace WebApp.Administracion.Catalogos
{
    public partial class VentanaClientes : System.Web.UI.Page
    {
        string numeroTel;
        string tipoTel;
        Guid? idEmpresa;
        public Guid? idTel
        {
            get { return (Guid?)ViewState["vs_idTelefono"]; }
            set { ViewState["vs_idTelefono"] = value; }
        }

        private E_TIPO_OPERACION_DB vClOperacion
        {
            get { return (E_TIPO_OPERACION_DB)ViewState["vs_vClOperacion"]; }
            set { ViewState["vs_vClOperacion"] = value; }
        }

        public Guid? idCliente
        {
            get { return (Guid?)ViewState["vs_idCliente"]; }
            set { ViewState["vs_idCliente"] = value; }
        }

        private E_IDIOMA_ENUM vClIdioma = E_IDIOMA_ENUM.ES;
        string usuario;
        string programa;

        public List<E_TELEFONOS> lstTelefonos
        {
            get { return (List<E_TELEFONOS>)ViewState["vs_lstTelefonos"]; }
            set { ViewState["vs_lstTelefonos"] = value; }
        }

        public List<E_EMPRESA> lstEmpresas
        {
            get { return (List<E_EMPRESA>)ViewState["vsLstEmpresas"]; }
            set { ViewState["vsLstEmpresas"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            usuario = ContextoUsuario.oUsuario.CL_USUARIO;
            programa = ContextoUsuario.nbPrograma;
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ClienteId"] != null)
                {
                    idCliente = Guid.Parse(Request.QueryString["ClienteId"]);
                    CargarDatos();
                    vClOperacion = E_TIPO_OPERACION_DB.A;
                }
                else
                {
                    idCliente = null;
                    lstTelefonos = new List<E_TELEFONOS>();
                    vClOperacion = E_TIPO_OPERACION_DB.I;
                    lstEmpresas = new List<E_EMPRESA>();
                    EmpresaNegocio neg = new EmpresaNegocio();
                    rcbEmpresa.DataSource = neg.ObtenerEmpresas();
                    rcbEmpresa.DataValueField = "ID_EMPRESA";
                    rcbEmpresa.DataTextField = "NB_EMPRESA";
                    rcbEmpresa.DataBind();
                }
                idTel = null;

              
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtTelefono.Text != "" && rcbTipoTel.SelectedValue != "")
            {
                if (idTel == null)
                {
                    numeroTel = txtTelefono.Text;
                    tipoTel = rcbTipoTel.SelectedValue;
                    idTel = Guid.NewGuid();
                    lstTelefonos.Add(new E_TELEFONOS { NO_TELEFONO = numeroTel, CL_TIPO = tipoTel, ID_TELEFONO = idTel });
                    grdTelefonos.Rebind();
                }
                else
                {
                    numeroTel = txtTelefono.Text;
                    tipoTel = rcbTipoTel.SelectedValue;
                    lstTelefonos.Where(d => d.ID_TELEFONO == idTel).First().CL_TIPO = tipoTel;
                    lstTelefonos.Where(d => d.ID_TELEFONO == idTel).First().NO_TELEFONO = numeroTel;
                    grdTelefonos.Rebind();
                }
            }
            else
            {
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese telefono y tipo", E_TIPO_RESPUESTA_DB.WARNING, 400, 150, null);
            }
            txtTelefono.Text = "";
            idTel = null;
        }

        protected void grdTelefonos_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            grdTelefonos.DataSource = lstTelefonos;
        }

        public bool Valida()
        {
            bool valido = true;
            if (txtClave.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese la clave", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtContraseña.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese la contraseña", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (txtNombre.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el nombre", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);

            }
            if (txtContacto.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el contacto", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);

            }
            if (txtCorreo.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el correo", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);

            }
            if (lstTelefonos.Count < 1 && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el telefono", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);

            }
            if (txtEjecutivoCuenta.Text == "" && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese el ejecutivo de cuenta", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);

            }

            if (valido && !Utileria.ComprobarFormatoEmail(txtCorreo.Text))
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "El formato de correo no es valido", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            if (lstEmpresas.Count < 1 && valido)
            {
                valido = false;
                UtilMensajes.MensajeDB(rwmAlertas, "Ingrese una empresa", E_TIPO_RESPUESTA_DB.WARNING, pCallBackFunction: null);
            }

            return valido;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {

                E_CLIENTES vCliente = new E_CLIENTES();
                ClienteNegocio neg = new ClienteNegocio();
                vCliente.CL_CLIENTE = txtClave.Text;
                //vCliente.CL_PASS = txtContraseña.Text;
                vCliente.NB_CLIENTE = txtNombre.Text;
                vCliente.NB_CONTACTO = txtContacto.Text;
                vCliente.CL_EMAIL = txtCorreo.Text;
                vCliente.NB_EJECUTIVO_CUENTA = txtEjecutivoCuenta.Text;
                vCliente.ID_CLIENTE = idCliente;
                //vCliente.TELEFONOS = lstTelefonos;
                vCliente.CL_PASS= PasswordHash.PasswordHash.CreateHash(txtContraseña.Text);

                XElement xmlDetalle = new XElement("TELEFONOS");
                foreach (var item in lstTelefonos)
                {
                    xmlDetalle.Add(new XElement("TELEFONO"
                                 , new XAttribute("ID_TELEFONO", item.ID_TELEFONO.ToString())
                                 , new XAttribute("CL_TIPO", item.CL_TIPO.ToString())
                                 , new XAttribute("NO_TELEFONO", item.NO_TELEFONO.ToString())
                                 ));
                }

                XElement xmlEmpresas = new XElement("EMPRESAS");
                foreach (var item in lstEmpresas)
                {
                    xmlEmpresas.Add(new XElement("EMPRESA"
                                 ,new XAttribute("ID_EMPRESA", item.ID_EMPRESA.ToString())
                                 ,new XAttribute("ID_EMPRESA_CLIENTE", item.ID_EMPRESA_CLIENTE.ToString())
                                 ));
                }


                E_RESULTADO resultado = neg.InsertaActualizaClientes(vClOperacion, vCliente, xmlDetalle.ToString(), xmlEmpresas.ToString(), usuario, programa);
                string vMensaje = resultado.MENSAJE.Where(w => w.CL_IDIOMA.Equals(vClIdioma.ToString())).FirstOrDefault().DS_MENSAJE; ;

                UtilMensajes.MensajeResultadoDB(rwmAlertas, vMensaje, resultado.CL_TIPO_MENSAJE);
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (grdTelefonos.SelectedItems.Count > 0)
            {
                foreach (GridDataItem item in grdTelefonos.SelectedItems)
                {
                    txtTelefono.Text = item.GetDataKeyValue("NO_TELEFONO").ToString();
                    rcbTipoTel.SelectedValue = item.GetDataKeyValue("CL_TIPO").ToString();
                    rcbTipoTel.Text = item.GetDataKeyValue("CL_TIPO").ToString();
                    idTel = Guid.Parse(item.GetDataKeyValue("ID_TELEFONO").ToString());
                }
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (grdTelefonos.SelectedItems.Count > 0)
            {
                foreach (GridDataItem item in grdTelefonos.SelectedItems)
                {
                    idTel = Guid.Parse(item.GetDataKeyValue("ID_TELEFONO").ToString());
                    lstTelefonos.Remove(lstTelefonos.Where(d => d.ID_TELEFONO == idTel).First());
                }
                grdTelefonos.Rebind();
            }
            else
            {
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione un registro", E_TIPO_RESPUESTA_DB.WARNING, 400, 150, null);
            }
            idTel = null;
        }

        public void CargarDatos()
        {
            ClienteNegocio neg = new ClienteNegocio();
            E_CLIENTES resultado = neg.ObtieneClientesCatalogos(idCliente).FirstOrDefault();

            txtClave.Text = resultado.CL_CLIENTE;
            txtContraseña.Text = resultado.CL_PASS;
            txtContacto.Text = resultado.NB_CONTACTO;
            txtCorreo.Text = resultado.CL_EMAIL;
            txtEjecutivoCuenta.Text = resultado.NB_EJECUTIVO_CUENTA;
            txtNombre.Text = resultado.NB_CLIENTE;
            lstTelefonos = resultado.TELEFONOS;
            lstEmpresas = resultado.CLIENTE_EMPRESAS;
            rcbEmpresa.DataSource = resultado.EMPRESAS;
            rcbEmpresa.DataValueField = "ID_EMPRESA";
            rcbEmpresa.DataTextField = "NB_EMPRESA";
            rcbEmpresa.DataBind();
        }

        protected void btnAgregarEmpresa_Click(object sender, EventArgs e)
        {
            if (rcbEmpresa.SelectedValue != null)
            {
                lstEmpresas.Add(new E_EMPRESA { ID_EMPRESA = Guid.Parse(rcbEmpresa.SelectedValue), NB_EMPRESA = rcbEmpresa.Text, ID_EMPRESA_CLIENTE = Guid.NewGuid() });
            }
            grdEmpresas.Rebind();
        }

        protected void grdEmpresas_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            grdEmpresas.DataSource = lstEmpresas;
        }

        protected void btnEliminarEmpresa_Click(object sender, EventArgs e)
        {
            if (grdEmpresas.SelectedItems.Count>0)
            {
                GridDataItem item = grdEmpresas.SelectedItems[0] as GridDataItem;
                idEmpresa = Guid.Parse(item.GetDataKeyValue("ID_EMPRESA").ToString());
                lstEmpresas.Remove(lstEmpresas.Where(w => w.ID_EMPRESA == idEmpresa).First());
                grdEmpresas.Rebind();
            }
            else
            {
                UtilMensajes.MensajeDB(rwmAlertas, "Seleccione una empresa para eliminar", E_TIPO_RESPUESTA_DB.WARNING, 400, 150, null);
            }
        }
    }
}