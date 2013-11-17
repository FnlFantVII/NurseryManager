using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseryManager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsCallback)
                SetLoginVisible(string.Equals(Request.QueryString["login"], "true", StringComparison.CurrentCultureIgnoreCase));

            if (Page.User.Identity.IsAuthenticated)
                lLogin.InnerText = "Sign Out";
            else
                lLogin.InnerText = "Sign In";
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
                FormsAuthentication.SetAuthCookie(UserName.Value, RememberMe.Checked);
                lLogin.InnerText = "Sign Out";
                SetLoginVisible(false);
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
                SetLoginVisible(true);
            }
        }

        private void SetLoginVisible(bool isVisible)
        {
            dLogin.Visible = isVisible;
            dHome.Visible = !isVisible;
        }
    }
}