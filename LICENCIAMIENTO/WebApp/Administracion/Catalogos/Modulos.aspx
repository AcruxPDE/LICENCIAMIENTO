<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Modulos.aspx.cs" Inherits="WebApp.Administracion.Catalogos.Modulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
            function ShowInsertForm() {
                OpenWindow(null);
                return false;
            }

            function ShowEditForm() {
                var selectedItem = $find("<%=grdModulos.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_MODULO"));
                else
                    radalert("Selecciona un módulo.", 400, 150);
            }

            function OpenWindow(pIdModulo) {
                var vURL = "VentanaModulos.aspx";
                var vTitulo = "Agregar módulo";
                if (pIdModulo != null) {
                    vURL = vURL + "?ModuloId=" + pIdModulo;
                    vTitulo = "Editar Módulo";
                }
                var oWin = window.radopen(vURL, "winModulos");
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdModulos.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdModulos.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NB_MODULO").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar el módulo " + vNombre + "?, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona un módulo.", 400, 150);
                    args.set_cancel(true);
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxLoadingPanel ID="ralpSistemas" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramSistemas" runat="server" DefaultLoadingPanelID="ralpSistemas">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdModulos">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdModulos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
               <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdModulos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>


     <label class="labelTitulo">Catálogo de módulos</label>
    <div style="height: calc(100% - 100px);">
        <telerik:RadGrid ID="grdModulos" HeaderStyle-Font-Bold="true" runat="server" OnNeedDataSource="grdModulos_NeedDataSource" Height="100%" Width="100%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_MODULO" DataKeyNames="ID_MODULO" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="80" FilterControlWidth="40" HeaderText="Clave" DataField="CL_MODULO" UniqueName="CL_MODULO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="180" FilterControlWidth="120" HeaderText="Nombre" DataField="NB_MODULO" UniqueName="NB_MODULO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200 " FilterControlWidth="150"  HeaderText="Descripción" DataField="DS_MODULO" UniqueName="DS_MODULO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="150 " FilterControlWidth="100"  HeaderText="Sistema" DataField="NB_SISTEMA" UniqueName="NB_SISTEMA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="150 " FilterControlWidth="100"  HeaderText="Clave sistema" DataField="CL_SISTEMA" UniqueName="CL_SISTEMA"></telerik:GridBoundColumn>
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
            <telerik:RadWindow ID="winModulos" runat="server" Title="Agregar/Editar Modulo" Height="450px" Width="900px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
