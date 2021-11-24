
Partial Class act_pac
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim id = Request.QueryString("p")
            Dim nombre = db.select1registro("nombre", "pacientes", "id_paciente= '" & id & "'")
            txt_nombre.Text = nombre
            Dim apellido = db.select1registro("apellido", "pacientes", "id_paciente= '" & id & "'")
            txt_apellidos.Text = apellido
            Dim fecha = db.select1registro("fecha_nacimiento", "pacientes", "id_paciente= '" & id & "'")
            txt_fecha.Text = fecha
            Dim estado = db.select1registro("estado_civil", "pacientes", "id_paciente= '" & id & "'")
            estado_civil.SelectedValue = estado
            Dim ocupacion = db.select1registro("ocupacion", "pacientes", "id_paciente= '" & id & "'")
            txt_ocupacion.Text = ocupacion
            Dim telefono = db.select1registro("telefono", "pacientes", "id_paciente= '" & id & "'")
            txt_telefono.Text = telefono
            Dim correo = db.select1registro("correo", "pacientes", "id_paciente= '" & id & "'")
            txt_correo.Text = correo
            Dim plan = db.select1registro("plan_medico", "pacientes", "id_paciente= '" & id & "'")
            txt_plan.Text = plan
            Dim numero_afiliado = db.select1registro("numero_afiliado", "pacientes", "id_paciente= '" & id & "'")
            txt_no_afiliado.Text = numero_afiliado
            Dim nombre_contacto = db.select1registro("nombre_contacto", "pacientes", "id_paciente= '" & id & "'")
            txt_nombre_contacto.Text = nombre_contacto
            Dim telefono_contacto = db.select1registro("telefono_contacto", "pacientes", "id_paciente= '" & id & "'")
            txt_telefono_contacto.Text = telefono_contacto
            Dim parentesco = db.select1registro("parentesco_contacto", "pacientes", "id_paciente= '" & id & "'")
            txt_parentesco.Text = parentesco
        End If
        
    End Sub

    Protected Sub actualizar_Click(sender As Object, e As EventArgs) Handles actualizar.Click

        Dim id = Request.QueryString("p")

        db.selectCustom("update pacientes set nombre = '" & txt_nombre.Text & "', apellido = '" & txt_apellidos.Text & "', fecha_nacimiento = '" & txt_fecha.Text & "', estado_civil = '" & estado_civil.SelectedValue & "', ocupacion = '" & txt_ocupacion.Text & "', telefono = '" & txt_telefono.Text & "', correo = '" & txt_correo.Text & "', plan_medico = '" & txt_plan.Text & "', numero_afiliado = '" & txt_no_afiliado.Text & "', nombre_contacto = '" & txt_nombre_contacto.Text & "', telefono_contacto = '" & txt_telefono_contacto.Text & "', parentesco_contacto = '" & txt_parentesco.Text & "' where id_paciente = '" & id & "'", "id_paciente")
        Response.Redirect("inicio.aspx")


    End Sub
End Class
