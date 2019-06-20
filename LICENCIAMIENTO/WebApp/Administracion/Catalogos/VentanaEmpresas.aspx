<%@ Page Title="" Language="C#" MasterPageFile="~/ContextHTML.master" AutoEventWireup="true" CodeBehind="VentanaEmpresas.aspx.cs" Inherits="WebApp.Administracion.Catalogos.VentanaEmpresas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContexto" runat="server">
    <script id="MyScript" type="text/javascript">
        function GetRadWindow() {
            var oWindow = null;
            if
                (window.radWindow) oWindow = window.radWindow;
            else
                if (window.frameElement.radWindow)
                    oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function closeWindow() {
            GetRadWindow().close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContexto" runat="server">
     <telerik:RadAjaxLoadingPanel ID="ralpEmpresas" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramEmpresas" runat="server" DefaultLoadingPanelID="ralpEmpresas">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnGuardar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtClave" UpdatePanelHeight="100%"/>
                    <telerik:AjaxUpdatedControl ControlID="txtNombre" UpdatePanelHeight="100%"/>
                    <telerik:AjaxUpdatedControl ControlID="txtDescripcion" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div style="clear: both; height: 10px;"></div>

    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblClave" Text="Clave" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtClave" runat="server"></telerik:RadTextBox>
        </div>
    </div>
    <div style="clear: both;"></div>
    
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblNombre" Text="Nombre" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtNombre" runat="server"></telerik:RadTextBox>
        </div>
    </div>
    <div style="clear: both;"></div>
     <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblDesc" Text="Descripción" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Width="400" Height="150"></telerik:RadTextBox>
        </div>
    </div>
         <div style="clear: both; height:20px;"></div>
       <div class="divControlDerecha">
            <telerik:RadButton ID="btnGuardar" Text="Guardar" AutoPostBack="true" runat="server" OnClick="btnGuardar_Click"></telerik:RadButton>
            <telerik:RadButton ID="btnCancelar" Text="Cancelar" AutoPostBack="false" runat="server" OnClientClicked="closeWindow"></telerik:RadButton>
        </div>
    <telerik:RadWindowManager ID="rwmAlertas" runat="server"></telerik:RadWindowManager>

</asp:Content>
