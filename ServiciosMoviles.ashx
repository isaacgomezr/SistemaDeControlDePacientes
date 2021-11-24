<%@ WebHandler Language="VB" Class="ServiciosMoviles" %>

Imports System
Imports System.Web
Imports System.IO
Imports System.Web.Script.Serialization
Imports Newtonsoft.Json

Public Class ServiciosMoviles : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Select Case context.Request.HttpMethod
            Case "POST"

                Dim Objson As New datos_transaccion

                'Dim json As String = New StreamReader(context.Request.InputStream).ReadToEnd()
                'Dim json As String = context.Request.Form("transaccion")
                'Dim jss As New JavaScriptSerializer()
                'Objson = jss.Deserialize(Of datos_transaccion)(json)
                'Dim transaccion = Objson.transaccion
                
                'context.Response.Write(jss.Serialize(New With {Key .transaccion = transaccion, Key .suggestions = {"transaccion"}, Key .data = {transaccion}}))
                'context.Response.Write(jss.Serialize(New With {Key .transaccion = transaccion}))
                
                
                context.Response.ContentType = "text/json"
                Dim body As System.IO.Stream = context.Request.InputStream
                Dim encoding As System.Text.Encoding = context.Request.ContentEncoding
                Dim reader As System.IO.StreamReader = New System.IO.StreamReader(body, encoding)
                Dim s As String = reader.ReadToEnd()
                Dim jss As New JavaScriptSerializer()
                Objson = jss.Deserialize(Of datos_transaccion)(s)
                Dim transaccion = Objson.transaccion
                
                If transaccion = "datos_terminal" Then
                    Dim datos_terminal As List(Of Dictionary(Of String, String)) = db.selectMultiRegistroCustom("select * from terminales where id_terminal = '" & Objson.terminal & "'")
                    context.Response.Write(jss.Serialize(New With {Key .transaccion = datos_terminal}))
                End If
                
                If transaccion = "datos_transaccion" Then
                    Dim datos_terminal As List(Of Dictionary(Of String, String))
                    Select Case Objson.filtro_transaccion
                        Case "folio"
                            datos_terminal = db.selectMultiRegistroCustom("select top 10 * from transacciones where id_transaccion = '" & Objson.id_transaccion & "'")
                        Case "cliente"
                            datos_terminal = db.selectMultiRegistroCustom("select top 10 * from transacciones where id_cliente = '" & Objson.cliente & "'")
                        Case "terminal"
                            datos_terminal = db.selectMultiRegistroCustom("select top 10 * from transacciones where terminal = '" & Objson.terminal & "'")
                    End Select
                    
                    context.Response.Write(jss.Serialize(New With {Key .transaccion = datos_terminal}))
                End If
                'context.Response.Write(jss.Serialize(New With {Key .transaccion = transaccion}))
               
                
        End Select
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

    <Serializable()>
    Public Structure datos_transaccion
        Dim transaccion As String
        Dim terminal As String
        Dim cliente As String
        Dim id_transaccion As String
        Dim filtro_transaccion As String
    End Structure
End Class