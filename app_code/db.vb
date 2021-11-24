Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System
Imports System.Collections.Generic
Imports System.Configuration
Public Class db

    Public Shared Function insert(ByVal tabla As String, ByVal campos As String, ByVal valores As String, Optional conexion As String = "freeaspconnection") As Boolean
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()
            cadenaSQL = "INSERT INTO " & tabla & " (" & campos & ")VALUES(" & valores & ")"
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            comandoSQL.ExecuteNonQuery()
            cadenaConexion.Close()
            Return True
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return False
        Finally
            cadenaConexion.Close()
        End Try

    End Function

    Public Shared Function exist(ByVal sql As String, Optional conexion As String = "freeaspconnection") As Boolean
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = "if EXISTS(" & sql & ") print 1 else print 2"
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            While oDataReader.Read()
                respuestaSQL = oDataReader(0)
                Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
            End While
            oDataReader.Close()
            cadenaConexion.Close()

            If respuestaSQL = 1 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function


    Public Shared Function update(ByVal tabla As String, ByVal sset As String, ByVal wwhere As String, Optional conexion As String = "freeaspconnection") As Boolean
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()
            cadenaSQL = "UPDATE " & tabla & " SET " & sset & " WHERE " & wwhere
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            comandoSQL.ExecuteNonQuery()
            cadenaConexion.Close()
            Return True
        Catch ex As Exception
            Dim objWriter As New System.IO.StreamWriter("C:\inetpub\vhosts\reehab.com\httpdocs\admin\trans\" & Date.Now.ToString("ddMMyyyy HH-mm-ss-fff") & ".txt")
            objWriter.Write(tabla & vbNewLine & sset & vbNewLine & wwhere)
            objWriter.Close()
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function delete(ByVal tabla As String, ByVal wwhere As String, Optional conexion As String = "freeaspconnection") As Boolean
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()
            cadenaSQL = "DELETE FROM " & tabla & " WHERE " & wwhere
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            comandoSQL.ExecuteNonQuery()
            cadenaConexion.Close()
            Return True
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return False
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function select1registro(ByVal campo As String, ByVal tabla As String, ByVal wwhere As String, Optional conexion As String = "freeaspconnection") As String
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = "Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;"
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = "select top 1 " & campo & " from " & tabla & " where " & wwhere
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            While oDataReader.Read()
                respuestaSQL = oDataReader(campo)
                Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function selectdb(ByVal campo As String, ByVal tabla As String, ByVal wwhere As String, ByVal registro As Int64, Optional conexion As String = "freeaspconnection") As String
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = "select " & campo & " from " & tabla & " where " & wwhere
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            Dim contador As Int64 = 0
            While oDataReader.Read()
                respuestaSQL = oDataReader(campo)
                If contador = registro Then
                    Exit While    'para que regrese el registro numero tal...
                Else
                    contador = contador + 1
                End If

            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function


    Public Shared Function selectCatalogos(ByVal campos As String, ByVal tabla As String, Optional where As String = "") As DataTable
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Dim dt As New DataTable
        Try
            dt = New DataTable
            If where.Trim().Length > 0 Then
                where = " WHERE " & where
            Else
                where = ""
            End If
            cadenaSQL = "SELECT " & campos & " FROM " & tabla & where
            cadenaConexion.ConnectionString = ConfigurationManager.AppSettings("ucatalogos")
            cadenaConexion.Open()
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            Dim dr As SqlDataReader = comandoSQL.ExecuteReader()
            dt.Load(dr)
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
        Finally
            cadenaConexion.Close()
        End Try
        Return dt
    End Function
    Public Shared Function selectCatalogos2(ByVal campos As String, ByVal tabla As String, ByVal where As String, Optional conexion As String = "freeaspconnection") As DataTable
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Dim dt As New DataTable
        Try
            dt = New DataTable
            If where.Trim().Length > 0 Then
                where = " WHERE " & where
            Else
                where = ""
            End If
            cadenaSQL = "SELECT " & campos & " FROM " & tabla & where
            cadenaConexion.ConnectionString = ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            Dim dr As SqlDataReader = comandoSQL.ExecuteReader()
            dt.Load(dr)
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
        Finally
            cadenaConexion.Close()
        End Try
        Return dt
    End Function
    Public Shared Function contador(ByVal campo As String, ByVal tabla As String, ByVal wwhere As String, Optional conexion As String = "freeaspconnection") As Int64
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = "select count(" & campo & ") as cantidad  from " & tabla & " where " & wwhere
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As Int64
            While oDataReader.Read()
                respuestaSQL = oDataReader("cantidad")
            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return 0
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function selectTOP1registro(ByVal campo As String, ByVal tabla As String, ByVal wwhere As String, ByVal orderBy As String, Optional conexion As String = "freeaspconnection") As String
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = "Select top 1 " & campo & " from " & tabla & " where " & wwhere & " order by " & orderBy & ""
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            While oDataReader.Read()
                respuestaSQL = oDataReader(campo)
                Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function


    Public Shared Function selectCustom(ByVal selectSQL As String, ByVal campoReturn As String, Optional conexion As String = "freeaspconnection") As String
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = "Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;"
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = selectSQL
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            While oDataReader.Read()
                respuestaSQL = oDataReader(campoReturn)
                Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function suma(ByVal campo As String, ByVal tabla As String, ByVal wwhere As String, Optional conexion As String = "freeaspconnection") As Decimal
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            If db.contador(campo, tabla, wwhere) > 0 Then
                cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
                cadenaConexion.Open()

                Dim oDataReader As SqlDataReader
                cadenaSQL = "SELECT sum(" & campo & ") as suma FROM " & tabla & " where " & wwhere & ""
                Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
                oDataReader = comandoSQL.ExecuteReader()

                Dim respuestaSQL As String

                While oDataReader.Read()
                    respuestaSQL = oDataReader("suma")
                    Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
                End While
                oDataReader.Close()
                cadenaConexion.Close()
                Return respuestaSQL
            Else
                Return 0
            End If
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function

    Public Shared Function referenciasArray(ByVal origen As String) As String()
        Dim referencias(5) As String
        Dim SQL As String = "select referencia2, referencia3, referencia4, referencia5, multipagos FROM correos WHERE id_correo = '" & origen & "'"
        Using cn = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("freeaspconnection"))
            Using cmd = New SqlCommand(SQL, cn)
                cn.Open()
                Dim dr = cmd.ExecuteReader()
                While dr.Read()
                    referencias(0) = dr("referencia2").ToString()
                    referencias(1) = dr("referencia3").ToString()
                    referencias(2) = dr("referencia4").ToString()
                    referencias(3) = dr("referencia5").ToString()
                    referencias(4) = dr("multipagos").ToString()
                End While
            End Using
            cn.Close()
        End Using
        Return referencias
    End Function

    Public Shared Function direccionFBArray(ByVal transaccion As String) As String()
        Dim direccionFB(6) As String
        Dim SQL As String = "select direccion, ciudad, estado, pais, telefono, comentarios FROM transFB where id_transaccion = '" & transaccion & "'"
        Using cn = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("freeaspconnection"))
            Using cmd = New SqlCommand(SQL, cn)
                cn.Open()
                Dim dr = cmd.ExecuteReader()
                While dr.Read()
                    direccionFB(0) = dr("direccion").ToString()
                    direccionFB(1) = dr("ciudad").ToString()
                    direccionFB(2) = dr("estado").ToString()
                    direccionFB(3) = dr("pais").ToString()
                    direccionFB(4) = dr("telefono").ToString()
                    direccionFB(5) = dr("comentarios").ToString()
                End While
            End Using
            cn.Close()
        End Using
        Return direccionFB
    End Function
    Public Shared Function logErroresDB(NuevaLinea As String) As Boolean
        Try
            Dim sw As New System.IO.StreamWriter("C:\logErroresDB.txt", True)
            sw.WriteLine(Date.Now.ToString("dd/MM/yy HH:mm:ss:fff ") & NuevaLinea)
            sw.Close()
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function
    Public Shared Function Ejecutar_Query(ByVal query As String, ByVal parametros As Dictionary(Of String, Object), Optional conexion As String = "freeaspconnection") As DataTable
        Dim cadenaConexion As New SqlConnection
        Dim stringXML As String
        Dim dt As New DataTable()
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()
            Dim cmd As New SqlCommand(query, cadenaConexion)
            cmd.CommandType = CommandType.Text
            For Each item As KeyValuePair(Of String, Object) In parametros
                cmd.Parameters.AddWithValue("@" & item.Key, item.Value)
            Next
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)
            da.Dispose()
        Catch ex As Exception
            stringXML = ex.ToString
        Finally
            cadenaConexion.Close()
            cadenaConexion.Dispose()
        End Try
        Return dt
    End Function
    Public Shared Function selectMultiRegistroCustom(ByVal sqlCustom As String, Optional conexion As String = "freeaspconnection") As List(Of Dictionary(Of String, String))
        Dim lstObjs As New List(Of Dictionary(Of String, String))


        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = "Server=13.84.134.184;Database=atec;uid=dbs;pwd=Sdb0903.;"
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = sqlCustom
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            While oDataReader.Read()
                Dim dict As New Dictionary(Of String, String)
                For i As Integer = 0 To oDataReader.FieldCount - 1
                    If IsDBNull(oDataReader.Item(i)) Then
                        dict.Add(oDataReader.GetName(i), "")
                    Else
                        dict.Add(oDataReader.GetName(i), oDataReader.Item(i))
                    End If


                Next
                lstObjs.Add(dict)
            End While

            oDataReader.Close()
            cadenaConexion.Close()
        Catch ex As Exception
            cadenaConexion.Close()
        Finally
            cadenaConexion.Close()
        End Try

        Return lstObjs
    End Function

    Public Shared Function selectUnRegistroCustom(ByVal sqlCustom As String, Optional conexion As String = "freeaspconnection") As Dictionary(Of String, String)
        'Dim lstObjs As New List(Of Dictionary(Of String, String))
        Dim obj As New Dictionary(Of String, String)

        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = sqlCustom
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            While oDataReader.Read()
                Dim dict As New Dictionary(Of String, String)
                For i As Integer = 0 To oDataReader.FieldCount - 1
                    obj.Add(oDataReader.GetName(i), oDataReader.Item(i).ToString)
                    'dict.Add(oDataReader.GetName(i), oDataReader.Item(i))
                Next
                'lstObjs.Add(dict)
            End While

            oDataReader.Close()
            cadenaConexion.Close()
        Catch ex As Exception
            cadenaConexion.Close()
        Finally
            cadenaConexion.Close()
        End Try

        Return obj
    End Function

    Public Shared Function selectCustomLog(ByVal selectSQL As String, ByVal campoReturn As String, Optional conexion As String = "log") As String
        Dim cadenaConexion As New SqlConnection
        Dim cadenaSQL As String = ""
        Try
            cadenaConexion.ConnectionString = System.Configuration.ConfigurationManager.AppSettings(conexion)
            cadenaConexion.Open()

            Dim oDataReader As SqlDataReader
            cadenaSQL = selectSQL
            Dim comandoSQL As New SqlCommand(cadenaSQL, cadenaConexion)
            oDataReader = comandoSQL.ExecuteReader()

            Dim respuestaSQL As String

            While oDataReader.Read()
                respuestaSQL = oDataReader(campoReturn)
                Exit While    'para q solo regrese el PRIMER VALOR  ,sin esto se va hasta el ultimo registro encontrado
            End While
            oDataReader.Close()
            cadenaConexion.Close()
            Return respuestaSQL
        Catch ex As Exception
            cadenaConexion.Close()
            logErroresDB("reehab.com | " & cadenaSQL & " | " & ex.ToString)
            Return ex.Message
        Finally
            cadenaConexion.Close()
        End Try
    End Function
End Class
