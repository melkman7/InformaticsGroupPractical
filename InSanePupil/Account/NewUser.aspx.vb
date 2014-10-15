Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports InSanePupil.Secrecy

Public Class NewUser
    Inherits System.Web.UI.Page

    Dim connectionString = ConfigurationManager.ConnectionStrings("MydatabaseConnectionString1").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub registerButton_Click(sender As Object, e As EventArgs) Handles registerButton.Click
        Dim cmdString As String = "SELECT COUNT(*) FROM [Users] WHERE _Username = @Username"
        Using con As New SqlConnection(connectionString)
            Dim cmd = New SqlCommand(cmdString, con)

            cmd.Parameters.AddWithValue("@Username", username.Text)

            cmd.Connection.Open()
            Dim rowCount As Integer = Convert.ToInt32(cmd.ExecuteScalar())


            If rowCount <> 0 Then
                errUsername.InnerHtml = "Username already exists"
                Exit Sub

            Else
                addUser()

            End If


        End Using

    End Sub


    Private Sub addUser()
        Dim commandString As String = "INSERT INTO [Users] (_Username, _Password, _Email, _FirstName, _Surname, _Telno) " _
                                      & "VALUES (@Username, @Password, @Email, @FirstName, @Surname, @Telno);"
        Using connection As New SqlConnection(connectionString)
            Dim command = New SqlCommand(commandString, connection)

            command.Parameters.AddWithValue("@Username", username.Text)
            command.Parameters.AddWithValue("@Password", HashPassword(password.Text))
            command.Parameters.AddWithValue("@Email", email.Text)
            command.Parameters.AddWithValue("@FirstName", firstName.Text)
            command.Parameters.AddWithValue("@Surname", surname.Text)
            command.Parameters.AddWithValue("@Telno", telno.Text)

            Try
                command.Connection.Open()
                command.ExecuteNonQuery()

            Catch ex As Exception
                Console.WriteLine(ex.Message)

            Finally
                command.Connection.Close()

            End Try

        End Using
    End Sub


End Class