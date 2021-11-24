<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="profile.pac.aspx.vb" Inherits="profile_pac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/profile_pac.css" rel="stylesheet" />
    <div class="container emp-profile">
        <div class="row">
            <div class="col-md-4">
                <div class="profile-img">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog" alt="" />
                    <div class="file btn btn-lg btn-primary">
                        Cambiar foto...
                               
                        <input type="file" name="file" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                    <h5>#<asp:Label ID="id_paciente" Text="folio" runat="server"></asp:Label>
                        <asp:Label ID="nombre" Text="Nombre" runat="server" />
                    </h5>
                    <p class="proile-rating">
                        Fecha de nacimiento:
                        <asp:Label ID="fecha" Text="Fecha" runat="server" />
                    </p>
                    <p class="proile-rating">
                        Estado civil:
                        <asp:Label ID="estado_civil" Text="Soltero" runat="server" />
                    </p>
                    <p class="proile-rating">
                        Ocupación:
                        <asp:Label ID="ocupacion" Text="Ocupación" runat="server" />
                    </p>

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Datos Personales</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Contacto de emergencia</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2">
                <div class="col">
                    <asp:Button Text="Editar" class="profile-edit-btn" ID="editar_paciente" runat="server" />
                </div>
                <br />
                <div class="col">
                    <asp:Button Text="Antecedentes" class="profile-edit-btn" Style="background-color: #1cc88a; color: white" ID="antecedentes" runat="server" />
                </div>


                <%--<input type="submit"  name="btnAddMore" value="Edit Profile"/>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <ul class="nav nav-tabs" id="myTabResumen" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="resumen-tab" data-toggle="tab" href="#resumen" role="tab" aria-controls="resumen" aria-selected="true">Resumen</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="historial-tab" data-toggle="tab" href="#historial" role="tab" aria-controls="historial" aria-selected="false">Historial</a>
                    </li>
                </ul>
                <div class="tab-content profile-tab" style="margin-top: 10px" id="Resumen">
                    <div class="tab-pane fade show active" id="resumen" role="tabpanel" aria-labelledby="resumen-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Antecedentes Patológicos</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="antecedentes_patologicos" Text="" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Alergias</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="alergias" Text="" runat="server" />
                                </p>
                            </div>
                        </div>

                    </div>
                    <div class="tab-pane fade" id="historial" role="tabpanel" aria-labelledby="historial-tab">
                        <div class="row">
                            <div class="col-md-12">
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
                       
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="consultasDb" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;"></asp:SqlDataSource>
            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Teléfono</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="telefono" Text="Teléfono" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Correo</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="correo" Text="Correo" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Plan médico</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="plan_medico" Text="Plan medico" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>No. Afiliado</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="numero_afiliado" Text="No Afiliado" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Nombre</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="nombre_contacto" Text="Nombre Contacto" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Teléfono contacto</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="telefono_contacto" Text="Teléfono contacto" runat="server" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Parentesco</label>
                            </div>
                            <div class="col-md-6">
                                <p>
                                    <asp:Label ID="parentesco_contacto" Text="Parentesco contacto" runat="server" />
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

