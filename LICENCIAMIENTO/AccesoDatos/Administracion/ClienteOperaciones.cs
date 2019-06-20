using Entidades;
using Entidades.Externas;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace AccesoDatos.Administracion
{

    public class ClienteOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public List<SPE_OBTIENE_C_CLIENTES_Result> ObtenerClientes(Guid? ID_CLIENTE = null, string CL_CLIENTE = null, string CL_PASSWORD = null, string NB_CLIENTE = null, string NB_CONTACTO = null, string CL_EMAIL = null, string NB_EJECUTIVO_CUENTA = null)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
               return context.SPE_OBTIENE_C_CLIENTES(ID_CLIENTE, CL_CLIENTE, CL_PASSWORD, NB_CLIENTE, NB_CONTACTO, CL_EMAIL, NB_EJECUTIVO_CUENTA).ToList();
            }
        }

        public XElement InsertaActualizaClientes(E_TIPO_OPERACION_DB tipoTransaccion, E_CLIENTES vCliente, string xmlElemento, string xmlEmpresas, string usuario, string programa)
        {

            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_INSERTA_ACTUALIZA_C_CLIENTE(pOutClRetorno, vCliente.ID_CLIENTE, vCliente.CL_CLIENTE, vCliente.CL_PASS, vCliente.NB_CLIENTE, vCliente.NB_CONTACTO, vCliente.CL_EMAIL, xmlElemento, xmlEmpresas, vCliente.NB_EJECUTIVO_CUENTA, usuario, programa, tipoTransaccion.ToString());
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }


        public XElement EliminarCliente(Guid idCliente)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                ObjectParameter pOutClRetorno = new ObjectParameter("XML_RESULTADO", typeof(XElement));
                context.SPE_ELIMINA_C_CLIENTE(pOutClRetorno, idCliente);
                return XElement.Parse(pOutClRetorno.Value.ToString());
            }
        }

        public List<SPE_OBTIENE_CLIENTE_CATALOGOS_Result> ObtenerClientesCatalogos(Guid? ID_CLIENTE = null)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_CLIENTE_CATALOGOS(ID_CLIENTE).ToList();
            }
        }
    }
}
