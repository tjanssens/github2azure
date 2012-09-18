<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Koiak.StandardSite.usercontrols.Login" %>
<form runat="server">
<asp:Login ID="m_login" runat="server" >
    <LayoutTemplate>
        <div class="formRow">
            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" EnableClientScript="false" Display="Dynamic"
                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl00$m_login" />
        </div>
        <div class="formRow">
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
          
            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" EnableClientScript="false" Display="Dynamic"
                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl00$m_login" />
             </div>
        <div class="checkBoxRow">
            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
    </div>
            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                 
        <div class="buttonRow">
            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="ctl00$m_login" />
        </div>
    </LayoutTemplate>
</asp:Login>
</form>
