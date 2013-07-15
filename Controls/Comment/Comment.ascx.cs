using NewsOpinionDAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewsOpinion
{
    public partial class Comment : System.Web.UI.UserControl 
    {
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
        public string UserName { get; set; }
        public string CommentText { get; set; }
        public DateTime CommentDateTime { get; set; }
        public int UserID { get; set; }
        public string UserIPAddress { get; set; }
        public int ArticleID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

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

    }
}