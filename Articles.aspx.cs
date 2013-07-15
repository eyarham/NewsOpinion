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
    public partial class Articles : System.Web.UI.Page
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
        public string Genre
        {
            get
            {
                string genrename = "";
                genrename = DataTransaction.getGenre(ArticleID);
                return genrename;
            }
        }
        public int ArticleID
        {
            get
            {
                int artID = 0;
                if (Request.QueryString.Count > 0)
                    int.TryParse(Request.QueryString[0], out artID);
                sessionArticleID = artID;
                return artID;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // divContent.Controls.Add(getArticle());
        }


        protected void rptArticles_PreRender(object sender, EventArgs e)
        {
            DataView view = DataTransaction.getArticleByArticleID(ArticleID);
            if (view.Count == 1)
            {
                oneArticle.Visible = true;
                multiArticle.Visible = false;
                Repeater1.DataSource = view;
                Repeater1.DataBind();
                rptArticles.DataSource = view;
                rptArticles.DataBind();
            }
            else
            {
                oneArticle.Visible = false;
                multiArticle.Visible = true;
                rptArticles.DataSource = DataTransaction.getAllArticles();
                rptArticles.DataBind();
            }
        }
    }
}
