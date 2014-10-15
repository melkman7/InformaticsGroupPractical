Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Public Class ShippingAddress
    Inherits System.Web.UI.Page


    Dim connectionString = ConfigurationManager.ConnectionStrings("MydatabaseConnectionString1").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub addressButton_Click(sender As Object, e As EventArgs) Handles addressButton.Click

        addAddress()
        addUserAddress()


    End Sub



    Private Sub addAddress()
        Dim commandString As String = "INSERT INTO [Address] (StreetNo, StreetName, Suburb, City, PostalCode) " _
                                      & "VALUES (@StreetNo, @StreetName, @Suburb, @City, @PostalCode);"
        Using connection As New SqlConnection(connectionString)
            Dim command = New SqlCommand(commandString, connection)

            command.Parameters.AddWithValue("@StreetNo", CInt(no.Text))
            command.Parameters.AddWithValue("@StreetName", name.Text)
            command.Parameters.AddWithValue("@Suburb", suburb.Text)
            command.Parameters.AddWithValue("@City", city.Text)
            command.Parameters.AddWithValue("@PostalCode", CInt(postcode.Text))


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



    Private Sub addUserAddress()
        Dim commandString As String = "INSERT INTO [Shipping] (_Username, AddressID) " _
                                      & "VALUES (@_Username, @AddressID);"
        Using connection As New SqlConnection(connectionString)
            Dim command = New SqlCommand(commandString, connection)

            'command.Parameters.AddWithValue("@_Username", )    'get user ID from session
            'command.Parameters.AddWithValue("@AddressID", )    'get address ID from db

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