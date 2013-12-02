using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace NurseryManager.admin
{
    public partial class Varieties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dsVarieties.SelectParameters["Name"].DefaultValue = txtSearchName.Text;
            dsVarieties.SelectParameters["ColorId"].DefaultValue = cmbColor.SelectedValue;
            dsVarieties.SelectParameters["SizeId"].DefaultValue = cmbSize.SelectedValue;
            dsVarieties.SelectParameters["TypeId"].DefaultValue = cmbType.SelectedValue;
            dsVarieties.SelectParameters["SubTypeId"].DefaultValue = cmbSubType.SelectedValue;
            dsVarieties.SelectParameters["ClimateId"].DefaultValue = cmbClimate.SelectedValue;
            dsVarieties.SelectParameters["MoistureId"].DefaultValue = cmbMoistureLevel.SelectedValue;
            dsVarieties.SelectParameters["ContainerId"].DefaultValue = cmbContainer.SelectedValue;
            dsVarieties.SelectParameters["HeatIndexId"].DefaultValue = cmbHeatIndex.SelectedValue;
            var items = dsVarieties.Select(new DataSourceSelectArguments());
            gvResults.DataBind();
        }

        protected void gvResults_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnClear_ServerClick(object sender, EventArgs e)
        {
            txtSearchName.Text = string.Empty;
            cmbClimate.SelectedValue = "0";
            cmbColor.SelectedValue = "0";
            cmbContainer.SelectedValue = "0";
            cmbHeatIndex.SelectedValue = "0";
            cmbMoistureLevel.SelectedValue = "0";
            cmbSize.SelectedValue = "0";
            cmbSubType.SelectedValue = "0";
            cmbType.SelectedValue = "0";
        }

        protected void btnNew_ServerClick(object sender, EventArgs e)
        {
            sManageVariety.Visible = false;
            sNewVariety.Visible = true;
            ResetNewVariety();
        }

        protected void btnNewCancel_ServerClick(object sender, EventArgs e)
        {
            sManageVariety.Visible = true;
            sNewVariety.Visible = false;
            gvResults.DataBind();
        }

        private void ResetNewVariety()
        {
            txtNewName.Text = string.Empty;
            txtNewDescription.Text = string.Empty;
            cmbNewClimate.SelectedValue = "0";
            cmbNewColor.SelectedValue = "0";
            cmbNewContainer.SelectedValue = "0";
            cmbNewHeatIndex.SelectedValue = "0";
            cmbNewMoistureLevel.SelectedValue = "0";
            cmbNewSize.SelectedValue = "0";
            cmbNewSubType.SelectedValue = "0";
        }

        protected void btnNewUpdate_ServerClick(object sender, EventArgs e)
        {
            try
            {
                dsVarieties.InsertParameters["Name"].DefaultValue = txtNewName.Text;
                dsVarieties.InsertParameters["Description"].DefaultValue = txtNewDescription.Text;
                dsVarieties.InsertParameters["ColorId"].DefaultValue = cmbNewColor.SelectedValue;
                dsVarieties.InsertParameters["SizeId"].DefaultValue = cmbNewSize.SelectedValue;
                dsVarieties.InsertParameters["SubTypeId"].DefaultValue = cmbNewSubType.SelectedValue;
                dsVarieties.InsertParameters["ClimateId"].DefaultValue = cmbNewClimate.SelectedValue;
                dsVarieties.InsertParameters["MoistureId"].DefaultValue = cmbNewMoistureLevel.SelectedValue;
                dsVarieties.InsertParameters["ContainerId"].DefaultValue = cmbNewContainer.SelectedValue;
                dsVarieties.InsertParameters["HeatIndexId"].DefaultValue = cmbNewHeatIndex.SelectedValue;
                dsVarieties.InsertParameters["IsDeterminate"].DefaultValue = chkNewIsDeterministic.Checked.ToString();

                int returnValue = dsVarieties.Insert();

                sManageVariety.Visible = true;
                sNewVariety.Visible = false;

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