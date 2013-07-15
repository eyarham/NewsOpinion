<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Articles.aspx.cs" Inherits="NewsOpinion.Articles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper " style="text-align: center;">
            <div id="oneArticle" runat="server">

                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <h1>
                            <asp:HyperLink ID="genreLink" Font-Underline="false" runat="server" NavigateUrl='<%# "~/Genres?"+ Eval("GenreName") %>'><%# Eval("GenreName") %></asp:HyperLink>
                        </h1>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="multiArticle" runat="server">
                <h1>Articles
                </h1>
            </div>
        </div>
       </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divContent" runat="server">
        <asp:Repeater ID="rptArticles" runat="server" OnPreRender="rptArticles_PreRender">
            <ItemTemplate>
                <my:Article ID="Article1" runat="server" Title='<%# Eval("Title") %>' IsPreview='<%# ((int)Eval("IsPreview"))==0?false:true %>' FullText='<%# Eval("FullText") %>' SummaryText='<%#  (((string)Eval("FullText")).Length< 200)? Eval("FullText"):    ((string)Eval("FullText")).Remove(200)+"..." %>' Author='<%# Eval("Author") %>' ArticleID='<%# Eval("ArticleID")%>' GenreName='<%# Eval("GenreName") %>' />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
