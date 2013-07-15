<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Comment.ascx.cs" Inherits="NewsOpinion.Comment" %>

<div style="max-width: 500px;">
    <div>
        <h3 style="font-weight: 700;"><%# UserName %></h3>
        <%# 
        ((DateTime.Now - CommentDateTime).Minutes) <1? (DateTime.Now - CommentDateTime).Seconds + " seconds ago":
        ((DateTime.Now - CommentDateTime).Hours) <1? (DateTime.Now - CommentDateTime).Minutes + " minutes ago":
        ((DateTime.Now - CommentDateTime).Days)<1? (DateTime.Now - CommentDateTime).Hours + " hours ago":
        (DateTime.Now - CommentDateTime).Days + " days ago"                                               
        %>
    </div>
    <div>
        <%# CommentText %>
    </div>
    <div id="newComment">
        <asp:TextBox ID="commentBox" runat="server" ></asp:TextBox>
        <ajaxToolkit:TextBoxWatermarkExtender ID="commentWatermark" runat="server" TargetControlID="commentBox" WatermarkText="Add a comment..."></ajaxToolkit:TextBoxWatermarkExtender>
        <asp:Button ID="btnCommentSubmit" runat="server" Text="Reply" OnClick="btnCommentSubmit_Click" />
    </div>
    <hr />
</div>
