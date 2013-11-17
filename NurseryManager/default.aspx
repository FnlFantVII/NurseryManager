<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="default.aspx.cs" Inherits="NurseryManager.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>My Tomato Garden - Home</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, user-scalable=false;" />
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
    <link rel="stylesheet" href="styles/main_narrow.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <%--<script src="scripts/common.js" type="text/javascript"></script>--%>
    <script type="text/javascript">

        $(init);

        function init() {
            $('#menuIcon').click(toggleMenu);
            //$('#loginArea').hover(toggleLogin);
            $('nav').load('content/nav.aspx', navLoaded);
            //$('btnLogin').click(PageMethods.LoginUser('test', 'test', loginSuccess));
        };

        //function loginSuccess(Result)
        //{
        //    alert(result);
        //}

        function navLoaded() {

            $('nav ul').find('li:first').addClass('current_page_item');

            $('nav a').click(function (e) {
                e.preventDefault();
                $('#Container').load(e.target.href + ' #Content');
                $('nav ul li').removeClass('current_page_item');
                $(e.target).parent().addClass('current_page_item');
            });
        }

        function toggleMenu() {
            if ($('nav').hasClass('closed')) {
                $('nav').toggleClass('closed');
                $('nav').slideDown("medium");
            } else {
                $('nav').slideUp("medium");
                $('nav').toggleClass('closed');
            }
        };

        //function toggleLogin() {
        //    if ($('#lgnLogin').hasClass('closed')) {
        //        $('#lgnLogin').toggleClass('closed');
        //        $('#lgnLogin').slideDown("medium");
        //    } else {
        //        $('#lgnLogin').slideUp("medium");
        //        $('#lgnLogin').toggleClass('closed');
        //    }
        //};
    </script>
</head>
<body>
    <form id="mainForm" runat="server">
        <asp:ScriptManager ID="sm1" runat="server" EnablePageMethods="true">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
            </Scripts>
        </asp:ScriptManager>
        <div id="headerWrapper">
            <header>
                <div id="menuIcon" class="hidden"></div>
                <img src="images/logo.jpg" />
                <nav>
                </nav>
            </header>
            <div id="headerBottom">
                <div id="loginArea">
                    <a id="lLogin" runat="server" onserverclick="lLogin_ServerClick">Sign In</a>
                </div>
            </div>
        </div>
        <!-- Content -->
        <div id="Container">
            <div id="Content">
                <div id="dHome" runat="server">
                    <h1>Home</h1>
                    <section>
                        <h2>Welcome to My Tomato Garden</h2>
                        <p>
                            Here you will be able to find out more about heirloom tomatoes, ask questions and have
               discussions about plants, find/swap recipes, and review what you have grown!
               
                        </p>
                    </section>
                    <section>
                        <h2>What is an Heirloom Tomato?</h2>
                        <p>
                            An heirloom is generally considered to be a variety that has been passed down,
                through several generations of a family because of it's valued characteristics.
                Since 'heirloom' varieties have become popular in the past few years there have
                been liberties taken with the use of this term for commercial purposes.  The
                following categories of heirlooms are classifications described by Craig LeHoullier
                and Carolyn Male:
               
                        </p>
                        <ul>
                            <li>Commercial Heirlooms: Open-pollinated varieties introduced before 1940, or tomato
                    varieties more than 50 years in circulation.</li>
                            <li>Family Heirlooms: Seeds that have been passed down for several generations through a family.</li>
                            <li>Created Heirlooms: Crossing two known parents (either two heirlooms or an heirloom and a hybrid)
                    and dehybridizing the resulting seeds for how ever many years/generations it takes to eliminate
                    the undesirable characteristics and stabilize the desired characteristics, perhaps as many as 8
                    years or more.</li>
                            <li>Mystery Heirlooms: Varieties that are a product of natural cross-pollination of other heirloom varieties.</li>
                        </ul>
                    </section>
                </div>
                <div id="dLogin" runat="server" visible="false">
                    <h1>Sign in to Your Private Garden</h1>
                    <section>
                        <h2>Login</h2>
                        <div id="loginContainer" runat="server">
                            <label>User Name:</label>
                            <div class="block">
                                <input type="text" id="UserName" runat="server" />
                            </div>
                            <label>Password:</label>
                            <div class="block">
                                <input type="password" id="Password" runat="server" />
                            </div>
                            <div class="block">
                                <input type="checkbox" id="RememberMe" runat="server" />
                                Remember Me.
                            </div>
                            <label id="lblFailureText" runat="server"></label>
                            <input type="submit" id="btnLogin" runat="server" value="Log In" onserverclick="LoginUser" />
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
