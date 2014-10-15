Public Class cart
    Inherits System.Web.UI.Page
    Private total As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            BindData()
        End If
        If Session("User") Is Nothing Then
            checkout.Visible = False
            btnUpdateCart.Visible = False
        End If

    End Sub

    Protected Sub BindData()
        gvShoppingCart.DataSource = ShoppingCart.Instance.Items
        gvShoppingCart.DataBind()
    End Sub

    Protected Sub gvShoppingCart_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles gvShoppingCart.RowDataBound
        ' If we are binding the footer row, let's add in our total
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: R" & ShoppingCart.Instance.GetSubTotal().ToString()
        End If
    End Sub

    ' This is the method that responds to the Remove button's click event
    Protected Sub gvShoppingCart_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) Handles gvShoppingCart.RowCommand
        If e.CommandName = "Remove" Then
            Dim productId = Convert.ToInt32(e.CommandArgument)
            ShoppingCart.Instance.RemoveItem(productId)
        End If

        ' We now have to re-setup the data so that the GridView doesn't keep displaying the old data
        BindData()
    End Sub

    Protected Sub btnUpdateCart_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnUpdateCart.Click
        For Each row As GridViewRow In gvShoppingCart.Rows
            If row.RowType = DataControlRowType.DataRow Then
                ' We'll use a try catch block in case something other than a number is typed in. If so, we'll just ignore it.
                Try
                    ' Get the productId from the GridView's datakeys
                    Dim productId = Convert.ToInt32(gvShoppingCart.DataKeys(row.RowIndex).Value)
                    ' Find the quantity TextBox and retrieve the value
                    Dim quantity = Integer.Parse(CType(row.Cells(1).FindControl("txtQuantity"), TextBox).Text)
                    ShoppingCart.Instance.SetItemQuantity(productId, quantity)
                Catch ex As FormatException
                End Try
            End If
        Next

        BindData()
    End Sub
End Class