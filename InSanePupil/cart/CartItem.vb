

'*
' * The CartItem Class
' * 
' * Basically a structure for holding item data
' 

Public Class CartItem
    Implements IEquatable(Of CartItem)

    Sub New(productId As Integer)
        ' TODO: Complete member initialization 
        _productId = productId
    End Sub

    Public Overloads Function Equals(item As CartItem) As Boolean Implements IEquatable(Of CartItem).Equals

        Return item.ProductId = Me.ProductId
    End Function
    ' A place to store the quantity in the cart
    ' This property has an implicit getter and setter.
    Public Property Quantity() As Integer
        Get
            Return m_Quantity
        End Get
        Set(value As Integer)
            m_Quantity = value
        End Set
    End Property

    Private m_Quantity As Integer
    Public Property Price As Double
    Public Property Des As String
    Private _productId As Integer
    Public Property ProductId() As Integer
        Get
            Return _productId
        End Get
        Set(value As Integer)
            ' To ensure that the Prod object will be re-created
            _product = Nothing
            _productId = value
        End Set
    End Property

    Private _product As Product = Nothing
    Public ReadOnly Property Prod() As Product
        Get
            ' Lazy initialization - the object won't be created until it is needed
            If _product Is Nothing Then
                _product = New Product(ProductId, Price, Des)
            End If
            Return _product
        End Get
    End Property

    Public ReadOnly Property TotalPrice() As Decimal
        Get
            Return Price * Quantity
        End Get
    End Property

    Public Sub New(productId As Integer, price As Double, description As String)
        Me.ProductId = productId
        Me.Price = price
        Me.Des = description
    End Sub

End Class
