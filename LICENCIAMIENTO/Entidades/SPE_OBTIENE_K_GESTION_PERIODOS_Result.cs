//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entidades
{
    using System;
    
    public partial class SPE_OBTIENE_K_GESTION_PERIODOS_Result
    {
        public System.Guid ID_GESTION_PERIODO { get; set; }
        public System.Guid ID_CLIENTE { get; set; }
        public string NB_CLIENTE { get; set; }
        public System.Guid ID_SISTEMA { get; set; }
        public string NB_SISTEMA { get; set; }
        public System.Guid ID_EMPRESA { get; set; }
        public string NB_EMPRESA { get; set; }
        public System.Guid ID_MODULO { get; set; }
        public string NB_MODULO { get; set; }
        public System.Guid ID_VERSION { get; set; }
        public decimal NO_RELEASE { get; set; }
        public System.Guid ID_LICENCIA { get; set; }
        public string NB_LICENCIA { get; set; }
        public Nullable<System.DateTime> FE_INICIO { get; set; }
        public Nullable<System.DateTime> FE_FIN { get; set; }
        public Nullable<int> NO_VOLUMEN { get; set; }
    }
}