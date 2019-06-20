<%@ Page Title="" Language="C#" MasterPageFile="~/ContextHTML.master" AutoEventWireup="true" CodeBehind="VentanaClientes.aspx.cs" Inherits="WebApp.Administracion.Catalogos.VentanaClientes" %>
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

    <telerik:RadAjaxLoadingPanel ID="ralpClientes" runat="server"></telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="ramClientes" runat="server" DefaultLoadingPanelID="ralpClientes">
        <AjaxSettings>
             <telerik:AjaxSetting AjaxControlID="btnAgregar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtTelefono"/>
                    <telerik:AjaxUpdatedControl ControlID="rcbTipoTel"/>
                    <telerik:AjaxUpdatedControl ControlID="grdTelefonos"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnGuardar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtClave"/>
                    <telerik:AjaxUpdatedControl ControlID="txtNombre"/>
                    <telerik:AjaxUpdatedControl ControlID="txtContacto"/>
                    <telerik:AjaxUpdatedControl ControlID="txtCorreo"/>
                    <telerik:AjaxUpdatedControl ControlID="txtTelefono"/>
                    <telerik:AjaxUpdatedControl ControlID="rcbTipoTel"/>
                    <telerik:AjaxUpdatedControl ControlID="grdTelefonos" UpdatePanelHeight="100%"/>
                    <telerik:AjaxUpdatedControl ControlID="txtEjecutivoCuenta"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnEditar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtTelefono"/>
                    <telerik:AjaxUpdatedControl ControlID="rcbTipoTel"/>
                    <telerik:AjaxUpdatedControl ControlID="grdTelefonos" UpdatePanelHeight="100%"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnEliminar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdTelefonos"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="rcbEmpresa">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rcbEmpresa"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnAgregarEmpresa">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdEmpresas"/>
                </UpdatedControls>
            </telerik:AjaxSetting>
              <telerik:AjaxSetting AjaxControlID="btnEliminarEmpresa">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="grdEmpresas"/>
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
            <telerik:RadTextBox ID="txtClave" runat="server" Width="325"></telerik:RadTextBox>
        </div>
    </div>
    <div style="clear: both;"></div>

     <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblpass" Text="Contraseña" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtContraseña" runat="server" Width="325" TextMode="Password"></telerik:RadTextBox>
        </div>
    </div>
    <div style="clear: both;"></div>
    
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblNombre" Text="Nombre" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtNombre" runat="server" Width="325"></telerik:RadTextBox>
        </div>
    </div>
      <div style="clear: both;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblContacto" Text="Contacto" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtContacto" runat="server" Width="325"></telerik:RadTextBox>
        </div>
    </div>
      <div style="clear: both;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblCorreo" Text="Correo" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtCorreo" runat="server" Width="325"></telerik:RadTextBox>
        </div>
    </div>
      <div style="clear: both;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="Label1" Text="Telefono" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <div class="ctrlBasico">
            <telerik:RadNumericTextBox ID="txtTelefono" MinValue="0" runat="server" >
                <NumberFormat GroupSeparator="" DecimalDigits="0" /> 
            </telerik:RadNumericTextBox>
            </div>
            <div class="ctrlBasico">
            <telerik:RadComboBox ID="rcbTipoTel" runat="server">
                <Items>
                    <telerik:RadComboBoxItem Text="Fijo" Value="Fijo" />
                    <telerik:RadComboBoxItem Text="Movil" Value="Movil" />
                    <telerik:RadComboBoxItem Text="Particular" Value="Particular" />
                </Items>
            </telerik:RadComboBox>
                </div>
            <div class="ctrlBasico">
            <telerik:RadButton ID="btnAgregar" Text="Agregar" AutoPostBack="true" OnClick="btnAgregar_Click" runat="server"></telerik:RadButton>
             </div>
        </div>
    </div>
      <div style="clear: both;"></div>
     <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="Label2" Text="Telefonos" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <div class="ctrlBasico">
          <telerik:RadGrid ID="grdTelefonos" OnNeedDataSource="grdTelefonos_NeedDataSource" HeaderStyle-Font-Bold="true" runat="server" Height="100%" Width="325" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="false" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="false" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_TELEFONO, NO_TELEFONO, CL_TIPO" DataKeyNames="ID_TELEFONO, NO_TELEFONO, CL_TIPO" AutoGenerateColumns="false" AllowPaging="false" AllowFilteringByColumn="false" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn HeaderStyle-Width="80" HeaderText="Teléfono" DataField="NO_TELEFONO" UniqueName="NO_TELEFONO"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-Width="80" HeaderText="Tipo" DataField="CL_TIPO" UniqueName="CL_TIPO"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid> 
                </div>
            <div class="ctrlBasico">
            <telerik:RadButton ID="btnEditar" Text="Editar" AutoPostBack="true" runat="server" OnClick="btnEditar_Click"></telerik:RadButton>
                  </div>
            <div class="ctrlBasico">
            <telerik:RadButton ID="btnEliminar" Text="Eliminar" AutoPostBack="true" runat="server" OnClick="btnEliminar_Click"></telerik:RadButton>
                </div>
        </div>
        
    </div>
    <div style="clear: both;"></div>
    <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="lblEjecutivo" Text="Ejecutivo de cuenta" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <telerik:RadTextBox ID="txtEjecutivoCuenta" runat="server" Width="325"></telerik:RadTextBox>
        </div>
    </div>

    <div style="clear: both;"></div>

      <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="Label3" Text="Empresa" runat="server"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <div class="ctrlBasico">
          <telerik:RadComboBox ID="rcbEmpresa" runat="server" Filter="Contains" AutoPostBack="true" EmptyMessage="Selecciona..." Width="320" HighlightTemplatedItems="true" MarkFirstMatch="true" DropDownWidth="500px" MaxHeight="400px">
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
                                                <asp:Label ID="lblClaveSist" Text='<%# DataBinder.Eval(Container.DataItem, "CL_EMPRESA") %>' runat="server" Width="100"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblNombresist" Text='<%# DataBinder.Eval(Container.DataItem, "NB_EMPRESA") %>' runat="server" Width="350"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadComboBox>
                </div>
            <div class="ctrlBasico">
            <telerik:RadButton ID="btnAgregarEmpresa" Text="Agregar" AutoPostBack="true" OnClick="btnAgregarEmpresa_Click" runat="server"></telerik:RadButton>
             </div>
        </div>
    </div>
    <div style="clear: both;"></div>
     <div class="ctrlBasico">
        <div class="divControlIzquierda">
            <asp:Label ID="Label4" Text="Empresas" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="divControlDerecha">
            <div class="ctrlBasico">
          <telerik:RadGrid ID="grdEmpresas" OnNeedDataSource="grdEmpresas_NeedDataSource" HeaderStyle-Font-Bold="true" runat="server" Height="100%" Width="325" Culture="es-MX">
            <ClientSettings>
                <Scrolling UseStaticHeaders="true" AllowScroll="false" />
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
            <PagerStyle AlwaysVisible="false" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView ClientDataKeyNames="ID_EMPRESA" DataKeyNames="ID_EMPRESA" AutoGenerateColumns="false" AllowPaging="false" AllowFilteringByColumn="false" ShowHeadersWhenNoRecords="true">
                <Columns>
                    <telerik:GridBoundColumn HeaderStyle-Width="80" HeaderText="Empresas" DataField="NB_EMPRESA" UniqueName="NB_EMPRESA"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid> 
                </div>
            <div class="ctrlBasico">
            <telerik:RadButton ID="btnEliminarEmpresa" Text="Eliminar" AutoPostBack="true" runat="server" OnClick="btnEliminarEmpresa_Click"></telerik:RadButton>
                </div>
        </div>
    </div>
      <div style="clear: both; height:20px;"></div>
     <div class="divControlDerecha">
            <telerik:RadButton ID="btnGuardar" Text="Guardar" AutoPostBack="true" runat="server" OnClick="btnGuardar_Click"></telerik:RadButton>
            <telerik:RadButton ID="btnCancelar" Text="Cancelar" AutoPostBack="false" runat="server" OnClientClicked="closeWindow"></telerik:RadButton>
        </div>
    <telerik:RadWindowManager ID="rwmAlertas" runat="server"></telerik:RadWindowManager>

</asp:Content>
