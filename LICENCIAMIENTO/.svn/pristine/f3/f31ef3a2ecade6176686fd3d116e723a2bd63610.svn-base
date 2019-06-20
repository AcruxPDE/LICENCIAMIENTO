<%@ Page Title="" Language="C#" MasterPageFile="~/ContextHTML.master" AutoEventWireup="true" CodeBehind="VentanaVersiones.aspx.cs" Inherits="WebApp.Administracion.Catalogos.VentanaVersiones" %>
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
      
    <telerik:RadAjaxLoadingPanel ID="ralpVersiones" runat="server"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="ramVersiones" runat="server" DefaultLoadingPanelID="ralpVersiones">
        <AjaxSettings>
             <telerik:AjaxSetting AjaxControlID="rcbModulo">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbModulo"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnGuardar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbModulo"/>
                    <telerik:AjaxUpdatedControl ControlID="txtRelease"/>
                    <telerik:AjaxUpdatedControl ControlID="txtDescripcion"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

     <div style="clear: both; height: 10px;"></div>

     <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblsistema" Text="Modulo" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
             <telerik:RadComboBox ID="rcbModulo" runat="server"  Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="350px" MaxHeight="400px">
                <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblClave" Text="Clave" runat="server" Width="80"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="200"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblClaveMod" Text='<%# DataBinder.Eval(Container.DataItem, "CL_MODULO") %>' runat="server" Width="80"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblNombreMod" Text='<%# DataBinder.Eval(Container.DataItem, "NB_MODULO") %>' runat="server" Width="200"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
            </telerik:RadComboBox>
        </div>
    </div>
    <div style="clear: both;"></div>
    
          <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblClave" Text="No. Release" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadNumericTextBox ID="txtRelease" runat="server">
                <NumberFormat DecimalDigits="1" GroupSeparator="" />
            </telerik:RadNumericTextBox>
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