<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="ShippingAddress.aspx.vb" Inherits="InSanePupil.ShippingAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <div id="register">

        <div class="container">
               
            <h1>Shipping Address</h1><hr />

            <div id="registration-form">

                <p>
                    <label for="no" class="w_225">Street No<span>&nbsp;*</span></label>
                    <asp:TextBox ID="no" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Street No is required" ControlToValidate="no" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>

                 <p>
                    <label for="name" class="w_225">Street Name<span>&nbsp;*</span></label>               
                     <asp:TextBox ID="name" CssClass="tb10" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Street Name is required" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <label for="suburb" class="w_225">Suburb<span>&nbsp;*</span></label>
                    <asp:TextBox ID="suburb" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Suburb is required" ControlToValidate="suburb" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <label for="city" class="w_225">City<span>&nbsp;*</span></label>
                    <asp:TextBox ID="city" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City is required" ControlToValidate="city" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>

                <p>
                    <label for="postcode" class="w_225">Postal Code<span>&nbsp;*</span></label>
                    <asp:TextBox ID="postcode" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Postal Code is required" ControlToValidate="postcode" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>


                <p class="button">
                    <asp:Button ID="addressButton" class="pure-button pure-button-primary" runat="server" Text="Add Shipping Address" />
                </p>


            </div> <!-- end of form -->

        </div> <!-- end of container -->

    </div> <!-- end of register -->




</asp:Content>
