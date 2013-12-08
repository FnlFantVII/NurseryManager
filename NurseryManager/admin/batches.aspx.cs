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

        protected void btnNewDelete_ServerClick(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["BatchId"].DefaultValue = txtNewBatchId.Value;
            SqlDataSource1.Delete();
            gvResults.DataBind();
        }

        protected void btnNewUpdate_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (txtNewBatchId.Value == "0")
                {
                    SqlDataSource1.InsertParameters["Name"].DefaultValue = txtNewBatchName.Value;
                    SqlDataSource1.InsertParameters["BatchLimit"].DefaultValue = txtNewBatchLimit.Value;
                    SqlDataSource1.InsertParameters["StartDate"].DefaultValue = txtNewBatchStart.Value;
                    SqlDataSource1.InsertParameters["OrderDeadline"].DefaultValue = txtNewBatchDeadline.Value;
                    SqlDataSource1.InsertParameters["PickupDate"].DefaultValue = txtNewBatchPickup.Value;
                    SqlDataSource1.InsertParameters["PickupEndDate"].DefaultValue = txtNewBatchPickupEnd.Value;

                    int returnValue = SqlDataSource1.Insert();
                }
                else
                {
                    SqlDataSource1.UpdateParameters["BatchId"].DefaultValue = txtNewBatchId.Value;
                    SqlDataSource1.UpdateParameters["Name"].DefaultValue = txtNewBatchName.Value;
                    SqlDataSource1.UpdateParameters["BatchLimit"].DefaultValue = txtNewBatchLimit.Value;
                    SqlDataSource1.UpdateParameters["StartDate"].DefaultValue = txtNewBatchStart.Value;
                    SqlDataSource1.UpdateParameters["OrderDeadline"].DefaultValue = txtNewBatchDeadline.Value;
                    SqlDataSource1.UpdateParameters["PickupDate"].DefaultValue = txtNewBatchPickup.Value;
                    SqlDataSource1.UpdateParameters["PickupEndDate"].DefaultValue = txtNewBatchPickupEnd.Value;

                    int returnValue = SqlDataSource1.Update();
                }

                gvResults.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
        }
    }
}