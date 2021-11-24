<%@ WebHandler Language="VB" Class="recibeRespuesta" %>

Imports System
Imports System.Web
Imports System.Net
Imports System.IO
Imports System.Web.Script.Serialization

Public Class recibeRespuesta : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        'context.Response.Write(context.Response.StatusCode = "200")
        Select Case context.Request.HttpMethod
            Case "POST"

                Dim Objson As New datos_transaccion

                Dim json As String = New StreamReader(context.Request.InputStream).ReadToEnd()
                'Dim json As String = context.Request.Form("json")
                Dim jss As New JavaScriptSerializer()
                Objson = jss.Deserialize(Of datos_transaccion)(json)
                Dim transaccion = Objson.transaccion
                Dim statusRandom = New Random
  
                
                context.Response.Write(jss.Serialize(New With {Key .id_transaccion = RandomNumber(), Key .status = statusRandom.Next(1, 3).ToString(), Key .no_aprobacion = RandomNumber(), Key .fecha = Date.Now.ToString()}))
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
        'Dim api_version As String
        'Dim date_created As String
        'Dim id As String
        'Dim live_mode As String
        'Dim type As String
        'Dim user_id As String
       
    End Structure
    
    Public Function RandomNumber() As String
        Dim ramdom As Integer
        ramdom = Int(2 + Rnd() * (30000000 - 2 + 1))
        Return ramdom
    End Function

    
End Class