<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="del_alergias.aspx.vb" Inherits="del_alergias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="  ">
        <p class="h4 mb-4">¿Desea eliminar la alergia?</p>
        <div class="form-row mb-4">
            <div class="col">
                <!-- First name -->
                <asp:TextBox runat="server" ID="txt_alergia" class="form-control" placeholder="Alergia" required="true" AutoComplete="off" disabled />
            </div>
            <div class="col">
                <asp:Button class="btn btn-danger " ID="eliminar" Text="Eliminar" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>

