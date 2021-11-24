
Partial Class del_antecedente_patologico
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id_antecedente_patologico = Request.QueryString("ant_pat")
        txt_antecedente.Text = db.select1registro("antecedente_patologico", "antecedentes_patologicos", "id_antecedente_patologico = '" & id_antecedente_patologico & "'")
    End Sub

    Protected Sub eliminar_Click(sender As Object, e As EventArgs) Handles eliminar.Click
        Dim id_antecedente_patologico = Request.QueryString("ant_pat")
        db.selectCustom("delete from antecedentes_patologicos where id_antecedente_patologico = '" & id_antecedente_patologico & "'", "id_antecedente_patologico")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub
End Class
