<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailForm.ascx.cs" Inherits="Koiak.StandardSite.usercontrols.EmailForm" %>
<form runat="server">
<fieldset>
<asp:PlaceHolder ID="m_placeHolder1" runat="server">
<div class="formRow">
    <asp:Label ID="m_label1" runat="server" AssociatedControlID="m_textArea1">Label:</asp:Label>
    <asp:TextBox ID="m_textArea1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="m_validator1" runat="server" ControlToValidate="m_textArea1"
        EnableClientScript="false" Display="Dynamic" ErrorMessage="Something is required." />
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="m_placeHolder2" runat="server">
<div class="formRow">
    <asp:Label ID="m_label2" runat="server" AssociatedControlID="m_textArea2">Label:</asp:Label>
    <asp:TextBox ID="m_textArea2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="m_validator2" runat="server" ControlToValidate="m_textArea2"
        EnableClientScript="false" Display="Dynamic" ErrorMessage="Something is required." />
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="m_placeHolder3" runat="server">
<div class="formRow">
    <asp:Label ID="m_label3" runat="server" AssociatedControlID="m_textArea3">Label:</asp:Label>
    <asp:TextBox ID="m_textArea3" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="m_validator3" runat="server" ControlToValidate="m_textArea3"
        EnableClientScript="false" Display="Dynamic" ErrorMessage="Something is required." />
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="m_placeHolder4" runat="server">
<div class="formRow">
    <asp:Label ID="m_label4" runat="server" AssociatedControlID="m_textArea4">Label:</asp:Label>
    <asp:TextBox ID="m_textArea4" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="m_validator4" runat="server" ControlToValidate="m_textArea4"
        EnableClientScript="false" Display="Dynamic" ErrorMessage="Something is required." />
</div>
</asp:PlaceHolder>
<asp:PlaceHolder ID="m_placeHolder5" runat="server">
<div class="formRow">
    <asp:Label ID="m_label5" runat="server" AssociatedControlID="m_textArea5">Label:</asp:Label>
    <asp:TextBox ID="m_textArea5" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="m_validator5" runat="server" ControlToValidate="m_textArea5"
        EnableClientScript="false" Display="Dynamic" ErrorMessage="Something is required." />
</div>
</asp:PlaceHolder>
<div class="buttonRow">
    <asp:Button ID="m_submitButton" runat="server" CommandName="Login" Text="Log In" />
</div>
</fieldset>
</form>
