<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Article.ascx.cs" Inherits="NewsOpinion.Article" %>

<div>
    <div>
        <h2 style="padding-top: 10px;">
            <asp:HyperLink ID="articleLink" Font-Underline="false" runat="server" NavigateUrl='<%# "~/Articles?"+ ArticleID %>'><%# Title %></asp:HyperLink>
        </h2>
    </div>
    <div>
        <h3><%# Author %></h3>
        <br />
    </div>
    <div id="content" runat="server">
        <%# IsPreview? SummaryText: FullText  %>
    </div>
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>

            <div id="conversation" runat="server" visible='<%# !IsPreview %>'>
                <div id="newComment">
                    <asp:TextBox ID="commentBox" runat="server" TextMode="SingleLine"></asp:TextBox>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="commentWatermark" runat="server" TargetControlID="commentBox" WatermarkText="Add a comment..."></ajaxToolkit:TextBoxWatermarkExtender>
                    <asp:Button ID="btnCommentSubmit" runat="server" Text="Post Comment" OnClick="btnCommentSubmit_Click" />
                </div>
                <div id="commentList" runat="server">
                    <asp:Repeater ID="rptComments" runat="server" OnPreRender="rptComments_PreRender">
                        <ItemTemplate>
                            <my:Comment runat="server" CommentText='<%# Eval("CommentText") %>' CommentDateTime='<%# Eval("DateTime") %>' UserName='<%# (!string.IsNullOrEmpty(Eval("UserName").ToString()))?Eval("UserName"):"Anonymous" %>' />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div id="divEmpty" runat="server">
                    There are no comments. Be the first!
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
