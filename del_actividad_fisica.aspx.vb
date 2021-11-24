
Partial Class del_actividad_fisica
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id_actividad = Request.QueryString("ac")
        txt_actividad.Text = db.select1registro("actividad", "actividad_fisica", "id_actividad = '" & id_actividad & "'")
    End Sub

    Protected Sub eliminar_Click(sender As Object, e As EventArgs) Handles eliminar.Click
        Dim id_actividad = Request.QueryString("ac")
        db.selectCustom("delete from actividad_fisica where id_actividad = '" & id_actividad & "'", "id_actividad")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub
End Class
