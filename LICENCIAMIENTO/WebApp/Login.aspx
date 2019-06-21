<%@ Page Title="" Language="C#" MasterPageFile="~/AcruxLic.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .windowclass {
            z-index: 5000 !important;
        }
    </style>
    <script type="text/javascript">

       <%-- function checkPasswordMatch() {
            var vPassword1 = $find("<%=txtNbPassword.ClientID %>").get_textBoxValue();
            var vPassword2 = $find("<%=txtNbPasswordConfirm.ClientID %>").get_textBoxValue();

            if (vPassword2 == "") {
                $get("PasswordRepeatedIndicator").innerHTML = "";
                $get("PasswordRepeatedIndicator").className = "Base L0";
            }
            else if (vPassword1 == vPassword2) {
                $get("PasswordRepeatedIndicator").innerHTML = "Coinciden";
                $get("PasswordRepeatedIndicator").className = "Base L5";
            }
            else {
                $get("PasswordRepeatedIndicator").innerHTML = "No coinciden";
                $get("PasswordRepeatedIndicator").className = "Base L1";
            }
        }--%>

        function OpenWindow(pIdSolicitud) {
            var vURL = "/IDP/Solicitud/Solicitud.aspx";
            var vTitulo = "Agregar Solicitud";
            if (pIdSolicitud != null) {
                vURL = vURL + "?SolicitudId=" + pIdSolicitud;
                vTitulo = "Editar Solicitud";
            }
            var windowProperties = {};
            windowProperties.width = document.documentElement.clientWidth - 20;
            windowProperties.height = document.documentElement.clientHeight - 20;
            openChildDialog(vURL, "winSolicitud", vTitulo, windowProperties);
        }


        function OpenWindowPlantilla(pIdPlantilla) {
            var vURL = "/IDP/Solicitud/Solicitud.aspx";
            var vTitulo = "Agregar Solicitud";
            if (pIdPlantilla != null) {
                vURL = vURL + "?PlantillaId=" + pIdPlantilla;
            }
            var windowProperties = {};
            windowProperties.width = document.documentElement.clientWidth - 20;
            windowProperties.height = document.documentElement.clientHeight - 20;
            openChildDialog(vURL, "winSolicitud", vTitulo, windowProperties);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md-12 col-xs-12" style="position: absolute; top: 0px; left: 0%;">
                <center>
                    <img src="Assets/images/TituloBannerSigein.png" class="visible-md visible-lg visible-sm" alt="Banner" />
                    <img src="Assets/images/Logo.png" alt="Logo" class="visible-xs" />
                </center>
            </div>
        </div>

        <div class="row" id="ContentLogin" runat="server">
            <div class="CentrarLogin">
                <div class="panel panel-default panelNoBottomMargin">
                    <div class="panel-heading" style="text-align: center;">
                        <strong id="tituloLogin" data-modulo="login" class="TextoDom" data-html="*">Inicia sesión para continuar</strong>
                    </div>
                    <div class="panel-body">
                        <fieldset class="fieldSetNoBorder">
                            <div class="row">
                                <div class="center-block">
                                    <div id="LogoLogin" style="text-align: center; padding: 10px;">
                                        <%--<img class="profile-img" src="Assets/images/LoginUsuario.png" />--%>
                                        <telerik:RadBinaryImage ID="rbiLogoOrganizacion1" runat="server" Width="128" Height="128" ResizeMode="Fit" ImageUrl="~/Assets/images/LoginUsuario.png" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-user"></i>
                                            </span>
                                            <input runat="server" class="form-control TextoDom" data-modulo="login" id="txtUsuario" placeholder="Usuario" name="txtUsuario" type="text" autofocus="autofocus" enableviewstate="false">
                                        </div>
                                        <span class="col-md-12 col-sm-12 col-xs-12 " style="padding: 0px">
                                            <asp:RequiredFieldValidator Display="Dynamic" CssClass="validacion" ID="valusuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-key"></i>
                                            </span>
                                            <input runat="server" class="form-control TextoDom" data-modulo="login" placeholder="Contraseña" name="txtPassword" id="txtPassword" type="password" enableviewstate="false">
                                        </div>
                                        <span class="col-md-12 col-sm-12 col-xs-12" style="padding: 0px">
                                            <asp:RequiredFieldValidator Display="Dynamic" CssClass="validacion" ID="Valpassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group">
                                            <%--<telerik:RadButton ID="btnRecuperarPassword" Width="220" runat="server" Text="Recuperar contraseña" CausesValidation="false" ButtonType="LinkButton" OnClick="btnRecuperarPassword_Click"></telerik:RadButton>--%>
                                            <%--<input type="button" data-modulo="login" name="recuperapassword" id="recuperapassword" value="Recuperar contraseña" class="btn btn-link TextoDom" onclick="RecuperaPassword(); return false" />--%>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button Text="Ingresar" ID="btnLogin" runat="server" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div id="dvSolicitudes" runat="server" class="panel-footer" style="text-align: center;">
                        <%--<i class="fa fa-file-text"></i>--%>
                        <%-- <a href="#" onclick="OpenWindow(null);" style="margin: 20px;">Solicitud de empleo</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <telerik:RadWindowManager ID="RadWindowManager1" EnableShadow="true" runat="server" OnClientClose="returnDataToParentPopup">
        <Windows>
            <%--            <telerik:RadWindow ID="modalRecuperaPassword"
                runat="server"
                Width="300"
                Height="400"
                Modal="true"
                VisibleStatusbar="false"
                Behaviors="Close"
                Title="Recupera contraseña"
                NavigateUrl="PasswordRecovery.aspx">
            </telerik:RadWindow>--%>
            <telerik:RadWindow ID="winSolicitud" runat="server" Title="Solicitud" Behaviors="Close" Modal="true" VisibleStatusbar="false" Height="600px" Width="600px" OnClientShow="centerPopUp"></telerik:RadWindow>
            <telerik:RadWindow ID="winSeleccion" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="Close"></telerik:RadWindow>
            <telerik:RadWindow ID="winPrivacidad" runat="server" Title="Seleccionar" Height="600px" Width="600px" ReloadOnShow="true" VisibleStatusbar="false" ShowContentDuringLoad="false" Modal="true" Behaviors="None"></telerik:RadWindow>


        </Windows>
    </telerik:RadWindowManager>
</asp:Content>
