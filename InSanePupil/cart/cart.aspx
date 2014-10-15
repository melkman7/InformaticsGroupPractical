<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="cart.aspx.vb" Inherits="InSanePupil.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">

        .quantity {
            margin-top:2px;
            border:1px solid #808080;
            border-radius:4px;
        }
        .updateButton {

            border:1px solid #ff6a00;
            border-radius:4px;
            color:#000000;
            background-color:transparent;
            height:30px;
             width:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="padding:20px;">
			<h1 style="text-align:center; font-size:30px;color:#808080;" >Shopping Cart</h1>
			<a href="../index.aspx" style=" text-decoration:none; color:#ff6a00; font-size:18px;">Continue Shopping</a>
			<br /><br />
			<asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="false" EmptyDataText="There is nothing in your shopping cart." GridLines="None" Width="100%" CellPadding="5" ShowFooter="true" DataKeyNames="ProductId" OnRowDataBound="gvShoppingCart_RowDataBound" OnRowCommand="gvShoppingCart_RowCommand">
                <HeaderStyle HorizontalAlign="Left" BackColor="#2c3f52" ForeColor="#FFFFFF" Height="20px"/>
                <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />
                <AlternatingRowStyle BackColor="#F8F8F8" />
                <Columns>
 
                    <asp:BoundField DataField="des" HeaderText="Name" />

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox CssClass="quantity" runat="server" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox><br />
                            <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ProductId")%>' style="font-size:12px; text-decoration:none;color:#ed4e6e; font-size:18px;"></asp:LinkButton>
 
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="price" HeaderText="Price" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"  />
                </Columns>
            </asp:GridView>
 
            <br />
            <asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" CssClass="updateButton" OnClientClick="btnUpdateCart.Click"/>


           <a id="checkout" runat="server" href="../Account/CheckOut.aspx?Totalprice=<%#getTotal()%>" style=" border:1px solid #ff6a00;
            border-radius:4px;
            color:#000000;
           text-align:center;
            padding-top:5px;
            padding-bottom:-2px;
            background-color:transparent;
            text-decoration:none;
            height:30px;
            width:100px;float:right;" >Check out </a>
			
		</div>
    <h1 style="text-align:center;">Free Delivery with over R1000 Purchase :-). Cause we Happy...</h1>
</asp:Content>
