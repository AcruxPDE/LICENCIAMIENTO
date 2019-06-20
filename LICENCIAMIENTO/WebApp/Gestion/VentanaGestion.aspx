<%@ Page Title="" Language="C#" MasterPageFile="~/ContextHTML.master" AutoEventWireup="true" CodeBehind="VentanaGestion.aspx.cs" Inherits="WebApp.Gestion.VentanaGestion" %>

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
    <telerik:RadAjaxLoadingPanel ID="ralpPeriodos" runat="server"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="ramPeriodos" runat="server" DefaultLoadingPanelID="ralpPeriodos">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="rcbCliente">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbCliente" />
                    <telerik:AjaxUpdatedControl ControlID="rcbEmpresa" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rcbSistema">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbSistema" />
                    <telerik:AjaxUpdatedControl ControlID="rcbModulo" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="rcbEmpresa">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbEmpresa" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="rcbModulo">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbModulo" />
                    <telerik:AjaxUpdatedControl ControlID="rcbVersion" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="rcbVersion">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbVersion" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="rcbLicencia">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbLicencia" />
                    <telerik:AjaxUpdatedControl ControlID="rdpFechaIni" />
                    <telerik:AjaxUpdatedControl ControlID="rdpFechaFin" />
                    <telerik:AjaxUpdatedControl ControlID="txtVolumen" />
                </UpdatedControls>
            </telerik:AjaxSetting>
               <telerik:AjaxSetting AjaxControlID="btnGuardar">
                <UpdatedControls>
                     <telerik:AjaxUpdatedControl ControlID="rcbCliente" />
                    <telerik:AjaxUpdatedControl ControlID="rcbEmpresa" />
                     <telerik:AjaxUpdatedControl ControlID="rcbSistema" />
                    <telerik:AjaxUpdatedControl ControlID="rcbModulo" />
                    <telerik:AjaxUpdatedControl ControlID="rcbVersion" />
                    <telerik:AjaxUpdatedControl ControlID="rcbLicencia" />
                    <telerik:AjaxUpdatedControl ControlID="rdpFechaIni" />
                    <telerik:AjaxUpdatedControl ControlID="rdpFechaFin" />
                    <telerik:AjaxUpdatedControl ControlID="txtVolumen" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div style="clear: both; height: 10px;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblCliente" Text="Cliente" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbCliente" runat="server" OnSelectedIndexChanged="rcbCliente_SelectedIndexChanged" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Clave" runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="350"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveCl" Text='<%# DataBinder.Eval(Container.DataItem, "CL_CLIENTE") %>' runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombreCl" Text='<%# DataBinder.Eval(Container.DataItem, "NB_CLIENTE") %>' runat="server" Width="350"></asp:Label>
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
            <asp:Label ID="lblEmpresa" Text="Empresa" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbEmpresa" runat="server" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Clave" runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="350"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveEmpresa" Text='<%# DataBinder.Eval(Container.DataItem, "CL_EMPRESA") %>' runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombreEmpresa" Text='<%# DataBinder.Eval(Container.DataItem, "NB_EMPRESA") %>' runat="server" Width="350"></asp:Label>
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
            <asp:Label ID="lblsistema" Text="Sistema" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbSistema" runat="server" OnSelectedIndexChanged="rcbSistema_SelectedIndexChanged" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Clave" runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="350"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveSist" Text='<%# DataBinder.Eval(Container.DataItem, "CL_SISTEMA") %>' runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombresist" Text='<%# DataBinder.Eval(Container.DataItem, "NB_SISTEMA") %>' runat="server" Width="350"></asp:Label>
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
            <asp:Label ID="lblModulo" Text="Módulo" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbModulo" runat="server" OnSelectedIndexChanged="rcbModulo_SelectedIndexChanged" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Clave" runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="350"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveModulo" Text='<%# DataBinder.Eval(Container.DataItem, "CL_MODULO") %>' runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombreModulo" Text='<%# DataBinder.Eval(Container.DataItem, "NB_MODULO") %>' runat="server" Width="350"></asp:Label>
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
            <asp:Label ID="lblVersion" Text="Versión" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbVersion" runat="server" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Versión" runat="server" Width="100"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveVersion" Text='<%# DataBinder.Eval(Container.DataItem, "NO_RELEASE") %>' runat="server" Width="100"></asp:Label>
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
            <asp:Label ID="lblLicencia" Text="Licencia" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadComboBox ID="rcbLicencia" OnSelectedIndexChanged="rcbLicencia_SelectedIndexChanged" runat="server" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="350" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClave" Text="Clave" runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombre" Text="Nombre" runat="server" Width="350"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblClaveLic" Text='<%# DataBinder.Eval(Container.DataItem, "CL_LICENCIA") %>' runat="server" Width="100"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNombreLic" Text='<%# DataBinder.Eval(Container.DataItem, "NB_LICENCIA") %>' runat="server" Width="350"></asp:Label>
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
            <asp:Label ID="lblFeIni" Text="Fecha inicial" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadDatePicker ID="rdpFechaIni" runat="server" Enabled="false"></telerik:RadDatePicker>
        </div>
    </div>
    <div style="clear: both;"></div>

    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblFeFin" Text="Fecha Final" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadDatePicker ID="rdpFechafin" runat="server" Enabled="false"></telerik:RadDatePicker>
        </div>
    </div>
    <div style="clear: both;"></div>

    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblVol" Text="Volumen" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadNumericTextBox ID="txtVolumen" runat="server" MinValue="1" MaxValue="9999999999999" Enabled="false" ShowSpinButtons="true">
                <NumberFormat DecimalDigits="0" DecimalSeparator="," />
            </telerik:RadNumericTextBox>
        </div>
    </div>

    <div style="clear: both; height: 20px;"></div>
    <div class="divControlDerecha">
        <telerik:RadButton ID="btnGuardar" Text="Guardar" AutoPostBack="true" runat="server" OnClick="btnGuardar_Click"></telerik:RadButton>
        <telerik:RadButton ID="btnCancelar" Text="Cancelar" AutoPostBack="false" runat="server" OnClientClicked="closeWindow"></telerik:RadButton>
    </div>
    <telerik:RadWindowManager ID="rwmAlertas" runat="server"></telerik:RadWindowManager>
</asp:Content>
