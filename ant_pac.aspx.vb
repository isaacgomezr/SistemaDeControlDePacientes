
Partial Class ant_pac
    Inherits System.Web.UI.Page

    Protected Sub actividad_fisica_SelectedIndexChanged(sender As Object, e As EventArgs) Handles actividad_fisica.SelectedIndexChanged

        Dim actividadItem = actividad_fisica.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_actividad_fisica.Visible = True
                db.selectCustom("update antecedentes set actividad_fisica = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "actividad_fisica")
            Case "0"
                panel_actividad_fisica.Visible = False
                db.selectCustom("update antecedentes set actividad_fisica = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "actividad_fisica")
        End Select

    End Sub

   
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id_antecedente = Request.QueryString("a")

        If Not IsPostBack Then
            'ACTIVDAD FISICA
            Dim filtro_actividad_fisica = db.select1registro("actividad_fisica", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_actividad_fisica = 0 Then
                panel_actividad_fisica.Visible = False
                actividad_fisica.SelectedValue = "0"
            End If

            If filtro_actividad_fisica = 1 Then
                panel_actividad_fisica.Visible = True
                actividad_fisica.SelectedValue = "1"
            End If

            actividad_fisica_db.SelectCommand = "select * from actividad_fisica where id_antecedente = '" & id_antecedente & "'"

            'ALIMENTACION
            Dim filtro_alimentacion = db.select1registro("alimentacion", "antecedentes", "id_antecedente = '" & id_antecedente & "'")
            Dim exceso_calorias = db.select1registro("exceso_calorias", "alimentacion", "id_antecedente = '" & id_antecedente & "'")
            Dim exceso_azucar = db.select1registro("exceso_azucar", "alimentacion", "id_antecedente = '" & id_antecedente & "'")
            Dim exceso_sodio = db.select1registro("exceso_sodio", "alimentacion", "id_antecedente = '" & id_antecedente & "'")
            Dim notas = db.select1registro("notas", "alimentacion", "id_antecedente = '" & id_antecedente & "'")
            notas_alimentacion.Text = notas
            If exceso_calorias = 0 Then
                calorias_checkbox.Checked = False
            Else
                calorias_checkbox.Checked = True
            End If

            If exceso_azucar = 0 Then
                azucar_checkbox.Checked = False
            Else
                azucar_checkbox.Checked = True
            End If

            If exceso_sodio = 0 Then
                sodio_checkbox.Checked = False
            Else
                sodio_checkbox.Checked = True
            End If

            If filtro_alimentacion = 0 Then
                panel_alimentacion.Visible = False
                alimentacion_checkbox.SelectedValue = "0"

            End If

            If filtro_alimentacion = 1 Then
                panel_alimentacion.Visible = True
                alimentacion_checkbox.SelectedValue = "1"
            End If

            'SUEÑO
            Dim filtro_sueño = db.select1registro("sueño", "antecedentes", "id_antecedente = '" & id_antecedente & "'")
            tiempo_sueño.Text = db.select1registro("tiempo", "sueño", "id_antecedente = '" & id_antecedente & "'")
            frecuencia_sueño.Text = db.select1registro("frecuencia", "sueño", "id_antecedente = '" & id_antecedente & "'")
            notas_sueño.Text = db.select1registro("notas", "sueño", "id_antecedente = '" & id_antecedente & "'")
            If filtro_sueño = 0 Then
                panel_sueño.Visible = False
                sueño_checkbox.SelectedValue = "0"
            Else
                panel_sueño.Visible = True
                sueño_checkbox.SelectedValue = "1"
            End If

            'TABACO
            Dim filtro_tabaco = db.select1registro("tabaco", "antecedentes", "id_antecedente = '" & id_antecedente & "'")
            cigarros_si_tabaco.Text = db.select1registro("cigarros_si_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            years_si_tabaco.Text = db.select1registro("years_si_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            notas_si_tabaco.Text = db.select1registro("notas_si_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            tiempo_suspendido_tabaco.Text = db.select1registro("tiempo_suspendido_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            cigarros_suspendido_tabaco.Text = db.select1registro("cigarros_suspendido_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            years_suspendido_tabaco.Text = db.select1registro("years_suspendido_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")
            notas_suspendido_tabaco.Text = db.select1registro("notas_suspendido_tabaco", "tabaco", "id_antecedente = '" & id_antecedente & "'")

            Select Case filtro_tabaco
                Case 0
                    panel_si_tabaco.Visible = False
                    panel_suspendido_tabaco.Visible = False
                    tabaco_checkbox.SelectedValue = "0"
                Case 1
                    panel_si_tabaco.Visible = True
                    panel_suspendido_tabaco.Visible = False
                    tabaco_checkbox.SelectedValue = "1"
                Case 2
                    panel_si_tabaco.Visible = False
                    panel_suspendido_tabaco.Visible = True
                    tabaco_checkbox.SelectedValue = "2"
            End Select

            'ALCOHOL
            Dim filtro_alcohol = db.select1registro("alcohol", "antecedentes", "id_antecedente = '" & id_antecedente & "'")
            cantidad_si_alcohol.Text = db.select1registro("cantidad_si_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")
            frecuencia_si_alcohol.Text = db.select1registro("frecuencia_si_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")
            notas_si_alchol.Text = db.select1registro("notas_si_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")
            cantidad_suspendido_alcohol.Text = db.select1registro("cantidad_suspendido_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")
            frecuencia_suspendido_alcohol.Text = db.select1registro("frecuencia_suspendido_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")
            notas_suspendido_alcohol.Text = db.select1registro("notas_suspendido_alcohol", "alcohol", "id_antecedente = '" & id_antecedente & "'")

            Select Case filtro_alcohol
                Case 0
                    panel_si_alcohol.Visible = False
                    panel_suspendido_alcohol.Visible = False
                    alcohol_checkbox.SelectedValue = "0"
                Case 1
                    panel_si_alcohol.Visible = True
                    panel_suspendido_alcohol.Visible = False
                    alcohol_checkbox.SelectedValue = "1"
                Case 2
                    panel_si_alcohol.Visible = False
                    panel_suspendido_alcohol.Visible = True
                    alcohol_checkbox.SelectedValue = "2"
            End Select

            'DROGAS
            Dim filtro_drogas = db.select1registro("drogas", "antecedentes", "id_antecedente = '" & id_antecedente & "'")
            cantidad_si_drogas.Text = db.select1registro("cantidad_si_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")
            frecuencia_si_drogas.Text = db.select1registro("frecuencia_si_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")
            notas_si_drogas.Text = db.select1registro("notas_si_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")
            cantidad_suspendido_drogas.Text = db.select1registro("cantidad_suspendido_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")
            frecuencia_suspendido_drogas.Text = db.select1registro("frecuencia_suspendido_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")
            notas_suspendido_drogas.Text = db.select1registro("notas_suspendido_drogas", "drogas", "id_antecedente = '" & id_antecedente & "'")

            Select Case filtro_drogas
                Case 0
                    panel_si_drogas.Visible = False
                    panel_suspendido_drogas.Visible = False
                    drogas_checkbox.SelectedValue = "0"
                Case 1
                    panel_si_drogas.Visible = True
                    panel_suspendido_drogas.Visible = False
                    drogas_checkbox.SelectedValue = "1"
                Case 2
                    panel_si_drogas.Visible = False
                    panel_suspendido_drogas.Visible = True
                    drogas_checkbox.SelectedValue = "2"
            End Select

            'ALERGIAS
            Dim filtro_alergias = db.select1registro("alergias", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_alergias = 0 Then
                panel_alergias.Visible = False
                alergias_checkbox.SelectedValue = "0"
            End If

            If filtro_alergias = 1 Then
                panel_alergias.Visible = True
                alergias_checkbox.SelectedValue = "1"
            End If

            alergias_db.SelectCommand = "select * from alergias where id_antecedente = '" & id_antecedente & "'"

            'ANTECEDENTES PATOLOGICOS
            Dim filtro_antecedentes_patologicos = db.select1registro("antecedentes_pato", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_antecedentes_patologicos = 0 Then
                panel_antecedentes_patologicos.Visible = False
                antecedentes_patologicos_checkbox.SelectedValue = "0"
            End If

            If filtro_antecedentes_patologicos = 1 Then
                panel_antecedentes_patologicos.Visible = True
                antecedentes_patologicos_checkbox.SelectedValue = "1"
            End If

            antecedentes_patologicos_db.SelectCommand = "select * from antecedentes_patologicos where id_antecedente = '" & id_antecedente & "'"

            'ALTERACION NEUROCONDUCTUAL
            Dim filtro_alteracion = db.select1registro("alteracion_neurocon", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_antecedentes_patologicos = 0 Then
                panel_alteracion_neuroconductual.Visible = False
                alteracion_checkbox.SelectedValue = "0"
            End If

            If filtro_antecedentes_patologicos = 1 Then
                panel_alteracion_neuroconductual.Visible = True
                alteracion_checkbox.SelectedValue = "1"
            End If

            alteracion_neuroconductual_db.SelectCommand = "select * from alteracion_neuroconductual where id_antecedente = '" & id_antecedente & "'"

            'ALTERACION NEUROCONDUCTUAL
            Dim filtro_alteracion_neurologica = db.select1registro("alteracion_neurologica", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_alteracion_neurologica = 0 Then
                panel_neurologica.Visible = False
                alteracion_neurologica_checkbox.SelectedValue = "0"
            End If

            If filtro_antecedentes_patologicos = 1 Then
                panel_neurologica.Visible = True
                alteracion_neurologica_checkbox.SelectedValue = "1"
            End If

            alteracion_neurologica_db.SelectCommand = "select * from alteracion_neurologica where id_antecedente = '" & id_antecedente & "'"

            'ANTECEDENTES FAMILIARES
            Dim filtro_antecedentes_familiares = db.select1registro("antecedentes_fam", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_antecedentes_familiares = 0 Then
                panel_antecedes_familiares.Visible = False
                antecedentes_familiares_checkbox.SelectedValue = "0"
            End If

            If filtro_antecedentes_familiares = 1 Then
                panel_antecedes_familiares.Visible = True
                antecedentes_familiares_checkbox.SelectedValue = "1"
            End If

            antecedentes_familiares_db.SelectCommand = "select * from antecedentes_familiares where id_antecedente = '" & id_antecedente & "'"

            'LESIONES
            Dim filtro_lesiones = db.select1registro("lesiones", "antecedentes", "id_antecedente = '" & id_antecedente & "'")

            If filtro_lesiones = 0 Then
                panel_lesiones.Visible = False
                lesiones_checkbox.SelectedValue = "0"
            End If

            If filtro_lesiones = 1 Then
                lesiones_checkbox.Visible = True
                antecedentes_familiares_checkbox.SelectedValue = "1"
            End If

            lesiones_db.SelectCommand = "select * from lesiones where id_antecedente = '" & id_antecedente & "'"
        End If

        
    End Sub

    Protected Sub agregar_actividad_fisica_Click(sender As Object, e As EventArgs) Handles agregar_actividad_fisica.Click
        db.selectCustom("insert into actividad_fisica (id_antecedente,actividad,tiempo, frecuencia,notas) values ('" & Request.QueryString("a") & "','" & actividad_actividad_fisica.Text & "','" & tiempo_actividad_fisica.Text & "','" & frecuencia_actividad_fisica.Text & "', '" & notas_actividad_fisica.Text & "')", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub alimentacion_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles alimentacion_checkbox.SelectedIndexChanged
        Dim actividadItem = alimentacion_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_alimentacion.Visible = True
                db.selectCustom("update antecedentes set alimentacion = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "0"
                panel_alimentacion.Visible = False
                db.selectCustom("update antecedentes set alimentacion = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
        End Select
    End Sub


    Protected Sub calorias_checkbox_CheckedChanged(sender As Object, e As EventArgs) Handles calorias_checkbox.CheckedChanged
        If calorias_checkbox.Checked = True Then
            db.selectCustom("update alimentacion set exceso_calorias = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_calorias")
        Else
            db.selectCustom("update alimentacion set exceso_calorias = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_calorias")
        End If
    End Sub

    Protected Sub azucar_checkbox_CheckedChanged(sender As Object, e As EventArgs) Handles azucar_checkbox.CheckedChanged
        If azucar_checkbox.Checked = True Then
            db.selectCustom("update alimentacion set exceso_azucar = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_azucar")
        Else
            db.selectCustom("update alimentacion set exceso_azucar = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_azucar")
        End If
    End Sub

    Protected Sub sodio_checkbox_CheckedChanged(sender As Object, e As EventArgs) Handles sodio_checkbox.CheckedChanged
        If sodio_checkbox.Checked = True Then
            db.selectCustom("update alimentacion set exceso_sodio = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_sodio")
        Else
            db.selectCustom("update alimentacion set exceso_sodio = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "exceso_sodio")
        End If
    End Sub

    Protected Sub actualizar_cambios_Click(sender As Object, e As EventArgs) Handles actualizar_cambios.Click
        'ALIMENTACION
        db.selectCustom("update alimentacion set notas = '" & notas_alimentacion.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas")
        'SUEÑO
        db.selectCustom("update sueño set tiempo = '" & tiempo_sueño.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "tiempo")
        db.selectCustom("update sueño set frecuencia = '" & frecuencia_sueño.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "frecuencia")
        db.selectCustom("update sueño set notas = '" & notas_sueño.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "tiempo")
        'TABACO
        db.selectCustom("update tabaco set cigarros_si_tabaco = '" & cigarros_si_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cigarros_si_tabaco")
        db.selectCustom("update tabaco set years_si_tabaco = '" & years_si_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "years_si_tabaco")
        db.selectCustom("update tabaco set notas_si_tabaco = '" & notas_si_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_si_tabaco")
        db.selectCustom("update tabaco set tiempo_suspendido_tabaco = '" & tiempo_suspendido_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "tiempo_suspendido_tabaco")
        db.selectCustom("update tabaco set cigarros_suspendido_tabaco = '" & cigarros_suspendido_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cigarros_suspendido_tabaco")
        db.selectCustom("update tabaco set years_suspendido_tabaco = '" & years_suspendido_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "years_suspendido_tabaco")
        db.selectCustom("update tabaco set notas_suspendido_tabaco = '" & notas_suspendido_tabaco.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_suspendido_tabaco")
        'ALCOHOL
        db.selectCustom("update alcohol set cantidad_si_alcohol = '" & cantidad_si_alcohol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cantidad_si_alcohol")
        db.selectCustom("update alcohol set frecuencia_si_alcohol = '" & frecuencia_si_alcohol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "frecuencia_si_alcohol")
        db.selectCustom("update alcohol set notas_si_alcohol = '" & notas_si_alchol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_si_alcohol")
        db.selectCustom("update alcohol set cantidad_suspendido_alcohol = '" & cantidad_suspendido_alcohol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cantidad_suspendido_alcohol")
        db.selectCustom("update alcohol set frecuencia_suspendido_alcohol = '" & frecuencia_suspendido_alcohol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "frecuencia_suspendido_alcohol")
        db.selectCustom("update alcohol set notas_suspendido_alcohol = '" & notas_suspendido_alcohol.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_suspendido_alcohol")
        'DROGAS
        db.selectCustom("update drogas set cantidad_si_drogas = '" & cantidad_si_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cantidad_si_drogas")
        db.selectCustom("update drogas set frecuencia_si_drogas = '" & frecuencia_si_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "frecuencia_si_drogas")
        db.selectCustom("update drogas set notas_si_drogas = '" & notas_si_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_si_drogas")
        db.selectCustom("update drogas set cantidad_suspendido_drogas = '" & cantidad_suspendido_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "cantidad_suspendido_drogas")
        db.selectCustom("update drogas set frecuencia_suspendido_drogas = '" & frecuencia_suspendido_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "frecuencia_suspendido_drogas")
        db.selectCustom("update drogas set notas_suspendido_drogas = '" & notas_suspendido_drogas.Text & "' where id_antecedente = '" & Request.QueryString("a") & "' ", "notas_suspendido_drogas")
    End Sub

    Protected Sub sueño_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles sueño_checkbox.SelectedIndexChanged
        Dim actividadItem = sueño_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_sueño.Visible = True
                db.selectCustom("update antecedentes set sueño = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "0"
                panel_sueño.Visible = False
                db.selectCustom("update antecedentes set sueño = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
        End Select
    End Sub

    Protected Sub tabaco_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles tabaco_checkbox.SelectedIndexChanged
        Dim actividadItem = tabaco_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_si_tabaco.Visible = True
                panel_suspendido_tabaco.Visible = False
                db.selectCustom("update antecedentes set tabaco = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "0"
                panel_si_tabaco.Visible = False
                panel_suspendido_tabaco.Visible = False
                db.selectCustom("update antecedentes set tabaco = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "2"
                panel_si_tabaco.Visible = False
                panel_suspendido_tabaco.Visible = True
                db.selectCustom("update antecedentes set tabaco = '2' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
        End Select
    End Sub

    Protected Sub alcohol_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles alcohol_checkbox.SelectedIndexChanged
        Dim actividadItem = alcohol_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_si_alcohol.Visible = True
                panel_suspendido_alcohol.Visible = False
                db.selectCustom("update antecedentes set alcohol = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "0"
                panel_si_alcohol.Visible = False
                panel_suspendido_alcohol.Visible = False
                db.selectCustom("update antecedentes set alcohol = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "2"
                panel_si_alcohol.Visible = False
                panel_suspendido_alcohol.Visible = True
                db.selectCustom("update antecedentes set alcohol = '2' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
        End Select
    End Sub

    Protected Sub drogas_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drogas_checkbox.SelectedIndexChanged
        Dim actividadItem = drogas_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_si_drogas.Visible = True
                panel_suspendido_drogas.Visible = False
                db.selectCustom("update antecedentes set drogas = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "0"
                panel_si_drogas.Visible = False
                panel_suspendido_drogas.Visible = False
                db.selectCustom("update antecedentes set drogas = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
            Case "2"
                panel_si_drogas.Visible = False
                panel_suspendido_drogas.Visible = True
                db.selectCustom("update antecedentes set drogas = '2' where id_antecedente = '" & Request.QueryString("a") & "'", "alimentacion")
        End Select
    End Sub

    Protected Sub alergias_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles alergias_checkbox.SelectedIndexChanged
        Dim actividadItem = alergias_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_alergias.Visible = True
                db.selectCustom("update antecedentes set alergias = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_alergias.Visible = False
                db.selectCustom("update antecedentes set alergias = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_alergia_Click(sender As Object, e As EventArgs) Handles agregar_alergia.Click
        db.selectCustom("insert into alergias (id_antecedente,alergeno_alergia,reaccion_alergia, notas_alergia) values ('" & Request.QueryString("a") & "','" & alergeno_alergia.Text & "','" & reaccion_alergia.Text & "','" & notas_alergia.Text & "')", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub antecedentes_patologicos_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles antecedentes_patologicos_checkbox.SelectedIndexChanged
        Dim actividadItem = antecedentes_patologicos_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_antecedentes_patologicos.Visible = True
                db.selectCustom("update antecedentes set antecedentes_pato = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_antecedentes_patologicos.Visible = False
                db.selectCustom("update antecedentes set antecedentes_pato = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_tratamiento_patologico_Click(sender As Object, e As EventArgs) Handles agregar_tratamiento_patologico.Click
        db.selectCustom("update antecedentes_patologicos set tratamiento ='" & tratamiento_antecedentes_patologicos.Text & "' where antecedente_patologico = '" & dropdown_antecedentes.SelectedValue & "'", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub agregar_antecedente_patologico_Click(sender As Object, e As EventArgs) Handles agregar_antecedente_patologico.Click
        db.selectCustom("insert into antecedentes_patologicos (id_antecedente, antecedente_patologico, tratamiento, notas_antecedentes_patologicos) values ('" & Request.QueryString("a") & "','" & nuevo_antecedente_patologico.Text & "','','" & notas_antecedentes_patologicos.Text & "')", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub alteracion_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles alteracion_checkbox.SelectedIndexChanged
        Dim actividadItem = alteracion_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_alteracion_neuroconductual.Visible = True
                db.selectCustom("update antecedentes set alteracion_neurocon = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_alteracion_neuroconductual.Visible = False
                db.selectCustom("update antecedentes set alteracion_neurocon = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_tratamiento_neuroconductual_Click(sender As Object, e As EventArgs) Handles agregar_tratamiento_neuroconductual.Click
        db.selectCustom("update alteracion_neuroconductual set tratamiento ='" & tratamiento_neuroconductual.Text & "', notas_alteracion = '" & notas_neuroconductual.Text & "'  where alteracion = '" & dropdown_neuroconductual.SelectedValue & "'", "alteracion")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub alteracion_neurologica_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles alteracion_neurologica_checkbox.SelectedIndexChanged
        Dim actividadItem = alteracion_neurologica_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_neurologica.Visible = True
                db.selectCustom("update antecedentes set alteracion_neurologica = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_neurologica.Visible = False
                db.selectCustom("update antecedentes set alteracion_neurologica = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_tratamiento_neurologico_Click(sender As Object, e As EventArgs) Handles agregar_tratamiento_neurologico.Click
        db.selectCustom("update alteracion_neurologica set tratamiento ='" & tratamiento_neurologico.Text & "', notas_alteracion = '" & notas_neurologico.Text & "'  where alteracion = '" & dropdown_neurologico.SelectedValue & "'", "alteracion")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub antecedentes_familiares_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles antecedentes_familiares_checkbox.SelectedIndexChanged
        Dim actividadItem = antecedentes_familiares_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_antecedes_familiares.Visible = True
                db.selectCustom("update antecedentes set antecedentes_fam = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_antecedes_familiares.Visible = False
                db.selectCustom("update antecedentes set antecedentes_fam = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_familiar_Click(sender As Object, e As EventArgs) Handles agregar_familiar.Click
        db.selectCustom("update antecedentes_familiares set familiar ='" & familiar_padecimiento.Text & "' where antecedente = '" & dropdown_padecimiento_familiar.SelectedValue & "'", "alteracion")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub agregar_antecedente_familiar_Click(sender As Object, e As EventArgs) Handles agregar_antecedente_familiar.Click
        db.selectCustom("insert into antecedentes_familiares(id_antecedente, familiar,antecedente, notas_antecedente) values ('" & Request.QueryString("a") & "','','" & antecedente_familiar.Text & "','" & notas_antecedentes_familiar.Text & "')", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")
    End Sub

    Protected Sub lesiones_checkbox_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lesiones_checkbox.SelectedIndexChanged
        Dim actividadItem = lesiones_checkbox.SelectedValue
        Select Case actividadItem
            Case "1"
                panel_lesiones.Visible = True
                db.selectCustom("update antecedentes set lesiones = '1' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
            Case "0"
                panel_lesiones.Visible = False
                db.selectCustom("update antecedentes set lesiones = '0' where id_antecedente = '" & Request.QueryString("a") & "'", "id_antecedente")
        End Select
    End Sub

    Protected Sub agregar_lesion_Click(sender As Object, e As EventArgs) Handles agregar_lesion.Click
        db.selectCustom("insert into lesiones(id_antecedente, lesion,fecha_lesion, complicacion, notas_lesion) values ('" & Request.QueryString("a") & "','" & lesion.Text & "','" & lesion_fecha.Text & "','" & lesion_complicacion.Text & "','" & notas_lesion.Text & "')", "")
        Response.Redirect("ant_pac.aspx?a=" & Request.QueryString("a") & "")

    End Sub
End Class
