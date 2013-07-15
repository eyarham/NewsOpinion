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
    public partial class Genres : System.Web.UI.Page
    {
        public string GenreName
        {
            get
            {
                if (Request.QueryString.Count > 0)
                    if (!string.IsNullOrEmpty(Request.QueryString[0]))
                        return Request.QueryString[0];
                return " ";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region specific Genre

        protected void dlArticles_PreRender(object sender, EventArgs e)
        {
            divContent.Visible = true;
            divEmpty.Visible = false;
            DataView dv = DataTransaction.getArticlesByGenreName(GenreName);
            if (dv.Count == 1)
            {
                oneGenre.Visible = true;
                multiGenre.Visible = false;
                rptGenreHeader.DataSource = dv;
                rptGenreHeader.DataBind();
                rpt.DataSource = dv;
                rpt.DataBind();
            }
            else
            {
                oneGenre.Visible = false;
                multiGenre.Visible = true;
                divContent.Visible = false;
                divEmpty.Visible = true;
            }
        }

        #endregion

        #region Genre List

        protected void rptGenres_PreRender(object sender, EventArgs e)
        {
            rptGenres.DataSource = DataTransaction.getGenres();
            rptGenres.DataBind();
        }

        #endregion
    }
}