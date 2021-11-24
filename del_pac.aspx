<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="del_pac.aspx.vb" Inherits="del_pac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="  ">
        <p class="h4 mb-4">¿Desea eliminar al paciente?</p>
        <div class="form-row mb-4">
            <div class="col">
                <!-- First name -->
                <asp:TextBox runat="server" ID="txt_nombre" class="form-control" placeholder="Nombre" required="true" AutoComplete="off" disabled />
            </div>
            <div class="col">
                <!-- Last name -->
                <asp:TextBox runat="server" ID="txt_apellidos" class="form-control" placeholder="Apellidos" required="true" AutoComplete="off" disabled />
            </div>
            <div class="col">
                <asp:Button class="btn btn-danger " ID="eliminar" Text="Eliminar" runat="server" />
            </div>
        </div>






    </div>
</asp:Content>

