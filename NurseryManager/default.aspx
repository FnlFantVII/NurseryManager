<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="NurseryManager._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
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
</asp:Content>
