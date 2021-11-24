
Partial Class del_pac
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id = Request.QueryString("p")
        txt_nombre.Text = db.select1registro("nombre", "pacientes", "id_paciente = '" & id & "'")
    End Sub

    Protected Sub eliminar_Click(sender As Object, e As EventArgs) Handles eliminar.Click
        Dim id = Request.QueryString("p")
        db.selectCustom("delete from pacientes where id_paciente = '" & id & "'", "id_paciente")
        Response.Redirect("inicio.aspx")
    End Sub
End Class
