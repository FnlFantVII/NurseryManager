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
            dsVarieties.SelectParameters["ColorId"].DefaultValue = string.IsNullOrEmpty(cmbColor.SelectedValue) ? "0" : cmbColor.SelectedValue;
            dsVarieties.SelectParameters["SizeId"].DefaultValue = string.IsNullOrEmpty(cmbSize.SelectedValue) ? "0" : cmbSize.SelectedValue;
            dsVarieties.SelectParameters["TypeId"].DefaultValue = string.IsNullOrEmpty(cmbType.SelectedValue) ? "0" : cmbType.SelectedValue;
            dsVarieties.SelectParameters["SubTypeId"].DefaultValue = string.IsNullOrEmpty(cmbSubType.SelectedValue) ? "0" : cmbSubType.SelectedValue;
            dsVarieties.SelectParameters["ClimateId"].DefaultValue = string.IsNullOrEmpty(cmbClimate.SelectedValue) ? "0" : cmbClimate.SelectedValue;
            dsVarieties.SelectParameters["MoistureId"].DefaultValue = string.IsNullOrEmpty(cmbMoistureLevel.SelectedValue) ? "0" : cmbMoistureLevel.SelectedValue;
            dsVarieties.SelectParameters["ContainerId"].DefaultValue = string.IsNullOrEmpty(cmbContainer.SelectedValue) ? "0" : cmbContainer.SelectedValue;
            dsVarieties.SelectParameters["HeatIndexId"].DefaultValue = string.IsNullOrEmpty(cmbHeatIndex.SelectedValue) ? "0" : cmbHeatIndex.SelectedValue;
            //var items = dsVarieties.Select(new DataSourceSelectArguments());
            gvResults.DataBind();
        }

        protected void btnNewDelete_ServerClick(object sender, EventArgs e)
        {
            dsVarieties.DeleteParameters["VarietyId"].DefaultValue = txtNewId.Value;
            dsVarieties.Delete();
            gvResults.DataBind();
        }

        protected void btnNewUpdate_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (txtNewId.Value == "0")
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
                    dsVarieties.InsertParameters["IsDeterminate"].DefaultValue = cmbNewIsDeterminate.SelectedValue;

                    int returnValue = dsVarieties.Insert();
                }
                else
                {
                    dsVarieties.UpdateParameters["VarietyId"].DefaultValue = txtNewId.Value;
                    dsVarieties.UpdateParameters["Name"].DefaultValue = txtNewName.Text;
                    dsVarieties.UpdateParameters["Description"].DefaultValue = txtNewDescription.Text;
                    dsVarieties.UpdateParameters["ColorId"].DefaultValue = cmbNewColor.SelectedValue;
                    dsVarieties.UpdateParameters["SizeId"].DefaultValue = cmbNewSize.SelectedValue;
                    dsVarieties.UpdateParameters["SubTypeId"].DefaultValue = cmbNewSubType.SelectedValue;
                    dsVarieties.UpdateParameters["ClimateId"].DefaultValue = cmbNewClimate.SelectedValue;
                    dsVarieties.UpdateParameters["MoistureId"].DefaultValue = cmbNewMoistureLevel.SelectedValue;
                    dsVarieties.UpdateParameters["ContainerId"].DefaultValue = cmbNewContainer.SelectedValue;
                    dsVarieties.UpdateParameters["HeatIndexId"].DefaultValue = cmbNewHeatIndex.SelectedValue;
                    dsVarieties.UpdateParameters["IsDeterminate"].DefaultValue = cmbNewIsDeterminate.SelectedValue;

                    int returnValue = dsVarieties.Update();
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