
Partial Class consulta
    Inherits System.Web.UI.Page

    Protected Sub radio_consulta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radio_consulta.SelectedIndexChanged
        Dim index_value = radio_consulta.SelectedValue
        Select Case index_value
            Case "1"
                panel_seguimiento.Visible = False
                panel_consulta.Visible = True
            Case "2"
                panel_seguimiento.Visible = True
                panel_consulta.Visible = False
            Case "3"
                panel_seguimiento.Visible = False
                panel_consulta.Visible = True
            Case "4"
                panel_seguimiento.Visible = False
                panel_consulta.Visible = True
        End Select
    End Sub

    Protected Sub crear_Click(sender As Object, e As EventArgs) Handles crear.Click
        Dim id_paciente = Request.QueryString("p")
        db.selectCustom("insert into consultas values ('" & id_paciente & "','" & fecha.Text & "','" & hora.Text & "','" & radio_consulta.SelectedValue & "','" & motivo.Text & "','" & evolucion.Text & "','" & factores.Text & "','" & descripcion.Text & "','" & eva.SelectedValue & "','" & frecuencia.Text & "','" & actividad.Text & "','" & exploracion.Text & "','" & impresion.Text & "','" & plan.Text & "','" & observaciones.Text & "','" & subjetivos.Text & "','" & objetivos.Text & "','" & intervencion.Text & "','" & notas.Text & "',1)", "")
        Response.Redirect("consultas.aspx?p=" & id_paciente & "")
    End Sub
End Class
