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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rptLatest_PreRender(object sender, EventArgs e)
        {
            divContent.Visible = true;
            divEmpty.Visible = false;
            DataView view = DataTransaction.getAllArticles();
            if (view.Count > 1)
            {
                rptLatest.DataSource = view;
                rptLatest.DataBind();
            }
            else
            {
                divContent.Visible = false;
                divEmpty.Visible = true;
            }
        }   
    }
}