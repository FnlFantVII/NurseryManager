<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="batches.aspx.cs" Inherits="NurseryManager.admin.batches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="sp_SearchForBatches" SelectCommandType="StoredProcedure" DeleteCommand="sp_DeleteBatch" DeleteCommandType="StoredProcedure" InsertCommand="sp_InsertBatch" InsertCommandType="StoredProcedure" UpdateCommand="sp_UpdateBatch" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="BatchId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="BatchLimit" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="OrderDeadline" Type="DateTime" />
            <asp:Parameter Name="PickupDate" Type="DateTime" />
            <asp:Parameter Name="PickupEndDate" Type="DateTime" />
            <asp:Parameter Direction="InputOutput" Name="BatchId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="Name" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="StartDate" Type="DateTime"  ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="EndDate" Type="DateTime"  ConvertEmptyStringToNull="false" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="BatchId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="BatchLimit" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="OrderDeadline" Type="DateTime" />
            <asp:Parameter Name="PickupDate" Type="DateTime" />
            <asp:Parameter Name="PickupEndDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1>Batches</h1>
    <section>
        <h2>Manage Your Batches</h2>
        <div id="dSearch">
            <fieldset>
                <legend>Search for Batches</legend>
                <label for="searchName">Name:</label>
                <input runat="server" id="txtSearchName" type="search" name="searchName" />
                <label for="searchStart">Start Date:</label>
                <input runat="server" id="txtSearchStart" type="date" name="searchStart" />
                <label for="searchEnd">End Date:</label>
                <input runat="server" id="txtSearchEnd" type="date" name="searchEnd" />
                <button id="btnSearch" runat="server" onserverclick="btnSearch_ServerClick">Search</button>
            </fieldset>
        </div>
        <div id="dSearchResults">
            <asp:GridView ID="gvResults" runat="server" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" Width="100%" DataKeyNames="BatchId" AllowSorting="True" ShowFooter="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
                OnRowUpdating="gvResults_RowUpdating" OnRowCommand="gvResults_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="BatchId" HeaderText="BatchId" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="BatchId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="BatchLimit" HeaderText="BatchLimit" SortExpression="BatchLimit" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="OrderDeadline" HeaderText="OrderDeadline" SortExpression="OrderDeadline" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="PickupDate" HeaderText="PickupDate" SortExpression="PickupDate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="PickupEndDate" HeaderText="PickupEndDate" SortExpression="PickupEndDate" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    <label>No Data</label>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </div>
        <fieldset>
            <legend>Batch Information</legend>
            <input id="txtNewBatchId" type="hidden" runat="server" />
            <div class="fieldset_left">
                <label for="newBatchName">Name:</label>
                <input id="txtNewBatchName" type="text" name="newBatchName" runat="server" />
            </div>
            <label for="newBatchLimit">Limit:</label>
            <input id="txtNewBatchLimit" type="text" name="newBatchLimit" runat="server" />
            <div class="fieldset_left">
                <label for="newBatchStart">Start Date:</label>
                <input id="txtNewBatchStart" type="date" name="newBatchStart" runat="server" />
            </div>
            <label for="newBatchDeadline">Order Deadline:</label>
            <input id="txtNewBatchDeadline" type="date" name="newBatchDeadline" runat="server" />
            <div class="fieldset_left">
                <label for="newBatchPickup">Pickup Date:</label>
                <input id="txtNewBatchPickup" type="date" name="newBatchPickup" runat="server" />
            </div>
            <label for="newBatchPickupEnd">Pickup Deadline:</label>
            <input id="txtNewBatchPickupEnd" type="date" name="newBatchPickupEnd" runat="server" />
        </fieldset>
    </section>
</asp:Content>
