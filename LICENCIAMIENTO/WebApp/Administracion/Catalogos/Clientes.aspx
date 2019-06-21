<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="WebApp.Administracion.Catalogos.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowInsertForm() {
            OpenWindow(null);
            return false;
        }

        function ShowEditForm() {
            var selectedItem = $find("<%=grdClientes.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_CLIENTE"));
                else
                    radalert("Selecciona un cliente.", 400, 150, "Aviso");
            }

            function OpenWindow(pIdCliente) {
                var vURL = "VentanaClientes.aspx";
                var vTitulo = "Agregar Cliente";
                if (pIdCliente != null) {
                    vURL = vURL + "?ClienteId=" + pIdCliente;
                    vTitulo = "Editar Cliente";
                }
                var width = 900;
                var height = document.documentElement.clientHeight - 40;
                var oWin = window.radopen(vURL, "winClientes", width, height);
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdClientes.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdClientes.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NB_CLIENTE").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar el cliente " + vNombre + "?, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona un cliente.", 400, 150, "Aviso");
                    args.set_cancel(true);
                }
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxLoadingPanel ID="ralpClientes" runat="server"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="ramClientes" runat="server" DefaultLoadingPanelID="ralpClientes">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdClientes">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdClientes" UpdatePanelHeight="100%" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdClientes" UpdatePanelHeight="100%" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <label class="labelTitulo">Catálogo de clientes</label>
    <div style="height: calc(100% - 100px);">
        <telerik:RadGrid ID="grdClientes" HeaderStyle-Font-Bold="true" runat="server" OnItemCreated="grdClientes_ItemCreated" OnNeedDataSource="grdClientes_NeedDataSource" Height="100%" Width="100%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_CLIENTE" DataKeyNames="ID_CLIENTE" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="120" FilterControlWidth="70" HeaderText="Clave" DataField="CL_CLIENTE" UniqueName="CL_CLIENTE"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200" FilterControlWidth="140" HeaderText="Nombre" DataField="NB_CLIENTE" UniqueName="NB_CLIENTE"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200 " FilterControlWidth="140" HeaderText="Contacto" DataField="NB_CONTACTO" UniqueName="NB_CONTACTO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="150 " FilterControlWidth="90" HeaderText="Correo" DataField="CL_EMAIL" UniqueName="CL_EMAIL"></telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="100 " FilterControlWidth="70"  HeaderText="Correo" DataField="CL_TELEFONOS" UniqueName="CL_EMAIL"></telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200 " FilterControlWidth="140" HeaderText="Ejecutivo" DataField="NB_EJECUTIVO_CUENTA" UniqueName="NB_EJECUTIVO_CUENTA"></telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" ReadOnly="true"  HeaderStyle-Width="150" FilterControlWidth="90px" HeaderText="Teléfonos">
                        <ItemTemplate>
                            <telerik:RadLabel ID="lblDescTelefonos" runat="server"></telerik:RadLabel>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <div style="clear: both; height: 10px;"></div>
    <div class="ctrlBasico">
        <telerik:RadButton ID="btnAgregar" runat="server" name="btnAgregar" AutoPostBack="false" Text="Agregar" OnClientClicked="ShowInsertForm" Width="100"></telerik:RadButton>
    </div>
    <div class="ctrlBasico">
        <telerik:RadButton ID="btnEditar" runat="server" name="btnEditar" AutoPostBack="false" Text="Editar" OnClientClicked="ShowEditForm" Width="100"></telerik:RadButton>
    </div>
    <div class="ctrlBasico">
        <telerik:RadButton ID="btnEliminar" runat="server" name="btnEliminar" AutoPostBack="true" Text="Eliminar" OnClientClicking="confirmarEliminar" Width="100" OnClick="btnEliminar_Click"></telerik:RadButton>
    </div>
    <telerik:RadWindowManager ID="rwmAlertas" runat="server">
        <Windows>
            <telerik:RadWindow ID="winClientes" runat="server" Title="Agregar/Editar Cliente" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
