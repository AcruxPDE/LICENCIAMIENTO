using AccesoDatos.WS;
using Entidades;
using Entidades.Externas;
using Negocio.Utilerias;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Negocio.WS
{
    public class LicenciamientoNegocio
    {

        //public SPE_OBTIENE_LICENCIAMIENTO_Result obtieneLicenciamiento(string clCliente = null, string clPassword = null, string clSistema = null, string clEmpresa = null, string clModulo = null, decimal? noVersion = null, string clLicencia = null)
        //{
        //    LicenciamientoOperaciones operaciones = new LicenciamientoOperaciones();
        //    return operaciones.obtieneLicenciamiento(clCliente, clPassword, clSistema, clEmpresa, clModulo, noVersion, clLicencia);
        //}

        public SPE_OBTIENE_LICENCIAS_Result obtieneLicenciasXml(string clCliente = null, string clPassword = null)
        {
            LicenciamientoOperaciones operaciones = new LicenciamientoOperaciones();
            return operaciones.ObtieneLicenciasXml(clCliente, clPassword);
        }

        public string generaXmlIdentificacion(string clCliente, string clPassword)
        {
            LicenciamientoOperaciones operaciones = new LicenciamientoOperaciones();
            E_INFORMACION_CLIENTE vInfoCliente = new E_INFORMACION_CLIENTE();

            var Info = operaciones.generaXmlIdentificacion(clCliente,clPassword);
            if (Info.CL_CLIENTE!=null)
            {
                vInfoCliente.CL_CLIENTE = Info.CL_CLIENTE;
                vInfoCliente.CL_PASSWORD = Info.CL_PASSWORD;
                vInfoCliente.ID_CLIENTE = Info.ID_CLIENTE;
                vInfoCliente.EMPRESAS = obtieneEmpresasCliente(Info.CATALOGOS);
                vInfoCliente.SISTEMAS = obtieneSistemas(Info.CATALOGOS);
                vInfoCliente.MODULOS = obtieneModulos(Info.CATALOGOS);
                vInfoCliente.VERSIONES = obtieneVersiones(Info.CATALOGOS);
                vInfoCliente.FE_CREACION = Info.FE_CREACION;
                
                return construyeXml(vInfoCliente);
            }
            else
            {
                return "";
            }

        }

        public string construyeXml(E_INFORMACION_CLIENTE vInfoCliente)
        {
            XElement xmlLicenciamiento = new XElement("LICENCIAMIENTO", new XElement("CLIENTE", new XAttribute("CL_CLIENTE", vInfoCliente.CL_CLIENTE), new XAttribute("CL_PASSWORD", vInfoCliente.CL_PASSWORD), new XAttribute("FE_CREACION", vInfoCliente.FE_CREACION), new XElement("SISTEMAS", getSistemasXml(vInfoCliente.SISTEMAS, vInfoCliente.EMPRESAS, vInfoCliente.MODULOS, vInfoCliente.VERSIONES))));
            return xmlLicenciamiento.ToString();
        }

        public IEnumerable<XElement> getSistemasXml(List<E_SISTEMA> pSistemas, List<E_EMPRESA> pEmpresas, List<E_MODULO> pModulos, List<E_VERSION> pVersiones)
        {
            var xmlSistemas = pSistemas.Select(s =>
                new XElement("SISTEMA",
                new XAttribute("NB_SISTEMA", s.NB_SISTEMA),
                new XAttribute("CL_SISTEMA", s.CL_SISTEMA),
                new XElement("EMPRESAS", getEmpresasXml(pEmpresas,s.ID_SISTEMA, pModulos, pVersiones))
            )
            );
            return xmlSistemas;
        }

        public IEnumerable<XElement> getEmpresasXml(List<E_EMPRESA> pEmpresas, Guid? pIdSistema, List<E_MODULO> pModulos, List<E_VERSION> pVersiones)
        {
            var xmlEmpresas = pEmpresas.Where(w=> w.ID_SISTEMA==pIdSistema).ToList().Select(s =>
                new XElement("EMPRESA",
                new XAttribute("NB_EMPRESA", s.NB_EMPRESA),
                new XAttribute("CL_EMPRESA", s.CL_EMPRESA),
                new XElement("MODULOS", getModulosXml(pModulos, s.ID_SISTEMA, pVersiones))
            )
            );
            return xmlEmpresas;
        }

        public IEnumerable<XElement> getModulosXml(List<E_MODULO> pModulos, Guid? pIdSistema, List<E_VERSION> pVersiones)
        {
            var xmlModulos = pModulos.Where(w => w.ID_SISTEMA == pIdSistema).ToList().Select(s =>
                   new XElement("MODULO",
                   new XAttribute("NB_MODULO", s.NB_MODULO),
                   new XAttribute("CL_MODULO", s.CL_MODULO),
                new XElement("VERSIONES", getVersionesXml(pVersiones, s.ID_MODULO))
               )
            );
            return xmlModulos;
        }

        public IEnumerable<XElement> getVersionesXml(List<E_VERSION> pVersiones, Guid? pIdModulo)
        {
            var xmlModulos = pVersiones.Where(w => w.ID_MODULO == pIdModulo).ToList().Select(s =>
                   new XElement("VERSION",
                   new XAttribute("NO_RELEASE", s.NO_RELEASE)
               )
            );
            return xmlModulos;
        }


        #region FUNCIONES


        public List<E_EMPRESA> obtieneEmpresasCliente(String Catalogos)
        {
            List<E_EMPRESA> lstEmpresas = new List<E_EMPRESA>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlEmpresa = XElement.Parse(Catalogos).Element("EMPRESAS");

                if (UtilXML.ValidaRamaXml(xmlEmpresa, "EMPRESA"))
                {
                    lstEmpresas = xmlEmpresa.Elements("EMPRESA").Select(el => new E_EMPRESA
                    {
                        ID_SISTEMA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_SISTEMA")),
                        ID_EMPRESA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_EMPRESA")),
                        CL_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("CL_EMPRESA")),
                        NB_EMPRESA = UtilXML.ValorAtributo<string>(el.Attribute("NB_EMPRESA")),

                    }
                    ).ToList();
                }
            }
            return lstEmpresas;
        }

        public List<E_SISTEMA> obtieneSistemas(String Catalogos)
        {
            List<E_SISTEMA> lstSistemas = new List<E_SISTEMA>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlSistema = XElement.Parse(Catalogos).Element("SISTEMAS");

                if (UtilXML.ValidaRamaXml(xmlSistema, "SISTEMA"))
                {
                    lstSistemas = xmlSistema.Elements("SISTEMA").Select(el => new E_SISTEMA
                    {
                        ID_SISTEMA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_SISTEMA")),
                        CL_SISTEMA = UtilXML.ValorAtributo<string>(el.Attribute("CL_SISTEMA")),
                        NB_SISTEMA = UtilXML.ValorAtributo<string>(el.Attribute("NB_SISTEMA")),

                    }
                    ).ToList();
                }
            }
            return lstSistemas;
        }

        public List<E_MODULO> obtieneModulos(String Catalogos)
        {
            List<E_MODULO> lstModulos = new List<E_MODULO>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlModulo = XElement.Parse(Catalogos).Element("MODULOS");

                if (UtilXML.ValidaRamaXml(xmlModulo, "MODULO"))
                {
                    lstModulos = xmlModulo.Elements("MODULO").Select(el => new E_MODULO
                    {
                        ID_SISTEMA = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_SISTEMA")),
                        ID_MODULO = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_MODULO")),
                        CL_MODULO = UtilXML.ValorAtributo<string>(el.Attribute("CL_MODULO")),
                        NB_MODULO = UtilXML.ValorAtributo<string>(el.Attribute("NB_MODULO")),

                    }
                    ).ToList();
                }
            }
            return lstModulos;
        }

        public List<E_VERSION> obtieneVersiones(String Catalogos)
        {
            List<E_VERSION> lstVersiones = new List<E_VERSION>();
            if (Catalogos != null && Catalogos != string.Empty)
            {
                XElement xmlVersion = XElement.Parse(Catalogos).Element("VERSIONES");

                if (UtilXML.ValidaRamaXml(xmlVersion, "VERSION"))
                {
                    lstVersiones = xmlVersion.Elements("VERSION").Select(el => new E_VERSION
                    {
                        ID_MODULO = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_MODULO")),
                        ID_VERSION = UtilXML.ValorAtributo<Guid>(el.Attribute("ID_VERSION")),
                        NO_RELEASE = UtilXML.ValorAtributo<decimal>(el.Attribute("NO_RELEASE")),
                    }
                    ).ToList();
                }
            }
            return lstVersiones;
        }

        #endregion

    }
}
