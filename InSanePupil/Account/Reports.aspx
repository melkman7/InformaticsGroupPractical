<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/main.Master" CodeBehind="Reports.aspx.vb" Inherits="InSanePupil.Reports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="report-Container">

        <h1>Product Report</h1>

        <asp:ScriptManager ID="ScriptManager1" runat="server">

        </asp:ScriptManager>

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="100%" Width="100%" SizeToReportContent="True">

        </rsweb:ReportViewer>

        <h1>Products on hand</h1>

        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Height="700px" Width="700px" BorderlineColor="Black" BorderlineDashStyle="Solid">
            <Series>
                <asp:Series Name="Series1" ChartType="Bar" XValueMember="Name" YValueMembers="quantity" YValuesPerPoint="4"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>



        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MydatabaseConnectionString1 %>" SelectCommand="SELECT [Name], [quantity] FROM [Games]"></asp:SqlDataSource>



    </div>

</asp:Content>
