<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewsOpinion._Default" %>

<%--<%@ Register TagPrefix="my" TagName="Article" Src="~/Article.ascx" %>--%>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %></h1>
                <h2>This is where it all begins.</h2>
            </hgroup>
            <p>Welcome to yarhamblog. Please enjoy reading, and feel free to discuss!</p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1>The Latest</h1>
    <div id="divContent" runat="server">
        <asp:Repeater ID="rptLatest" runat="server" OnPreRender="rptLatest_PreRender">
            <ItemTemplate>
                <my:Article ID="Article1" runat="server" Title='<%# Eval("Title") %>' FullText='<%# Eval("FullText") %>' SummaryText='<%# Eval("SummaryText") %>' Author='<%# Eval("Author") %>' ArticleID='<%# Eval("ArticleID")%>' IsPreview="true" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="divEmpty" runat="server">
        No results were returned. Please retry your search.
    </div>
</asp:Content>
