Public Class AddTocart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'check if the user is logged on first;

        Dim price As String = CDbl(Request.QueryString("Price").ToString)
        Dim id As String = CInt(Request.QueryString("ProductId").ToString)
        Dim name As String = Request.QueryString("Name").ToString
        ShoppingCart.Instance.AddItem(id, price, name)
        Response.Redirect("../cart/cart.aspx")
    End Sub

End Class