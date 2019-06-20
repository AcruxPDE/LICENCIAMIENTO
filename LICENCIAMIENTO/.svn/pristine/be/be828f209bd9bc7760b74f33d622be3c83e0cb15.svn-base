using Entidades;
using Entidades.Externas;
using Negocio.Administracion;
using Negocio.Gestion;
using Negocio.Utilerias;
using Negocio.WS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Xml.Linq;
using WebApp.Comunes;

namespace WebApp.WS
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Licencia" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Licencia.svc o Licencia.svc.cs en el Explorador de soluciones e inicie la depuración.

    public class Licencia : ILicencia
    {
      public string generaXmlLicencia(string clCliente = null, string clPassword = null)
        {
            Crypto encripta = new Crypto();
            string pass = clPassword.Substring(0, 16);
            LicenciamientoNegocio neg = new LicenciamientoNegocio();
            string keyFeCreacion = neg.obtieneLicenciasXml(clCliente, clPassword).FE_CREACION;
            string vXml = neg.obtieneLicenciasXml(clCliente, clPassword).XML_LICENCIAS;
            string xmlEncriptado= encripta.cifrarTextoAES(vXml, clCliente, keyFeCreacion, "SHA1", 22, pass, 256);
            return xmlEncriptado;
        }

        public string generaXmlIdentificacion(string clCliente, string clPassword)
        {
            string vXml="";
            string keyFeCreacion = "";
            LicenciamientoNegocio neg = new LicenciamientoNegocio();
            vXml=neg.generaXmlIdentificacion(clCliente, clPassword);
            XElement vXmlConfiguracion = XElement.Parse(vXml);
            E_CLIENTES vCliente = vXmlConfiguracion.Descendants("CLIENTE").Select(x => new E_CLIENTES
            {
                FE_CREACION = UtilXML.ValorAtributo<string>(x.Attribute("FE_CREACION"))
            }).FirstOrDefault();

            if (vCliente.FE_CREACION!="")
            {
                keyFeCreacion = vCliente.FE_CREACION;
            }

            Crypto encripta = new Crypto();
            string pass = clPassword.Substring(0, 16);
            string textoEncriptado= encripta.cifrarTextoAES(vXml, clCliente,keyFeCreacion, "SHA1", 22, pass, 256);
            return textoEncriptado;
        }
    }
}
