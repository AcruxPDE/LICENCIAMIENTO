<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Sistemas.aspx.cs" Inherits="WebApp.Administracion.Catalogos.Sistemas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            function ShowInsertForm() {
                OpenWindow(null);
                return false;
            }

            function ShowEditForm() {
                var selectedItem = $find("<%=grdSistemas.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_SISTEMA"));
                else
                    radalert("Selecciona un sistema.", 400, 150);
            }

            function OpenWindow(pIdSistema) {
                var vURL = "VentanaSistemas.aspx";
                var vTitulo = "Agregar sistema";
                if (pIdSistema != null) {
                    vURL = vURL + "?SistemaId=" + pIdSistema;
                    vTitulo = "Editar Sistema";
                }
                var oWin = window.radopen(vURL, "winSistemas");
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdSistemas.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdSistemas.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NB_SISTEMA").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar el sistema " + vNombre + "?, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona un sistema.", 400, 150);
                    args.set_cancel(true);
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxLoadingPanel ID="ralpSistemas" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramSistemas" runat="server" DefaultLoadingPanelID="ralpSistemas">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdSistemas">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdSistemas" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
               <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdSistemas" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <label class="labelTitulo">Catálogo de sistemas</label>
    <div style="height: calc(100% - 100px);">
        <telerik:RadGrid ID="grdSistemas" HeaderStyle-Font-Bold="true" runat="server" OnNeedDataSource="grdSistemas_NeedDataSource" Height="100%" Width="100%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_SISTEMA" DataKeyNames="ID_SISTEMA" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="100" FilterControlWidth="50" HeaderText="Clave" DataField="CL_SISTEMA" UniqueName="CL_SISTEMA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200" FilterControlWidth="140" HeaderText="Nombre" DataField="NB_SISTEMA" UniqueName="NB_SISTEMA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="180 " FilterControlWidth="100"  HeaderText="Tipo" DataField="CL_TIPO" UniqueName="CL_TIPO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="350 " FilterControlWidth="200"  HeaderText="Descripción" DataField="DS_SISTEMA" UniqueName="DS_SISTEMA"></telerik:GridBoundColumn>
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
            <telerik:RadWindow ID="winSistemas" runat="server" Title="Agregar/Editar Sistema" Height="450px" Width="900px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
