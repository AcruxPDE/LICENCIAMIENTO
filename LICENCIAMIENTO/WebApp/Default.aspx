<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style id="MyCss" type="text/css">
           
        .RadLabelPlaskolite {
         
            font-size: 500%;
            font-weight:100;
            text-align:center;
            width:100%;
        }


         .centered {
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -50px;
            margin-left: -250px;
        }

@media only screen and (max-width: 500px) {
   body { font-size: 1em; }
}


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered">
        <telerik:RadLabel ForeColor="#A6A6A6" runat="server" ID="radLabelDefault" Text="Licenciamiento" CssClass="RadLabelPlaskolite"></telerik:RadLabel>
    </div>
    <telerik:RadWindowManager ID="RadWindowManager1" EnableShadow="true" runat="server" OnClientClose="returnDataToParentPopup">        
    </telerik:RadWindowManager>
</asp:Content>
