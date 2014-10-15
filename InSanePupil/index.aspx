<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="index.aspx.vb" Inherits="InSanePupil.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/product.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MydatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [Games] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Games] ([Name], [Description], [Category], [url], [Console], [Price], [Status]) VALUES (@Name, @Description, @Category, @url, @Console, @Price, @Status)" SelectCommand="SELECT [Id], [Name], [Description], [Category], [url], [Console], [Price], [Status] FROM [Games] ORDER BY [Description]" UpdateCommand="UPDATE [Games] SET [Name] = @Name, [Description] = @Description, [Category] = @Category, [url] = @url, [Console] = @Console, [Price] = @Price, [Status] = @Status WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="Console" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Status" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="Console" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id">

        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <li>
                <figure>
                    <div id="image-div">
                        <img src="../imgs/catalogue/<%# Eval("url") %>" class="image" />
                    </div>

                    <figcaption>
                        <h3 id="price" runat="server"><%# Eval("Name") %> </h3>
                        <span id="name" runat="server">R<%# Eval("Price") %></span>
                        <a id="addTocart" class="button-cart pure-button" href="../cart/AddTocart.aspx?ProductId=<%# Eval("Id")%>&Price=<%# Eval("Price") %>&Name=<%# Eval("Name") %>&Console=<%# Eval("Console") %>&Image=<%# Eval("url") %>&Status=<%# Eval("Status") %>&Description=<%#Eval("Description")%>"><i class="fa fa-shopping-cart fa-lg"></i> Add to Cart</a>
                    </figcaption>
                </figure>
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul class="grid cs-style-2" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </ul>
        </LayoutTemplate>


    </asp:ListView>


</asp:Content>
