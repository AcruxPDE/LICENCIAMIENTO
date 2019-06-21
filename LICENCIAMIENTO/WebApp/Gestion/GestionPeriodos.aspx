<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="GestionPeriodos.aspx.cs" Inherits="WebApp.Gestion.GestionPeriodos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        html{
            overflow-x: hidden !important; 
        }
    </style>
     <script type="text/javascript">

         
        function ShowInsertForm() {
            OpenWindow(null);
            return false;
        }

        function ShowEditForm() {
            var selectedItem = $find("<%=grdPeriodos.ClientID %>").get_masterTableView().get_selectedItems()[0];
                if (selectedItem != undefined)
                    OpenWindow(selectedItem.getDataKeyValue("ID_GESTION_PERIODO"));
                else
                    radalert("Selecciona un periodo.", 400, 150, "Aviso");
            }

            function OpenWindow(pIdPeriodo) {
                var vURL = "VentanaGestion.aspx";
                var vTitulo = "Agregar Periodo";
                if (pIdPeriodo != null) {
                    vURL = vURL + "?PeriodoId=" + pIdPeriodo;
                    vTitulo = "Editar Periodo";
                }
                
                var height= document.documentElement.clientHeight - 40;
                var oWin = window.radopen(vURL, "winPeriodos",900,height);
                oWin.set_title(vTitulo);
            }

            function onCloseWindow(oWnd, args) {
                $find("<%= grdPeriodos.ClientID%>").get_masterTableView().rebind();
            }

            function confirmarEliminar(sender, args) {
                var masterTable = $find("<%= grdPeriodos.ClientID %>").get_masterTableView();
                var selectedItem = masterTable.get_selectedItems()[0];
                if (selectedItem != undefined) {
                    //var vNombre = masterTable.getCellByColumnUniqueName(selectedItem, "NB_LICENCIA").innerHTML;

                    var vWindowsProperties = {
                        height: 200
                    };

                    confirmAction(sender, args, "¿Deseas eliminar el periodo, este proceso no podrá revertirse");
                }
                else {
                    radalert("Selecciona un periodo.", 400, 150, "Aviso");
                    args.set_cancel(true);
                }
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <telerik:RadAjaxLoadingPanel ID="ralpPeriodos" runat="server"></telerik:RadAjaxLoadingPanel>
      <telerik:RadAjaxManager ID="ramPeriodos" runat="server" DefaultLoadingPanelID="ralpPeriodos">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="grdPeriodos">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdPeriodos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdPeriodos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="rcbCliente">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdPeriodos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

     <label class="labelTitulo">Gestión de periodos</label>

     <div style="clear: both;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda" style="width:45px;">
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
     <div style="clear: both; height: 10px;"></div>

     <div style="height: calc(100% - 170px);">
        <telerik:RadGrid ID="grdPeriodos" HeaderStyle-Font-Bold="true" runat="server" OnNeedDataSource="grdPeriodos_NeedDataSource" Height="100%" Width="99%" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="true" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_GESTION_PERIODO" DataKeyNames="ID_GESTION_PERIODO" AutoGenerateColumns="false" AllowPaging="true" AllowFilteringByColumn="true" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="250" FilterControlWidth="150" HeaderText="Cliente" DataField="NB_CLIENTE" UniqueName="NB_CLIENTE"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="250" FilterControlWidth="150" HeaderText="Sistema" DataField="NB_SISTEMA" UniqueName="NB_SISTEMA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="250" FilterControlWidth="150"  HeaderText="Empresa" DataField="NB_EMPRESA" UniqueName="NB_EMPRESA"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200" FilterControlWidth="120"  HeaderText="Módulo" DataField="NB_MODULO" UniqueName="NB_MODULO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo" HeaderStyle-Width="100" FilterControlWidth="30"  HeaderText="Versión" DataField="NO_RELEASE" UniqueName="NO_RELEASE"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="Contains" HeaderStyle-Width="200" FilterControlWidth="150"  HeaderText="Licencia" DataField="NB_LICENCIA" UniqueName="NB_LICENCIA"></telerik:GridBoundColumn>
                    <telerik:GridDateTimeColumn AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo" HeaderStyle-Width="120" FilterControlWidth="60"  HeaderText="Fecha inicio" DataField="FE_INICIO" UniqueName="FE_INICIO" DataFormatString="{0: dd/MM/yyyy}"></telerik:GridDateTimeColumn>
                    <telerik:GridDateTimeColumn AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo" HeaderStyle-Width="120" FilterControlWidth="60"  HeaderText="Fecha fin" DataField="FE_FIN" UniqueName="FE_FIN" DataFormatString="{0: dd/MM/yyyy}"></telerik:GridDateTimeColumn>
                    <telerik:GridBoundColumn AutoPostBackOnFilter="true" CurrentFilterFunction="EqualTo" HeaderStyle-Width="110" FilterControlWidth="40"  HeaderText="Volumen" DataField="NO_VOLUMEN" UniqueName="NO_VOLUMEN"></telerik:GridBoundColumn>
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
            <telerik:RadWindow ID="winPeriodos" runat="server" Title="Agregar/Editar Periodo" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close" OnClientClose="onCloseWindow"></telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
