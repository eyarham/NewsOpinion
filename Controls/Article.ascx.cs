using NewsOpinionDAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewsOpinion
{
    public partial class Article : System.Web.UI.UserControl
    {
        public bool IsPreview { get; set; }
        public string Author { get; set; }
        public DateTime PostTime { get; set; }
        public string Title { get; set; }
        public string SummaryText { get; set; }
        public string FullText { get; set; }
        public int ArticleID { get; set; }
        public string GenreName { get; set; }
        public int ZipCode { get; set; }
        public int AuthorID { get; set; }
        public int GenreID { get; set; }
        public int sessionArticleID
        {
            get
            {
                if (Session["sessionArticleID"] != null &&
                    !string.IsNullOrEmpty(Session["sessionArticleID"].ToString()))
                {
                    int tempID = 0;
                    if (int.TryParse(Session["sessionArticleID"].ToString(), out tempID))
                    {
                        return tempID;
                    }
                }
                return 0;
            }
            set
            {
                Session["sessionArticleID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region get comments

        protected void rptComments_PreRender(object sender, EventArgs e)
        {
            commentList.Visible = true;
            divEmpty.Visible = false;
            DataView view = DataTransaction.getCommentsByArticleID(ArticleID);
            if (view.Count > 0)
            {
                rptComments.DataSource = view;
                rptComments.DataBind();
            }
            else
            {
                commentList.Visible = false;
                divEmpty.Visible = true;
            }
        }

        #endregion

        #region save comment

        protected void btnCommentSubmit_Click(object sender, EventArgs e)
        {
            CommentDTO comment = new CommentDTO();
            comment.CommentText = commentBox.Text;
            comment.UserName = "Anonymous";
            comment.ArticleID = sessionArticleID;
            comment.CommentDateTime = DateTime.Now;
            DataTransaction.submitComment(comment);
        }

        private Control findControlRecursive(Control root, string searchString)
        {
            foreach (Control control in root.Controls)
            {
                if (control.ID == searchString)
                    return control;
                else
                    return findControlRecursive(control, searchString);
            }
            return null;
        }
      
        private string GetUserIP()
        {
            string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipList))
            {
                return ipList.Split(',')[0];
            }

            return Request.ServerVariables["REMOTE_ADDR"];
        }

        #endregion

        //public Article(string title)
        //{
        //    Title = title;
        //}
    }
}