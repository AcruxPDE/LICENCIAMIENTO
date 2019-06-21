<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Versiones.aspx.cs" Inherits="WebApp.Administracion.Catalogos.Versiones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            function ShowInsertForm() {
                OpenWindow(null);
                return false;
            }

            function ShowEditForm() {
                var selectedItem = $find("<%=grdVersiones.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_VERSION"));
                else
                    radalert("Selecciona una versión.", 400, 150, "Aviso");
            }

            function OpenWindow(pIdVersion) {
                var vURL = "VentanaVersiones.aspx";
                var vTitulo = "Agregar versión";
                if (pIdVersion != null) {
                    vURL = vURL + "?VersionId=" + pIdVersion;
                    vTitulo = "Editar Versión";
                }
                var oWin = window.radopen(vURL, "winVersiones");
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdVersiones.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdVersiones.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NO_RELEASE").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar la versión " + vNombre + "?, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona una versión.", 400, 150, "Aviso");
                    args.set_cancel(true);
                }
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <telerik:RadAjaxLoadingPanel ID="ralpVersiones" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramVersiones" runat="server" DefaultLoadingPanelID="ralpVersiones">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdVersiones">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdVersiones" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
               <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdVersiones" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>


      <label class="labelTitulo">Catálogo de versiónes</label>
    <div style="height: calc(100% - 100px);">
        <telerik:RadGrid ID="grdVersiones" HeaderStyle-Font-Bold="true" runat="server" OnNeedDataSource="grdVersiones_NeedDataSource" Height="100%" Width="100%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_VERSION" DataKeyNames="ID_VERSION" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo" HeaderStyle-Width="150" FilterControlWidth="70" HeaderText="Versión" DataField="NO_RELEASE" UniqueName="NO_RELEASE"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="180" FilterControlWidth="100" HeaderText="Modulo" DataField="NB_MODULO" UniqueName="NB_MODULO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="400" FilterControlWidth="250"  HeaderText="Descripción" DataField="DS_VERSION" UniqueName="DS_VERSION"></telerik:GridBoundColumn>
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
            <telerik:RadWindow ID="winVersiones" runat="server" Title="Agregar/Editar Version" Height="450px" Width="900px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>

    </telerik:RadWindowManager>
</asp:Content>
