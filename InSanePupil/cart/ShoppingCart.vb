
Imports System.Collections.Generic
Imports System.Web

'*
' * The ShoppingCart class
' * 
' * Holds the items that are in the cart and provides methods for their manipulation
' 

Public Class ShoppingCart

    Public Property Items() As List(Of CartItem)
        Get
            Return m_Items
        End Get
        Private Set(value As List(Of CartItem))
            m_Items = Value
        End Set
    End Property
    Private m_Items As List(Of CartItem)
    Private price As Double
    Private des As String


    ' Readonly properties can only be set in initialization or in a constructor
    Public Shared ReadOnly Instance As ShoppingCart

    ' The static constructor is called as soon as the class is loaded into memory
    Shared Sub New()
        ' If the cart is not in the session, create one and put it there
        ' Otherwise, get it from the session
        If HttpContext.Current.Session("ASPNETShoppingCart") Is Nothing Then
            Instance = New ShoppingCart()
            Instance.Items = New List(Of CartItem)()
            HttpContext.Current.Session("ASPNETShoppingCart") = Instance
        Else
            Instance = DirectCast(HttpContext.Current.Session("ASPNETShoppingCart"), ShoppingCart)
        End If
    End Sub

    ' A protected constructor ensures that an object can't be created from outside
    Protected Sub New()
    End Sub


#Region "Item Modification Methods"
    '*
    '     * AddItem() - Adds an item to the shopping 
    '     

    Public Sub AddItem(productId As Integer, price As Double, des As String)
        Me.price = price
        Me.des = des
        ' Create a new item to add to the cart
        Dim newItem As New CartItem(productId, price, des)

        ' If this item already exists in our list of items, increase the quantity
        ' Otherwise, add the new item to the list
        If Items.Contains(newItem) Then
            For Each item As CartItem In Items
                If item.Equals(newItem) Then
                    item.Quantity += 1
                    Return
                End If
            Next
        Else
            newItem.Quantity = 1
            Items.Add(newItem)
        End If
    End Sub

    '*
    '     * SetItemQuantity() - Changes the quantity of an item in the cart
    '     

    Public Sub SetItemQuantity(productId As Integer, quantity As Integer)
        ' If we are setting the quantity to 0, remove the item entirely
        If quantity = 0 Then
            RemoveItem(productId)
            Return
        End If

        ' Find the item and update the quantity
        Dim updatedItem As New CartItem(productId)

        For Each item As CartItem In Items
            If item.Equals(updatedItem) Then
                item.Quantity = quantity
                Return
            End If
        Next
    End Sub

    '*
    '     * RemoveItem() - Removes an item from the shopping cart
    '     

    Public Sub RemoveItem(productId As Integer)
        Dim removedItem As New CartItem(productId)
        Items.Remove(removedItem)
    End Sub
#End Region

#Region "Reporting Methods"
    '*
    '     * GetSubTotal() - returns the total price of all of the items
    '     *                 before tax, shipping, etc.
    '     

    Public Function GetSubTotal() As Decimal
        Dim subTotal As Decimal = 0
        For Each item As CartItem In Items
            subTotal += item.TotalPrice
        Next

        Return subTotal
    End Function
#End Region
End Class