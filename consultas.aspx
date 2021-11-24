<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="consultas.aspx.vb" Inherits="consultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Consultas</h1>
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
                        <asp:TextBox ID="txt_consulta" AutoComplete="off" runat="server" class="form-control bg-light border-1 small" placeholder="Buscar consultas" aria-label="Search" aria-describedby="basic-addon2" />

                        <div class="input-group-append">
                            <asp:Button ID="buscar_consultas" Text="Buscar" CssClass="btn btn-primary" Style="background-color:#154360; border-color:white" runat="server"></asp:Button>
                            <%--   <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>--%>
                        </div>
                    </div>
                </div>
                <div class="float-right col-md-6">
                    <asp:Button Text="Nueva consulta" ID="nueva_consulta" class="btn btn-success" runat="server" />
                </div>
            </div>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView DataSourceID="consultasDb" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                        <asp:TemplateField HeaderText="Consulta">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("tipo")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                     <a href="#"><%# Eval("fecha")%> <%# Eval("hora")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Motivo">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("motivo_consulta")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Evolución">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("evolucion")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Factores">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("factores")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Desc. Dolor">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("descripcion_dolor")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Escala EVA">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("escala_eva")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Frecuencia Dolor">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("frecuencia_dolor")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actividad Dolor">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("actividad_dolor")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Exploración Física">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("exploracion_fisica")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Impresión Diagnostica">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("impresion_diagnostica")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Plan Tratamiento">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("plan_tratamiento")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Observaciones">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("observaciones")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datos Subjetivos">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("datos_subjetivos")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Datos Objetivos">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("datos_objetivos")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Intervención">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("intervencion")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Notas">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="#"><%# Eval("notas")%></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <div class="col-sm-12">
                                    <a href="del_con.aspx?con=<%# Eval("id")%>&p=<%# Eval("id_paciente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="consultasDb" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

