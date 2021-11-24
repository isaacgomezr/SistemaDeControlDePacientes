
Partial Class consultas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        consultasDb.SelectCommand = "select id, id_paciente, fecha,hora, CASE When tipo_consulta = '1' Then 'CONSULTA' When tipo_consulta = '2' Then 'SEGUIMIENTO' When tipo_consulta = '3' Then 'MASAJE' When tipo_consulta = '4' Then 'DERMATOFUNCIONAL' END AS tipo,motivo_consulta, evolucion, factores, descripcion_dolor, escala_eva, frecuencia_dolor, actividad_dolor, exploracion_fisica,impresion_diagnostica, plan_tratamiento, observaciones, datos_subjetivos, datos_objetivos, intervencion, notas from consultas where id_paciente = '" & Request.QueryString("p") & "'"
    End Sub

    Protected Sub nueva_consulta_Click(sender As Object, e As EventArgs) Handles nueva_consulta.Click
        Response.Redirect("consulta.aspx?p=" & Request.QueryString("p") & "")
    End Sub

    Protected Sub buscar_consultas_Click(sender As Object, e As EventArgs) Handles buscar_consultas.Click
        consultasDb.SelectCommand = "select id, id_paciente, fecha,hora, CASE When tipo_consulta = '1' Then 'CONSULTA' When tipo_consulta = '2' Then 'SEGUIMIENTO' When tipo_consulta = '3' Then 'MASAJE' When tipo_consulta = '4' Then 'DERMATOFUNCIONAL' END AS tipo,motivo_consulta, evolucion, factores, descripcion_dolor, escala_eva, frecuencia_dolor, actividad_dolor, exploracion_fisica,impresion_diagnostica, plan_tratamiento, observaciones, datos_subjetivos, datos_objetivos, intervencion, notas from consultas where motivo_consulta like '" & txt_consulta.Text & "%' and id_paciente ='" & Request.QueryString("p") & "'"

    End Sub
End Class
