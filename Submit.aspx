<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Submit.aspx.cs" Inherits="NewsOpinion.Submit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper " style="text-align: center;">
            <h1>Article Submission</h1>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
       <table>
        <tr>
            <td>Title:
            </td>
            <td>
                <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbTitle" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Genre:   
                <asp:DropDownList ID="ddlGenre" runat="server" OnPreRender="ddlGenre_PreRender"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlGenre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Zip Code(optional):</td>
            <td>
                <asp:TextBox ID="tbZip" runat="server" TextMode="SingleLine" MaxLength="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Article Summary(optional):   </td>
            <td>
                <asp:TextBox ID="tbSummary" runat="server" MaxLength="600"></asp:TextBox>
            </td>
        </tr>
    </table>
    <div id="wrapper" style="padding-bottom: 10px;">
        <div id="padding" style="padding-bottom: 10px;">
            <div id="container">
                Article Text:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbArticle" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="tbArticle" runat="server" TextMode="MultiLine" ClientIDMode="Static" Columns="60" Rows="10"></asp:TextBox>

                <ajaxToolkit:HtmlEditorExtender runat="server" TargetControlID="tbArticle">
                    <Toolbar></Toolbar>
                </ajaxToolkit:HtmlEditorExtender>

            </div>
        </div>
    </div>
    <recaptcha:RecaptchaControl ID="recap" runat="server" Theme="clean" />
    <asp:Label Visible="false" ID="lblResult" runat="server" />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>
