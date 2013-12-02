using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NurseryManager.admin
{
    public partial class batches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["Name"].DefaultValue = txtSearchName.Value;
            SqlDataSource1.SelectParameters["StartDate"].DefaultValue = string.IsNullOrEmpty(txtSearchStart.Value) ? "1/1/1900" : txtSearchStart.Value;
            SqlDataSource1.SelectParameters["EndDate"].DefaultValue = string.IsNullOrEmpty(txtSearchEnd.Value) ? "1/1/1900" : txtSearchEnd.Value;
            gvResults.DataBind();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
        }

        private void RefreshResults()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlAzure"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_SearchForBatches";
                cmd.Parameters.Add(new SqlParameter("@Name", txtSearchName.Value));
                cmd.Parameters.Add(new SqlParameter("@StartDate", txtSearchStart.Value));
                cmd.Parameters.Add(new SqlParameter("@EndDate", txtSearchEnd.Value));

                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                gvResults.DataSource = dt;
                gvResults.DataBind();
            }
        }

        protected void gvResults_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //SqlDataSource1.UpdateParameters[
                /*
                 * <asp:Parameter Name="BatchId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="BatchLimit" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="OrderDeadline" Type="DateTime" />
            <asp:Parameter Name="PickupDate" Type="DateTime" />
            <asp:Parameter Name="PickupEndDate" Type="DateTime" />
                 * */
        }

        protected void gvResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                foreach (var item in gvResults.Columns)
                {
                }
            }
        }
    }
}