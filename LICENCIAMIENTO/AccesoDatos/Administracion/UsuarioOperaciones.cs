using Entidades;
using Entidades.Administracion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos.Administracion
{

    public class UsuarioOperaciones
    {
        private ACRUXLICENCIAMIENTOEntities context;

        public SPE_OBTIENE_USUARIO_AUTENTICACION_Result AutenticaUsuario(E_USUARIO pUsuario)
        {
            using (context = new ACRUXLICENCIAMIENTOEntities())
            {
                return context.SPE_OBTIENE_USUARIO_AUTENTICACION(pUsuario.CL_USUARIO, pUsuario.NB_PASSWORD, pUsuario.CL_AUTENTICACION.ToString()).FirstOrDefault();
            }
        }

    }
}
