<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Licencias.aspx.cs" Inherits="WebApp.Administracion.Catalogos.Licencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
            function ShowInsertForm() {
                OpenWindow(null);
                return false;
            }

            function ShowEditForm() {
                var selectedItem = $find("<%=grdLicencias.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_LICENCIA"));
                else
                    radalert("Selecciona una licencia.", 400, 150);
            }

            function OpenWindow(pILicencia) {
                var vURL = "VentanaLicencias.aspx";
                var vTitulo = "Agregar Licencia";
                if (pILicencia != null) {
                    vURL = vURL + "?LicenciaId=" + pILicencia;
                    vTitulo = "Editar Licencia";
                }
                var oWin = window.radopen(vURL, "winLicencias");
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdLicencias.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdLicencias.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NB_LICENCIA").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar la licencia " + vNombre + "?, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona una licencia.", 400, 150);
                    args.set_cancel(true);
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <telerik:RadAjaxLoadingPanel ID="ralpLicencias" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramLicencias" runat="server" DefaultLoadingPanelID="ralpLicencias">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdLicencias">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdLicencias" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdLicencias" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <label class="labelTitulo">Catálogo de licencias</label>
     <div style="height: calc(100% - 100px);">
        <telerik:RadGrid ID="grdLicencias" HeaderStyle-Font-Bold="true" runat="server" OnNeedDataSource="grdLicencias_NeedDataSource" Height="100%" Width="100%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_LICENCIA" DataKeyNames="ID_LICENCIA" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="120" FilterControlWidth="60" HeaderText="Clave" DataField="CL_LICENCIA" UniqueName="CL_LICENCIA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="250" FilterControlWidth="180" HeaderText="Nombre" DataField="NB_LICENCIA" UniqueName="NB_LICENCIA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="100 " FilterControlWidth="40"  HeaderText="Por periodo" DataField="FG_PERIODO" UniqueName="FG_PERIODO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="100 " FilterControlWidth="40"  HeaderText="Por volumen" DataField="FG_VOLUMEN" UniqueName="FG_VOLUMEN"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="350 " FilterControlWidth="280"  HeaderText="Descripción" DataField="DS_LICENCIA" UniqueName="DS_LICENCIA"></telerik:GridBoundColumn>
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
            <telerik:RadWindow ID="winLicencias" runat="server" Title="Agregar/Editar Licencia" Height="450px" Width="900px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
