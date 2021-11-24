
Partial Class inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim mes = Date.Now.Month.ToString
        'pacientesDb.SelectCommand = "Select id_paciente, nombre, apellido, telefono, correo, case when month(fecha_nacimiento) = '" & mes & "' then 'color:pink'  else 'color:grey' end as cumple from pacientes order by nombre asc"
    End Sub

    Protected Sub buscar_pacientes_Click(sender As Object, e As EventArgs) Handles buscar_pacientes.Click
        Dim mes = Date.Now.Month.ToString
        pacientesDb.SelectCommand = "Select id_paciente, nombre, apellido, telefono, correo, case when month(fecha_nacimiento) = '" & mes & "' then 'color:pink'  else 'color:grey' end as cumple from pacientes where nombre like '" & txt_paciente.Text & "%' or apellido like '" & txt_paciente.Text & "%' or telefono like '" & txt_paciente.Text & "%' or correo like '" & txt_paciente.Text & "%' order by nombre asc"
    End Sub

    
End Class
