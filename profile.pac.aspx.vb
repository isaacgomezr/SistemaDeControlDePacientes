
Partial Class profile_pac
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id = Request.QueryString("p")
        Dim id_antecedente = db.select1registro("id_antecedente", "antecedentes", "id_paciente = '" & Request.QueryString("p") & "'")
        id_paciente.Text = db.select1registro("id_paciente", "pacientes", "id_paciente = '" & id & "'")
        nombre.Text = db.select1registro("nombre", "pacientes", "id_paciente = '" & id & "'") + " " + db.select1registro("apellido", "pacientes", "id_paciente = '" & id & "'")
        'fecha.Text = db.selectCustom("select CAST(DATEDIFF(DD,fecha_nacimiento,GETDATE()) /365.25 AS INT) AS [EDAD] from pacientes where id_paciente = '" & id & "'", "EDAD")
        Dim fechaini = db.select1registro("fecha_nacimiento", "pacientes", "id_paciente = '" & id & "'")
        fecha.Text = Format(CDate(fechaini), "dd/MM/yyyy") + " (" + db.selectCustom("DECLARE @givenDate datetime DECLARE @tempDate datetime DECLARE @years int, @months int, @days int SELECT @givenDate = '" & fechaini & "' SELECT @tempDate = @givenDate SELECT @years = DATEDIFF(yy, @tempDate, GETDATE()) - CASE WHEN (MONTH(@givenDate) > MONTH(GETDATE())) OR (MONTH(@givenDate) = MONTH(GETDATE()) AND DAY(@givenDate) > DAY(GETDATE())) THEN 1 ELSE 0 End SELECT @tempDate = DATEADD(yy, @years, @tempDate) SELECT @months = DATEDIFF(m, @tempDate, GETDATE()) - CASE WHEN DAY(@givenDate) > DAY(GETDATE()) THEN 1 ELSE 0 End SELECT @tempDate = DATEADD(m, @months, @tempDate) SELECT @days = DATEDIFF(d, @tempDate, GETDATE()) SELECT CAST(@years as varchar(5)) + ' años, ' + CAST(@months as varchar(3)) + ' meses, ' + CAST(@days as varchar(3)) + ' días'  as edad", "edad") + ")"
        plan_medico.Text = db.select1registro("plan_medico", "pacientes", "id_paciente = '" & id & "'")
        estado_civil.Text = db.select1registro("estado_civil", "pacientes", "id_paciente = '" & id & "'")
        ocupacion.Text = db.select1registro("ocupacion", "pacientes", "id_paciente = '" & id & "'")
        telefono.Text = db.select1registro("telefono", "pacientes", "id_paciente = '" & id & "'")
        correo.Text = db.select1registro("correo", "pacientes", "id_paciente = '" & id & "'")
        numero_afiliado.Text = db.select1registro("numero_afiliado", "pacientes", "id_paciente = '" & id & "'")
        nombre_contacto.Text = db.select1registro("nombre_contacto", "pacientes", "id_paciente = '" & id & "'")
        telefono_contacto.Text = db.select1registro("telefono_contacto", "pacientes", "id_paciente = '" & id & "'")
        parentesco_contacto.Text = db.select1registro("parentesco_contacto", "pacientes", "id_paciente = '" & id & "'")

        antecedentes_patologicos.Text = db.select1registro("antecedente_patologico", "antecedentes_patologicos", "id_antecedente = '" & id_antecedente & "'")
        alergias.Text = db.select1registro("alergeno_alergia", "alergias", "id_antecedente = '" & id_antecedente & "'")
        consultasDb.SelectCommand = "select id, id_paciente, fecha,hora, CASE When tipo_consulta = '1' Then 'CONSULTA' When tipo_consulta = '2' Then 'SEGUIMIENTO' When tipo_consulta = '3' Then 'MASAJE' When tipo_consulta = '4' Then 'DERMATOFUNCIONAL' END AS tipo,motivo_consulta, evolucion, factores, descripcion_dolor, escala_eva, frecuencia_dolor, actividad_dolor, exploracion_fisica,impresion_diagnostica, plan_tratamiento, observaciones, datos_subjetivos, datos_objetivos, intervencion, notas from consultas where id_paciente = '" & Request.QueryString("p") & "'"
    End Sub

    Protected Sub editar_paciente_Click(sender As Object, e As EventArgs) Handles editar_paciente.Click
        Dim id = Request.QueryString("p")
        Response.Redirect("act_pac.aspx?p=" & id & "")
    End Sub

    Protected Sub antecedentes_Click(sender As Object, e As EventArgs) Handles antecedentes.Click
        Dim id_antecedente = db.select1registro("id_antecedente", "antecedentes", "id_paciente = '" & Request.QueryString("p") & "'")
        Response.Redirect("ant_pac.aspx?a=" & id_antecedente & "")
    End Sub
End Class
