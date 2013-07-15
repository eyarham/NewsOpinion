<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Genres.aspx.cs" Inherits="NewsOpinion.Genres" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper " style="text-align: center;">
            <div id="oneGenre" runat="server">
                <asp:Repeater ID="rptGenreHeader" runat="server">
                    <ItemTemplate>
                        <h1 style="">
                            <%# GenreName %>
                        </h1>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div id="multiGenre" runat="server">

                <h1>Genres
                </h1>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divContent" runat="server">
        <h1><%# (Request.QueryString.Count>0)? (!string.IsNullOrEmpty(Request.QueryString[0]))? Request.QueryString[0]:"" :"" %></h1>
        <asp:Repeater ID="rpt" runat="server" OnPreRender="dlArticles_PreRender">
            <ItemTemplate>
                <my:Article ID="Article1" runat="server" IsPreview="true" Title='<%# Eval("ArticleName") %>' FullText='<%# Eval("ArticleText") %>' Author='<%# Eval("AuthorName") %>' ArticleID='<%# Eval("ArticleID")%>' PostTime='<%# Eval("DateTime") %>' />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="divEmpty" runat="server" visible="false">
        <asp:Repeater ID="rptGenres" runat="server" OnPreRender="rptGenres_PreRender">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>

                <li style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: block; font-size: 26px; padding-bottom: 5px">

                    <asp:HyperLink ID="genreLink" runat="server" NavigateUrl='<%# "~/Genres.aspx?"+ Eval("GenreName") %>' Font-Underline="false"><%# Eval("GenreName") %></asp:HyperLink>
            </ItemTemplate>
            <FooterTemplate></ul></FooterTemplate>

        </asp:Repeater>

    </div>
</asp:Content>
