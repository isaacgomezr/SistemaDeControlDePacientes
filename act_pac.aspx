<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="act_pac.aspx.vb" Inherits="act_pac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker-standalone.css" integrity="sha512-2e0Kl/wKgOUm/I722SOPMtmphkIjECJFpJrTRRyL8gjJSJIP2VofmEbqyApMaMfFhU727K3voz0e5EgE3Zf2Dg==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" integrity="sha512-aEe/ZxePawj0+G2R+AaIxgrQuKT68I28qh+wgLrcAJOz3rxCP+TwrK5SPN+E5I+1IQjNtcfvb96HDagwrKRdBw==" crossorigin="anonymous" />
    <div class="  ">
        <p class="h4 mb-4">Actualizar Pacientes</p>
        <p class="h5 mb-4">Datos personales</p>

        <div class="form-row mb-4">
            <div class="col">
                <!-- First name -->
                <asp:TextBox runat="server" ID="txt_nombre" Text="Nombre" class="form-control" placeholder="Nombre"  />
            </div>
            <div class="col">
                <!-- Last name -->
                <asp:TextBox runat="server" ID="txt_apellidos" Text="Nombre" class="form-control" placeholder="Apellidos" required="true" AutoComplete="off" />
            </div>
        </div>


        <asp:TextBox runat="server" ID="txt_fecha" ClientIDMode="Static" class="form-control mb-4" placeholder="Fecha de nacimiento" required="true" AutoComplete="off" />
        <small id="estado_c" class="form-text text-muted mb-4">Estado Civil
        </small>
        <asp:DropDownList runat="server" ID="estado_civil" aria-describedby="estado_c" CssClass="form-control mb-4">
            <asp:ListItem Selected="True" Value="Soltero">Soltero</asp:ListItem>
            <asp:ListItem Value="Casado">Casado</asp:ListItem>
            <asp:ListItem Value="NA">No aplica</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox runat="server" ID="txt_ocupacion" class="form-control mb-4" placeholder="Ocupación" required="true" AutoComplete="off" />

        <asp:TextBox runat="server" ID="txt_telefono" class="form-control mb-4" placeholder="Teléfono" required="true" AutoComplete="off" />


        <!-- E-mail -->
        <asp:TextBox runat="server" ID="txt_correo" class="form-control mb-4" placeholder="Correo" required="true" AutoComplete="off" />

        <hr />
        <p class="h5 mb-4">Seguros y planes médicos</p>

        <asp:TextBox runat="server" ID="txt_plan" class="form-control mb-4" placeholder="Plan médico" AutoComplete="off" />

        <asp:TextBox runat="server" ID="txt_no_afiliado" class="form-control mb-4" placeholder="Número afiliado" AutoComplete="off" />

        <hr />
        <p class="h5 mb-4">Contacto de emergencia</p>

        <asp:TextBox runat="server" ID="txt_nombre_contacto" class="form-control mb-4" placeholder="Nombre" AutoComplete="off"/>

        <asp:TextBox runat="server" ID="txt_telefono_contacto" class="form-control mb-4" placeholder="Teléfono" AutoComplete="off" />

        <asp:TextBox runat="server" ID="txt_parentesco" class="form-control mb-4" placeholder="Parentesco" AutoComplete="off" />


        <%--        <!-- Password -->
        <input type="password" id="defaultRegisterFormPassword" class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
        <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">At least 8 characters and 1 digit
        </small>

        <!-- Phone number -->
        <input type="text" id="defaultRegisterPhonePassword" class="form-control" placeholder="Phone number" aria-describedby="defaultRegisterFormPhoneHelpBlock">
        <small id="defaultRegisterFormPhoneHelpBlock" class="form-text text-muted mb-4">Optional - for two step authentication
        </small>--%>


        <!-- Sign up button -->
        <asp:Button class="btn btn-success my-4 btn-block" ID="actualizar" Text="Actualizar" runat="server" />



    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/moment.min.js" integrity="sha512-Q1f3TS3vSt1jQ8AwP2OuenztnLU6LwxgyyYOG1jgMW/cbEMHps/3wjvnl1P3WTrF3chJUWEoxDUEjMxDV8pujg==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" integrity="sha512-GDey37RZAxFkpFeJorEUwNoIbkTwsyC736KNSYucu1WJWFK9qTdzYub8ATxktr6Dwke7nbFaioypzbDOQykoRg==" crossorigin="anonymous"></script>
    <script>
        $.noConflict();
        jQuery(document).ready(function ($) {
            $(function () {
                $('#txt_fecha').datetimepicker({
                    format: 'YYYY/MM/DD'
                });
            });
        });
  </script>
</asp:Content>

