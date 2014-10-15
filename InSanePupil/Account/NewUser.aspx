<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="NewUser.aspx.vb" Inherits="InSanePupil.NewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div id="register">

        <div class="container">
               
            <h1>Register</h1><hr />

            <div id="registration-form">

                <p>
                    <label for="email" class="w_225">Email<span>&nbsp;*</span></label>
                    <asp:TextBox ID="email" CssClass="tb10" placeholder="example@domain.com" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="No email address specified" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Invalid email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <label id="errEmail"></label>
                </p>

                 <p>
                    <label for="email2" class="w_225">Retype Email<span>&nbsp;*</span></label>               
                     <asp:TextBox ID="email2" CssClass="tb10" runat="server"></asp:TextBox>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Email addresses don't match" ControlToCompare="email" ControlToValidate="email2" ForeColor="Red"></asp:CompareValidator>
                    <label id="errEmail2"></label>
                </p>

                <p>
                    <label for="password" class="w_225">Password<span>&nbsp;*</span></label>
                    <asp:TextBox ID="password" CssClass="tb10" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="password" ErrorMessage="Password must be at least 5 characters" ForeColor="Red" ValidationExpression=".{5,}"></asp:RegularExpressionValidator>
                    <label id="errPassword"></label>
                </p>

                <p>
                    <label for="password2" class="w_225">Retype Password<span>&nbsp;*</span></label>
                    <asp:TextBox ID="password2" CssClass="tb10" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="password" ControlToValidate="password2" ForeColor="Red"></asp:CompareValidator>
                    <label id="errPassword2"></label>
                </p>

                <p>
                    <label for="username" class="w_225">Username<span>&nbsp;*</span></label>
                    <asp:TextBox ID="username" CssClass="tb10" runat="server"></asp:TextBox>
                    <label id="errUsername" runat="server"></label>
                </p>

                <p>
                    <label for="firstName" class="w_225">First Name<span>&nbsp;*</span></label>
                    <asp:TextBox ID="firstName" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="No First Name Specified" ControlToValidate="firstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label id="errFirstName"></label>
                </p>

                <p>
                    <label for="surname" class="w_225">Last Name<span>&nbsp;*</span></label>
                    <asp:TextBox ID="surname" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="No Last Name Specified" ControlToValidate="surname" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label id="errSurname"></label>
                </p>

                <p>
                    <label for="telno" class="w_225">Mobile / Phone Number<span>&nbsp;*</span></label>
                    <asp:TextBox ID="telno" CssClass="tb10" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="No Mobile/Phone Number Specified" ControlToValidate="telno" ForeColor="Red"></asp:RequiredFieldValidator>
                    <label id="errTelno"></label>
                </p>

                <p class="button">
                    <asp:Button ID="registerButton" class="pure-button pure-button-primary" runat="server" Text="Register Now" />
                </p>
                <br />
                <p>
                    <label for="agree" class="label-long">By clicking on "Register Now" you agree to ZONE.com's <a href="#" target="_blank">Terms and Conditions</a></label>
                </p>


            </div> <!-- end of form -->

        </div> <!-- end of container -->

    </div> <!-- end of register -->


</asp:Content>
