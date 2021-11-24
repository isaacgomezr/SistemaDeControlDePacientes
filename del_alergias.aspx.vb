
Partial Class del_alergias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id_alergia = Request.QueryString("aler")
        txt_alergia.Text = db.select1registro("alergeno_alergia", "alergias", "id_alergias = '" & id_alergia & "'")
    End Sub

    Protected Sub eliminar_Click(sender As Object, e As EventArgs) Handles eliminar.Click
        Dim id_alergia = Request.QueryString("aler")
        db.selectCustom("delete from alergias where id_alergias = '" & id_alergia & "'", "id_alergias")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub
End Class
