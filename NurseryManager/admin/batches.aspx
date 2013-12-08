<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="batches.aspx.cs" Inherits="NurseryManager.admin.batches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function editItem(element) {
            //pass values for editing
            $('*[id*=txtNewBatchId]').val(element.children()[0].innerHTML);
            $('*[id*=txtNewBatchName]').val(element.children()[1].innerHTML);
            $('*[id*=txtNewBatchLimit]').val(element.children()[2].innerHTML);
            $('*[id*=txtNewBatchStart]').val(element.children()[3].innerHTML);
            $('*[id*=txtNewBatchDeadline]').val(element.children()[4].innerHTML);
            $('*[id*=txtNewBatchPickup]').val(element.children()[5].innerHTML);
            $('*[id*=txtNewBatchPickupEnd]').val(element.children()[6].innerHTML);
        }

        function confirmDelete() {
            if (!confirm("Are you sure you want to delete this record?"))
                return false;

            <%= Page.ClientScript.GetPostBackEventReference(new PostBackOptions(btnDelete))%>;
        };
    </script>
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
            <asp:Parameter Name="StartDate" Type="DateTime" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="EndDate" Type="DateTime" ConvertEmptyStringToNull="false" />
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
    <section id="sSearch">
        <h2 class="clickable" onclick="toggleId('#dSearch')">Manage Your Batches</h2>
        <div id="dSearch">
            <fieldset>
                <legend>Search for Batches</legend>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <label for="searchName">Name:</label>
                    </div>
                    <input runat="server" id="txtSearchName" type="search" name="searchName" />
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <label for="searchStart">Start Date:</label>
                    </div>
                    <input runat="server" id="txtSearchStart" type="date" name="searchStart" />
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <label for="searchEnd">End Date:</label>
                    </div>
                    <input runat="server" id="txtSearchEnd" type="date" name="searchEnd" />
                </div>
            </fieldset>
        </div>
        <div class="inline">
            <div class="dButtonRow">
                <button id="btnSearch" runat="server" onserverclick="btnSearch_ServerClick">Search</button>
                <button id="btnClear" type="button" onclick="clearSearch()">Clear</button>
            </div>
        </div>
    </section>
    <section id="sSearchResults">
        <h2 class="clickable" onclick="toggleId('#dSearchResults')">Search Results</h2>
        <div id="dSearchResults">
            <asp:GridView ID="gvResults" runat="server" PageSize="10" AllowPaging="true" PagerStyle-HorizontalAlign="Left" PagerStyle-CssClass="pagerStyleLeft"
                 DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="True"
                 AutoGenerateColumns="False" Width="100%" DataKeyNames="BatchId"
                 AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BatchId" HeaderText="BatchId" SortExpression="BatchId" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="BatchLimit" HeaderText="BatchLimit" SortExpression="BatchLimit" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="OrderDeadline" HeaderText="OrderDeadline" SortExpression="OrderDeadline" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="PickupDate" HeaderText="PickupDate" SortExpression="PickupDate" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="PickupEndDate" HeaderText="PickupEndDate" SortExpression="PickupEndDate" DataFormatString="{0:yyyy-MM-dd}" />
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
        <div class="inline">
            <div class="dButtonRow">
                <button id="btnNew" type="button" onclick="newItem(false)" class="left_align_button">New</button>
            </div>
        </div>
    </section>
    <section id="sDetail">
        <h2>Batch Information</h2>
        <fieldset>
            <legend>Batch Information</legend>
            <input id="txtNewBatchId" type="hidden" runat="server" value="0" />
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchName">Name:</label>
                </div>
                <input id="txtNewBatchName" type="text" name="newBatchName" runat="server" />
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchLimit">Limit:</label>
                </div>
                <input id="txtNewBatchLimit" type="text" name="newBatchLimit" runat="server" />
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchStart">Start Date:</label>
                </div>
                <input id="txtNewBatchStart" type="date" name="newBatchStart" runat="server" />
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchDeadline">Order Deadline:</label>
                </div>
                <input id="txtNewBatchDeadline" type="date" name="newBatchDeadline" runat="server" />
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchPickup">Pickup Date:</label>
                </div>
                <input id="txtNewBatchPickup" type="date" name="newBatchPickup" runat="server" />
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <label for="newBatchPickupEnd">Pickup Deadline:</label>
                </div>
                <input id="txtNewBatchPickupEnd" type="date" name="newBatchPickupEnd" runat="server" />
            </div>
            <div class="dButtonRow">
                <button id="btnNewCancel" type="button" onclick="newItem(true)">Cancel</button>
                <button id="btnNewUpdate" runat="server" onserverclick="btnNewUpdate_ServerClick">Update</button>
                <button id="btnDelete" visible="false" runat="server" onserverclick="btnNewDelete_ServerClick" class="left_align_button">Delete</button>
                <button id="btnNewDelete" visible="false" class="left_align_button">Delete</button>
            </div>
        </fieldset>
    </section>
</asp:Content>
