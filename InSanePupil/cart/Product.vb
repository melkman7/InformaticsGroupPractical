Imports Microsoft.VisualBasic

' The Product class
Public Class Product

#Region "Properties"

	Private _id As Integer
	Public Property Id() As Integer
		Get
			Return _id
		End Get
		Set(ByVal value As Integer)
			_id = value
		End Set
	End Property

	Private _price As Decimal
	Public Property Price() As Decimal
		Get
			Return _price
		End Get
		Set(ByVal value As Decimal)
			_price = value
		End Set
	End Property

	Private _description As String
	Public Property Description() As String
		Get
			Return _description
		End Get
		Set(ByVal value As String)
			_description = value
		End Set
	End Property

#End Region

    Public Sub New(ByVal id As Integer, ByVal price As Double, ByVal des As String)
        Me.Id = id
        Me.Price = price
        Me.Description = des
    End Sub


End Class
