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
    public partial class Submit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                recap.Validate();
                recap.ValidateRequestMode = System.Web.UI.ValidateRequestMode.Enabled;
                int ArticleID = getAndSubmitArticle();
                if (ArticleID > 0)
                    Response.Redirect("~/Articles.aspx?" + ArticleID);
            }
        }

        private int getAndSubmitArticle()
        {
            ArticleDTO article = new ArticleDTO();
            article.Title = tbTitle.Text;
            article.GenreID = int.Parse(ddlGenre.SelectedValue);
            article.FullText = tbArticle.Text;
            article.SummaryText = tbSummary.Text;
            article.AuthorID = 5;
            article.PostTime = DateTime.Now;
            int zip = 0;
            if (int.TryParse(tbZip.Text, out zip))
                article.ZipCode = zip;
            return DataTransaction.submitArticle(article);
        }

      


        protected void ddlGenre_PreRender(object sender, EventArgs e)
        {
            ddlGenre.DataSource = DataTransaction.getGenres();
            ddlGenre.DataValueField = "GenreID";
            ddlGenre.DataTextField = "GenreName";
            ddlGenre.DataBind();
        }        
    }
}