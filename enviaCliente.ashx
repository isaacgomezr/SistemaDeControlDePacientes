<%@ WebHandler Language="VB" Class="enviaCliente" %>

Imports System.Net
Imports System.Web
Imports System.Collections.Specialized
Imports System.IO
Imports System.Text
Imports SendGrid
Imports SendGrid.Helpers.Mail
Imports System
Imports System.Threading.Tasks

Public Class enviaCliente : Implements IHttpHandler
    
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12
        'context.Response.Write(context.Response.StatusCode = "200")
        Select Case context.Request.HttpMethod
            Case "POST"

                Dim apikey = "TGQAedwlr5Q-u6MxLxzvHTSylZClutxr91bKcNQYiZ"
                Dim message = "ESTIMADO BENEFICIARIO, SE LE INFORMA QUE EL PRÓXIMO LUNES 21 DE DICIEMBRE DEL 2020 SE EFECTUARÁ UNA VISITA POR PARTE DEL PROGRAMA DE CRÉDITOS A LA PALABRA (CREDITO AMLO). SE LE SOLICITA A LA C. MONICA B. RIVERA. G. ENCONTRARSE EN EL DOMICILIO A LAS 10:00 A.M. (HORA DE MEXICO)."
                Dim numbers = "526623377539"
                Dim strGet As String
                Dim senderName = "MORENA-AMLO"
                Dim url As String = "https://api.txtlocal.com/send/?"
 
                strGet = url + "apikey=" + apikey _
                + "&numbers=" + numbers _
                + "&message=" + WebUtility.UrlEncode(message) _
                + "&sender=" + senderName
 
                Dim webClient As New System.Net.WebClient
                Dim result As String = webClient.DownloadString(strGet)
                context.Response.Write(result)
                
                
                'Dim envia = New EnviaCorreos
                'envia.Main()
                'context.Response.Write(envia)
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




End Class