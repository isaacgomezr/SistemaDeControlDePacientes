<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="inicio.aspx.vb" Inherits="inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Registro de pacientes</h1>
    <br />
    <%-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>--%>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <%--<h6 class="m-0 font-weight-bold text-primary">Pacientes</h6>--%>
            <!-- Topbar Search -->
            <div class="col-md-12">
                <div class="float-left col-md-6">
                    <div class="input-group">
                        <asp:TextBox ID="txt_paciente" AutoComplete="off" runat="server" class="form-control bg-light border-1 small" placeholder="Buscar pacientes" aria-label="Search" aria-describedby="basic-addon2" />

                        <div class="input-group-append">
                            <asp:Button ID="buscar_pacientes" Text="Buscar" CssClass="btn btn-primary" Style="background-color:#154360; border-color:white" runat="server"></asp:Button>
                            <%--   <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>--%>
                        </div>
                    </div>
                </div>
                <div class="float-right col-md-6">
                    <a href="alta_pac.aspx" class="btn btn-success btn-icon-split">
                        <span class="text">Nuevo paciente</span>
                        <span class="icon text-white-50">
                            <i class="fas fa-plus"></i>
                        </span>
                    </a>
                </div>
            </div>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView DataSourceID="pacientesDb" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_paciente">
                    <Columns>
                        <asp:BoundField DataField="id_paciente" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                        <asp:TemplateField HeaderText="Paciente">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="profile.pac.aspx?p=<%# Eval("id_paciente")%>"><%# Eval("nombre")%> <%# Eval("apellido")%></a>
                          
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contacto">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <span class=""><a href="#"><i class="fas fa-phone" style="color: #1cc88a!important"></i><%# Eval("telefono")%>     </a>
                                        <br />
                                        <a href="#"><i class="fas fa-envelope" style="color: #4e73df!important"></i><%# Eval("correo")%> </a></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="consultas.aspx?p=<%# Eval("id_paciente")%> " class="btn btn-primary" border-color:white"">Consultas</a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="act_pac.aspx?p=<%# Eval("id_paciente")%> "><i class="fas fa-edit" style="color: #1cc88a!important"></i></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="del_pac.aspx?p=<%# Eval("id_paciente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <span><i class="fas fa-birthday-cake" style="<%# Eval("cumple")%>"></i></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="pacientesDb" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;"></asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>

