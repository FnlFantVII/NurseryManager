<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Varieties.aspx.cs" Inherits="NurseryManager.admin.Varieties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function editItem(element) {
            //pass values for editing
            $('*[id*=txtNewId]').val(element.children()[0].innerHTML);
            $('*[id*=txtNewName]').val(element.children()[1].innerHTML);
            $('*[id*=txtNewDescription]').val(element.children()[2].innerHTML);
            selectComboValue('*[id*=cmbNewColor]', element.children()[3].innerHTML);
            selectComboValue('*[id*=cmbNewSize]', element.children()[4].innerHTML);
            selectComboValue('*[id*=cmbNewSubType]', $.trim(element.children()[5].innerHTML));
            selectComboValue('*[id*=cmbNewClimate]', element.children()[6].innerHTML);
            selectComboValue('*[id*=cmbNewMoistureLevel]', element.children()[7].innerHTML);
            selectComboValue('*[id*=cmbNewContainer]', element.children()[8].innerHTML);
            selectComboValue('*[id*=cmbNewHeatIndex]', element.children()[9].innerHTML);
            //selectComboValue('*[id*=cmbNewIsDeterminate]', element.children()[10].innerHTML);
        }

        function confirmDelete() {
            if (!confirm("Are you sure you want to delete this record?"))
                return false;

            <%= Page.ClientScript.GetPostBackEventReference(new PostBackOptions(btnDelete))%>;
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">

    <!-- Data Sources --------------------------------------------------->
    <asp:SqlDataSource ID="dsVarieties" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="sp_SearchForVarieties" SelectCommandType="StoredProcedure" DeleteCommand="sp_DeleteVariety" DeleteCommandType="StoredProcedure" InsertCommand="sp_InsertVariety" InsertCommandType="StoredProcedure" UpdateCommand="sp_UpdateVariety" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="VarietyId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ColorId" Type="Int32" />
            <asp:Parameter Name="SizeId" Type="Int32" />
            <asp:Parameter Name="SubTypeId" Type="Int32" />
            <asp:Parameter Name="ClimateId" Type="Int32" />
            <asp:Parameter Name="MoistureId" Type="Int32" />
            <asp:Parameter Name="ContainerId" Type="Int32" />
            <asp:Parameter Name="HeatIndexId" Type="Int32" />
            <asp:Parameter Name="IsDeterminate" Type="Boolean" />
            <asp:Parameter Direction="InputOutput" Name="VarietyId" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter ConvertEmptyStringToNull="False" Name="Name" Type="String" />
            <asp:Parameter Name="ColorId" Type="Int32" />
            <asp:Parameter Name="SizeId" Type="Int32" />
            <asp:Parameter Name="TypeId" Type="Int32" />
            <asp:Parameter Name="SubTypeId" Type="Int32" />
            <asp:Parameter Name="ClimateId" Type="Int32" />
            <asp:Parameter Name="MoistureId" Type="Int32" />
            <asp:Parameter Name="ContainerId" Type="Int32" />
            <asp:Parameter Name="HeatIndexId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="VarietyId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ColorId" Type="Int32" />
            <asp:Parameter Name="SizeId" Type="Int32" />
            <asp:Parameter Name="SubTypeId" Type="Int32" />
            <asp:Parameter Name="ClimateId" Type="Int32" />
            <asp:Parameter Name="MoistureId" Type="Int32" />
            <asp:Parameter Name="ContainerId" Type="Int32" />
            <asp:Parameter Name="HeatIndexId" Type="Int32" />
            <asp:Parameter Name="IsDeterminate" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsColor" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT [ColorId], [Color] FROM [VarietyColor] UNION SELECT 0, '<None>' ORDER BY [Color]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsClimate" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT ClimateId, Climate, Description FROM [VarietyClimate] UNION SELECT 0, '<None>', '<None>' ORDER BY [ClimateId]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSize" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT SizeId, Size, Description FROM [VarietySize] UNION SELECT 0, '<None>', '<None>' ORDER BY [SizeId]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsContainer" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT ContainerId, Container, Description FROM [VarietyContainer] UNION SELECT 0, '<None>', '<None>' ORDER BY [Container]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHeatIndex" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT HeatIndexId, HeatIndex, Description FROM [VarietyHeatIndex] UNION SELECT 0, '<None>', '<None>' ORDER BY [HeatIndexId]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsSubType" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT ST.SubTypeId, ST.SubType, ST.Description, T.Type + '/' + ST.SubType AS Type_SubType FROM VarietySubType ST INNER JOIN VarietyType T ON ST.TypeId = T.TypeId UNION SELECT 0, '<None>', '<None>', '<None>' ORDER BY Type_SubType"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsType" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT TypeId, Type FROM [VarietyType] UNION SELECT 0, '<None>' ORDER BY [Type]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsMoisture" runat="server" ConnectionString="<%$ ConnectionStrings:SqlAzure %>" SelectCommand="SELECT MoistureId, MoistureLevel, Description FROM [VarietyMoistureLevel] UNION SELECT 0, '<None>', '<None>' ORDER BY [MoistureId]"></asp:SqlDataSource>
    <!-- End Data Sources ---------------------------------------------->

    <h1>Plant Varieties</h1>
    <section id="sSearch">
        <h2 class="clickable" onclick="toggleId('#dSearch')">Search Query</h2>
        <div id="dSearch">
            <fieldset>
                <legend>Search Properties</legend>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label1" runat="server" Text="Name:" AssociatedControlID="txtSearchName"></asp:Label>
                    </div>
                    <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label2" runat="server" Text="Color:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbColor" DataSourceID="dsColor" DataValueField="ColorId" DataTextField="Color" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label3" runat="server" Text="Size:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbSize" DataSourceID="dsSize" DataValueField="SizeId" DataTextField="Size" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label4" runat="server" Text="Type:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbType" DataSourceID="dsType" DataValueField="TypeId" DataTextField="Type" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label5" runat="server" Text="SubType:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbSubType" DataSourceID="dsSubType" DataValueField="SubTypeId" DataTextField="SubType" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label6" runat="server" Text="Climate:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbClimate" DataSourceID="dsClimate" DataValueField="ClimateId" DataTextField="Climate" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label7" runat="server" Text="Moisture Level:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbMoistureLevel" DataSourceID="dsMoisture" DataValueField="MoistureId" DataTextField="MoistureLevel" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label8" runat="server" Text="Container:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbContainer" DataSourceID="dsContainer" DataValueField="ContainerId" DataTextField="Container" runat="server"></asp:DropDownList>
                </div>
                <div class="multi_col">
                    <div class="sub_col_left">
                        <asp:Label ID="Label9" runat="server" Text="Heat Index:"></asp:Label>
                    </div>
                    <asp:DropDownList ID="cmbHeatIndex" DataSourceID="dsHeatIndex" DataValueField="HeatIndexId" DataTextField="HeatIndex" runat="server"></asp:DropDownList>
                </div>
                <div class="dButtonRow">
                    <button id="btnSearch" runat="server" onserverclick="btnSearch_ServerClick">Search</button>
                    <button id="btnClear" type="button" onclick="clearSearch()">Clear</button>
                    <button id="btnNew" type="button" onclick="newItem(false)" class="left_align_button" >New</button>
                </div>
            </fieldset>
        </div>
    </section>
    <section id="sSearchResults">
        <h2 class="clickable" onclick="toggleId('#dSearchResults')">Search Results</h2>
        <div id="dSearchResults">
            <asp:GridView ID="gvResults" runat="server" DataSourceID="dsVarieties" DataKeyNames="VarietyId" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" Width="100%" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="VarietyId" HeaderText="VarietyId" SortExpression="VarietyId" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                    <asp:TemplateField HeaderText="Type/SubType">
                        <ItemTemplate>
                            <%#Eval("Type") + "/" + Eval("SubType")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Climate" HeaderText="Climate" SortExpression="Climate" />
                    <asp:BoundField DataField="MoistureLevel" HeaderText="MoistureLevel" SortExpression="MoistureLevel" />
                    <asp:BoundField DataField="Container" HeaderText="Container" SortExpression="Container" />
                    <asp:BoundField DataField="HeatIndex" HeaderText="HeatIndex" SortExpression="HeatIndex" />
                    <asp:CheckBoxField DataField="IsDeterminate" HeaderText="IsDeterminate" SortExpression="IsDeterminate" />
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
    </section>
    <section id="sDetail">
        <h2>Variety Information</h2>
        <fieldset>
            <legend>Variety Details</legend>
            <input type="hidden" value="0" runat="server" id="txtNewId" />
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label10" runat="server" Text="Name:" AssociatedControlID="txtNewName"></asp:Label>
                </div>
                <asp:TextBox ID="txtNewName" runat="server"></asp:TextBox>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label13" runat="server" Text="Description:" AssociatedControlID="txtNewDescription"></asp:Label>
                </div>
                <asp:TextBox ID="txtNewDescription" runat="server"></asp:TextBox>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label11" runat="server" Text="Color:" AssociatedControlID="cmbNewColor"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewColor" DataSourceID="dsColor" DataValueField="ColorId" DataTextField="Color" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label12" runat="server" Text="Size:" AssociatedControlID="cmbNewSize"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewSize" DataSourceID="dsSize" DataValueField="SizeId" DataTextField="Size" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label14" runat="server" Text="SubType:" AssociatedControlID="cmbNewSubType"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewSubType" DataSourceID="dsSubType" DataValueField="SubTypeId" DataTextField="Type_SubType" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label15" runat="server" Text="Climate:" AssociatedControlID="cmbNewClimate"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewClimate" DataSourceID="dsClimate" DataValueField="ClimateId" DataTextField="Climate" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label16" runat="server" Text="Moisture Level:" AssociatedControlID="cmbNewMoistureLevel"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewMoistureLevel" DataSourceID="dsMoisture" DataValueField="MoistureId" DataTextField="MoistureLevel" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label17" runat="server" Text="Container:" AssociatedControlID="cmbNewContainer"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewContainer" DataSourceID="dsContainer" DataValueField="ContainerId" DataTextField="Container" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label18" runat="server" Text="Heat Index:" AssociatedControlID="cmbNewHeatIndex"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewHeatIndex" DataSourceID="dsHeatIndex" DataValueField="HeatIndexId" DataTextField="HeatIndex" runat="server"></asp:DropDownList>
            </div>
            <div class="multi_col">
                <div class="sub_col_left">
                    <asp:Label ID="Label19" runat="server" Text="Deterministic:" AssociatedControlID="cmbNewIsDeterministic"></asp:Label>
                </div>
                <asp:DropDownList ID="cmbNewIsDeterministic" runat="server">
                    <asp:ListItem Selected="True" Text="Yes" Value="true"></asp:ListItem>
                    <asp:ListItem Text="No" Value="false"></asp:ListItem>
                </asp:DropDownList>
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
