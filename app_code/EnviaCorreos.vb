Imports SendGrid
Imports SendGrid.Helpers.Mail
Imports System
Imports System.Threading.Tasks

Public Class EnviaCorreos
    Public Shared Sub Main()
        Execute().Wait()
    End Sub

    Public Shared Async Function Execute() As Task
        Dim apiKey = "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"
        Dim client = New SendGridClient(apiKey)
        Dim from = New EmailAddress("isaacgomezr06@gmail.com", "Example User")
        Dim subject = "Sending with SendGrid is Fun"
        Dim [to] = New EmailAddress("isaacgomezr06@gmail.com", "Example User")
        Dim plainTextContent = "and easy to do anywhere, even with C#"
        Dim htmlContent = "<strong>and easy to do anywhere, even with C#</strong>"
        Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)
        Dim response = Await client.SendEmailAsync(msg)
    End Function
End Class

