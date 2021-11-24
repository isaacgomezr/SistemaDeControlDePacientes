
Partial Class del_con
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id_consulta = Request.QueryString("con")
        txt_consulta.Text = db.select1registro("motivo_consulta", "consultas", "id = '" & id_consulta & "'")
    End Sub

    Protected Sub eliminar_Click(sender As Object, e As EventArgs) Handles eliminar.Click
        Dim id_consulta = Request.QueryString("con")
        db.selectCustom("delete from consultas where id = '" & id_consulta & "'", "id")
        Response.Redirect("consultas.aspx?p=" & Request.QueryString("p") & "")
    End Sub
End Class
