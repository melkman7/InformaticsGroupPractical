Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Configuration
Public Class main

    Inherits System.Web.UI.MasterPage
    Private connectionString As String = WebConfigurationManager.ConnectionStrings("MydatabaseConnectionString1").ConnectionString
    Private dbConnection As SqlConnection
    Private dbCommand As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("User") <> "") Then
            login_link.InnerText = Session("User").ToString
            logonFields.Visible = False
            logof.Visible = True
        Else
            logonFields.Visible = True
            logof.Visible = False
        End If

    End Sub
  

    Protected Sub loginButton_Click(sender As Object, e As EventArgs) Handles loginButton.Click
        Dim user As String = UserName.Text
        Dim pass As String = Password.Text

        dbConnection = New SqlConnection(connectionString)
        dbCommand = New SqlCommand("SELECT * FROM Users Where _Username=@user", dbConnection)
        dbCommand.Parameters.AddWithValue("@user", user)

        dbConnection.Open()
        dbCommand.ExecuteNonQuery()

        Dim DbReader As SqlDataReader = dbCommand.ExecuteReader(CommandBehavior.CloseConnection)

        If DbReader.HasRows Then
            Do While DbReader.Read
                If (user = DbReader("_Username") And Secrecy.HashPassword(pass) = DbReader("_Password")) Then
                    Session("User") = user
                    If (Session("User") <> "") Then
                        login_link.InnerText = Session("User").ToString
                        logonFields.Visible = False
                        logof.Visible = True
                    Else
                        logonFields.Visible = True
                        logof.Visible = False
                    End If
                Else
                    'add a pop up message
                    MsgBox("not Found")
                End If
            Loop
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Session.Remove("User")
        If (Session("User") <> "") Then
            login_link.InnerText = Session("User").ToString
            logonFields.Visible = False
            logof.Visible = True
        Else
            logonFields.Visible = True
            logof.Visible = False
            login_link.InnerText = "Sign In"
        End If
    End Sub
End Class