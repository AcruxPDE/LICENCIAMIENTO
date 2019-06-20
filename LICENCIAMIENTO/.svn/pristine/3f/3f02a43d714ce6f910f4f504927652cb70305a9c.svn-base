using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WebApp.WS
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "ILicencia" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface ILicencia
    {
        [OperationContract]
        string generaXmlLicencia(string clCliente = null, string clPassword = null);

        [OperationContract]
        string generaXmlIdentificacion(string clCliente, string clPassword);
    }
}
