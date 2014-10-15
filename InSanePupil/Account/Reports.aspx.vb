Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Web.UI.DataVisualization.Charting

Public Class Reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ReportViewer1.ProcessingMode = ProcessingMode.Local
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Account/Report.rdlc")
            Dim dsProducts As Products = GetData("select * from games")
            Dim datasource As New ReportDataSource("Products", dsProducts.Tables(0))
            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
        End If
    End Sub


    Private Function GetData(query As String) As Products
        Dim conString As String = ConfigurationManager.ConnectionStrings("MydatabaseConnectionString1").ConnectionString
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(conString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con

                sda.SelectCommand = cmd
                Using dsProducts As New Products()
                    sda.Fill(dsProducts, "DataTable1")
                    Return dsProducts
                End Using
            End Using
        End Using
    End Function


End Class