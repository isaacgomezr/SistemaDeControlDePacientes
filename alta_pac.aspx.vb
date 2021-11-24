
Partial Class alta_pac
    Inherits System.Web.UI.Page



    Protected Sub registrar_Click(sender As Object, e As EventArgs) Handles registrar.Click
        Try
            Dim enviocorrecto = db.selectCustom("insert into pacientes (nombre, apellido, fecha_creacion, fecha_nacimiento, estado_civil, ocupacion, telefono, correo, plan_medico, numero_afiliado, nombre_contacto, telefono_contacto,parentesco_contacto) values('" & txt_nombre.Text & "','" & txt_apellidos.Text & "', '" & Date.Now.ToString("yyyy-MM-dd") & "', '" & txt_fecha.Text & "', '" & estado_civil.SelectedValue & "', '" & txt_ocupacion.Text & "','" & txt_telefono.Text & "','" & txt_correo.Text & "','" & txt_plan.Text & "','" & txt_no_afiliado.Text & "','" & txt_nombre_contacto.Text & "','" & txt_telefono_contacto.Text & "','" & txt_parentesco.Text & "')", "id_paciente")
            Dim id_paciente = db.selectCustom("select top 1 id_paciente from pacientes order by id_paciente desc", "id_paciente")
            Dim alta_ant = db.selectCustom("insert into antecedentes (id_paciente, actividad_fisica,alimentacion,sueño,tabaco,alcohol,drogas, alergias, antecedentes_pato, alteracion_neurocon, alteracion_neurologica, antecedentes_fam, lesiones) values ('" & id_paciente & "','0','0','0','0','0','0','0','0','0','0','0','0')", "id_antecedente")
            Response.Redirect("inicio.aspx")
        Catch ex As Exception

        End Try

    End Sub
End Class
