using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseryManager
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            if (!Page.IsCallback)  
                SetLoginVisible(string.Equals(Request.QueryString["login"], "true", StringComparison.CurrentCultureIgnoreCase));
            if (Page.User.Identity.IsAuthenticated)
                lLogin.InnerText = "Sign Out"; else       
                lLogin.InnerText = "Sign In";
            CheckMenu();
        }

        protected void lLogin_ServerClick(object sender, EventArgs e)
        { 
            if (Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                lLogin.InnerText = "Sign In";
            }
            else      
                SetLoginVisible(true); 
        }
        
        public void LoginUser(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(UserName.Value, Password.Value))
            {
                FormsAuthentication.RedirectFromLoginPage(UserName.Value, RememberMe.Checked);
            }
            else 
            { 
                lblFailureText.InnerText = "Login Failed."; 
                MembershipUser usr = Membership.GetUser(UserName.Value);
                if (usr != null)       
                    if (usr.IsLockedOut) 
                    {
                        lblFailureText.InnerText = "Account has been locked. (Auto reset for testing)"; 
                        usr.UnlockUser();
                    }
                lLogin.InnerText = "Sign In";
                menuAdmin.Visible = false;
                menuMyGarden.Visible = true;
                SetLoginVisible(true);
            }
            CheckMenu();
        }       
        
        private void SetLoginVisible(bool isVisible) 
        {
            dLogin.Visible = isVisible;
            cphMain.Visible = !isVisible;
        }

        private void CheckMenu()
        {
            if (Page.User.IsInRole("Administrator"))
                menuAdmin.Visible = true;
            if (Page.User.IsInRole("Member"))
                menuMyGarden.Visible = true;
        }
    }
}