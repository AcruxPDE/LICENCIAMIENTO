using AccesoDatos.Administracion;
using Entidades;
using Entidades.Externas;
using Negocio.Utilerias;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Negocio.Administracion
{
    public class ClienteNegocio
    {
        public List<E_CLIENTES> ObtieneClientes(Guid? ID_CLIENTE = null, string CL_CLIENTE = null, string NB_CLIENTE = null, string NB_CONTACTO = null, string CL_EMAIL = null, string NB_EJECUTIVO_CUENTA = null)
        {
            List<E_CLIENTES> lstClientes = new List<E_CLIENTES>();
            ClienteOperaciones op = new ClienteOperaciones();
            List<SPE_OBTIENE_C_CLIENTES_Result> vLstClientes = op.ObtenerClientes(ID_CLIENTE, CL_CLIENTE, NB_CLIENTE, NB_CONTACTO, CL_EMAIL, NB_EJECUTIVO_CUENTA);

            if (vLstClientes!=null)
            {
                lstClientes = vLstClientes.Select(item => new E_CLIENTES
                {
                   ID_CLIENTE=item.ID_CLIENTE,
                   CL_CLIENTE= item.CL_CLIENTE,
                   CL_PASS=item.CL_PASSWORD,
                   NB_CLIENTE=item.NB_CLIENTE,
                   NB_CONTACTO= item.NB_CONTACTO,
                   CL_EMAIL= item.CL_EMAIL,
                   TELEFONOS= obtieneTelefonos(item.XML_TELEFONOS),
                   NB_EJECUTIVO_CUENTA= item.NB_EJECUTIVO_CUENTA,
                   DS_TELEFONOS=getLabelTransitionsList(obtieneTelefonos(item.XML_TELEFONOS))
                }).ToList();
            }

            return lstClientes;
        }

        public List<E_TELEFONOS> obtieneTelefonos(String telefonos)
        {
            List<E_TELEFONOS> lstTelefonos = new List<E_TELEFONOS>();
            if (telefonos != null && telefonos != string.Empty)
            {
                XElement xmlTelefonos = XElement.Parse(telefonos);

                if (UtilXML.ValidaRamaXml(xmlTelefonos, "TELEFONO"))
                {
                    lstTelefonos = xmlTelefonos.Elements("TELEFONO").Select(el => new E_TELEFONOS
                    {
                        ID_TELEFONO = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_TELEFONO")),
                        CL_TIPO = UtilXML.ValorAtributo<string>(el.Attribute("CL_TIPO")),
                        NO_TELEFONO = UtilXML.ValorAtributo<string>(el.Attribute("NO_TELEFONO")),
                       
                    }
                    ).ToList();
                }
            }
            return lstTelefonos;
        }

        public List<E_EMPRESA> obtieneEmpresas(String Catalogos)
        {
            List<E_EMPRESA> lstEmpresas = new List<E_EMPRESA>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlEmpresa = XElement.Parse(Catalogos).Element("EMPRESAS");

                if (UtilXML.ValidaRamaXml(xmlEmpresa, "EMPRESA"))
                {
                    lstEmpresas = xmlEmpresa.Elements("EMPRESA").Select(el => new E_EMPRESA
                    {
                        ID_EMPRESA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_EMPRESA")),
                        CL_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("CL_EMPRESA")),
                        NB_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("NB_EMPRESA")),

                    }
                    ).ToList();
                }
            }
            return lstEmpresas;
        }

        public List<E_EMPRESA> obtieneEmpresasCliente(String Catalogos)
        {
            List<E_EMPRESA> lstEmpresas = new List<E_EMPRESA>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlEmpresa = XElement.Parse(Catalogos).Element("CLIENTE_EMPRESAS");

                if (UtilXML.ValidaRamaXml(xmlEmpresa, "CLIENTE_EMPRESA"))
                {
                    lstEmpresas = xmlEmpresa.Elements("CLIENTE_EMPRESA").Select(el => new E_EMPRESA
                    {
                        ID_EMPRESA_CLIENTE = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_EMPRESA_CLIENTE")),
                        ID_EMPRESA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_EMPRESA")),
                        CL_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("CL_EMPRESA")),
                        NB_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("NB_EMPRESA")),

                    }
                    ).ToList();
                }
            }
            return lstEmpresas;
        }


        public string getLabelTransitionsList(List<E_TELEFONOS> pTransitions)
        {
            string start = "<ul>";
            string end = "</ul >";
            string body = string.Empty;

            foreach (var item in pTransitions)
            {
                body += "<li>" + item.CL_TIPO +" - " +item.NO_TELEFONO+"</li>";
            }
            return (pTransitions.Count > 0) ? (start + body + end) : string.Empty;
        }

        public E_RESULTADO InsertaActualizaClientes(E_TIPO_OPERACION_DB tipoTransaccion, E_CLIENTES vCliente, string xmlElemento, string xmlEmpresas, string usuario, string programa)
        {
            ClienteOperaciones operaciones = new ClienteOperaciones();
            return new E_RESULTADO(operaciones.InsertaActualizaClientes(tipoTransaccion, vCliente, xmlElemento,xmlEmpresas, usuario, programa));
        }

        public E_RESULTADO EliminaCliente(Guid idCliente)
        {
            ClienteOperaciones operaciones = new ClienteOperaciones();
            return new E_RESULTADO(operaciones.EliminarCliente(idCliente));
        }

        public List<E_CLIENTES> ObtieneClientesCatalogos(Guid? ID_CLIENTE = null)
        {
            List<E_CLIENTES> lstClientes = new List<E_CLIENTES>();
            ClienteOperaciones op = new ClienteOperaciones();
            List<SPE_OBTIENE_CLIENTE_CATALOGOS_Result> vLstClientes = op.ObtenerClientesCatalogos(ID_CLIENTE);

            if (vLstClientes != null)
            {
                lstClientes = vLstClientes.Select(item => new E_CLIENTES
                {
                    ID_CLIENTE = item.ID_CLIENTE,
                    CL_CLIENTE = item.CL_CLIENTE,
                    CL_PASS = item.CL_PASSWORD,
                    NB_CLIENTE = item.NB_CLIENTE,
                    NB_CONTACTO = item.NB_CONTACTO,
                    CL_EMAIL = item.CL_EMAIL,
                    TELEFONOS = obtieneTelefonos(item.XML_TELEFONOS),
                    NB_EJECUTIVO_CUENTA = item.NB_EJECUTIVO_CUENTA,
                    DS_TELEFONOS = getLabelTransitionsList(obtieneTelefonos(item.XML_TELEFONOS)),
                    EMPRESAS=obtieneEmpresas(item.CATALOGOS),
                    CLIENTE_EMPRESAS= obtieneEmpresasCliente(item.CATALOGOS)
                }).ToList();
            }

            return lstClientes;
        }
    }
}
