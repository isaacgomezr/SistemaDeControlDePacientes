<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="ant_pac.aspx.vb" Inherits="ant_pac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <h1 class="h3 mb-2 text-gray-800">Antecedentes</h1>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="bs-example" style="margin: 20px">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingUno">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#collapseOne">Actividad física</button>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse" aria-labelledby="headingUno" data-parent="#accordionExample">
                            <div class="card-body">

                                <asp:RadioButtonList ID="actividad_fisica" RepeatDirection="Horizontal" AutoPostBack="true" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>



                                <asp:Panel ID="panel_actividad_fisica" runat="server">
                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="actividad_fisica_db" EmptyDataText="No hay actividades" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_actividad">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Actividad">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("actividad")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tiempo">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="#"><%# Eval("tiempo")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Frecuencia">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="#"><%# Eval("frecuencia")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="#"><%# Eval("notas")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_actividad_fisica.aspx?ac=<%# Eval("id_actividad")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="actividad_fisica_db" SelectCommand="select * from actividad_fisica where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <asp:TextBox ID="actividad_actividad_fisica" CssClass=" form-control" placeholder="Actividad" AutoComplete="off" runat="server" />
                                    <br />
                                    <asp:TextBox ID="tiempo_actividad_fisica" CssClass=" form-control" placeholder="Tiempo" runat="server" AutoComplete="off"/>
                                    <br />
                                    <asp:TextBox ID="frecuencia_actividad_fisica" CssClass=" form-control" placeholder="Frecuencia" runat="server" AutoComplete="off" />
                                    <br />
                                    <asp:TextBox ID="notas_actividad_fisica" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" AutoComplete="off" />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_actividad_fisica" Text="Agregar actividad" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingDos">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseDos">Alimentación</button>
                            </h2>
                        </div>
                        <div id="collapseDos" class="collapse" aria-labelledby="headingDos" data-parent="#accordionExample">
                            <div class="card-body">

                                <asp:RadioButtonList ID="alimentacion_checkbox" RepeatDirection="Horizontal" AutoPostBack="true" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>

                                <asp:Panel ID="panel_alimentacion" runat="server">
                                    <asp:CheckBox ID="calorias_checkbox" AutoPostBack="true" Text="Exceso calorias" runat="server" />
                                    <asp:CheckBox ID="azucar_checkbox" AutoPostBack="true" Text="Exceso azúcar" runat="server" />
                                    <asp:CheckBox ID="sodio_checkbox" AutoPostBack="true" Text="Sodio checkbox" runat="server" />
                                    <asp:TextBox ID="notas_alimentacion" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>


                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTres">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree">Sueño</button>
                            </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingTres" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="sueño_checkbox" RepeatDirection="Horizontal" AutoPostBack="true" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_sueño">
                                    <asp:TextBox ID="tiempo_sueño" CssClass=" form-control" placeholder="Tiempo" runat="server" />
                                    <br />
                                    <asp:TextBox ID="frecuencia_sueño" CssClass=" form-control" placeholder="Frecuencia" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_sueño" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingCuatro">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseCuatro">Tabaco</button>
                            </h2>
                        </div>
                        <div id="collapseCuatro" class="collapse" aria-labelledby="headingCuatro" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="tabaco_checkbox" RepeatDirection="Horizontal" AutoPostBack="true" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" style="margin-right:10px" Text="No" />
                                    <asp:ListItem Value="2" Text="Suspendido" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_si_tabaco">
                                    <asp:TextBox ID="cigarros_si_tabaco" CssClass=" form-control" placeholder="Cigarrillos por día" runat="server" />
                                    <br />
                                    <asp:TextBox ID="years_si_tabaco" CssClass=" form-control" placeholder="Años fumando" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_si_tabaco" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                                <br />
                                <asp:Panel runat="server" ID="panel_suspendido_tabaco">
                                    <asp:TextBox ID="tiempo_suspendido_tabaco" CssClass=" form-control" placeholder="Tiempo de supensión" runat="server" />
                                    <br />
                                    <asp:TextBox ID="cigarros_suspendido_tabaco" CssClass=" form-control" placeholder="Cigarrillos por día" runat="server" />
                                    <br />
                                    <asp:TextBox ID="years_suspendido_tabaco" CssClass=" form-control" placeholder="Años fumando" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_suspendido_tabaco" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingCinco">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseCinco">Alcohol</button>
                            </h2>
                        </div>
                        <div id="collapseCinco" class="collapse" aria-labelledby="headingCinco" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="alcohol_checkbox" AutoPostBack="true" RepeatDirection="Horizontal" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" style="margin-right:10px" Text="No" />
                                    <asp:ListItem Value="2" Text="Suspendido" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_si_alcohol">
                                    <asp:TextBox ID="cantidad_si_alcohol" CssClass=" form-control" placeholder="Cantidad" runat="server" />
                                    <br />
                                    <asp:TextBox ID="frecuencia_si_alcohol" CssClass=" form-control" placeholder="Frecuencia" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_si_alchol" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                                <br />
                                <asp:Panel runat="server" ID="panel_suspendido_alcohol">
                                    <asp:TextBox ID="cantidad_suspendido_alcohol" CssClass=" form-control" placeholder="Cantidad" runat="server" />
                                    <br />
                                    <asp:TextBox ID="frecuencia_suspendido_alcohol" CssClass=" form-control" placeholder="Frecuencia" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_suspendido_alcohol" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingSeis">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSeis">Drogas</button>
                            </h2>
                        </div>
                        <div id="collapseSeis" class="collapse" aria-labelledby="headingSeis" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="drogas_checkbox" RepeatDirection="Horizontal" AutoPostBack="true"  class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" style="margin-right:10px" Text="No" />
                                    <asp:ListItem Value="2" Text="Suspendido" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_si_drogas">
                                    <asp:TextBox ID="cantidad_si_drogas" CssClass=" form-control" placeholder="Cantidad" runat="server" />
                                    <br />
                                    <asp:TextBox ID="frecuencia_si_drogas" CssClass=" form-control" placeholder="Frecuencia" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_si_drogas" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                                <br />
                                <asp:Panel runat="server" ID="panel_suspendido_drogas">
                                    <asp:TextBox ID="cantidad_suspendido_drogas" CssClass=" form-control" placeholder="Cantidad" runat="server" />
                                    <br />
                                    <asp:TextBox ID="frecuencia_suspendido_drogas" CssClass=" form-control" placeholder="Frecuencia" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_suspendido_drogas" CssClass=" form-control" placeholder="Notas" TextMode="MultiLine" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingSiete">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSiete">Alergias</button>
                            </h2>
                        </div>
                        <div id="collapseSiete" class="collapse" aria-labelledby="headingSiete" data-parent="#accordionExample">
                            <div class="card-body">
                          
                                <asp:RadioButtonList ID="alergias_checkbox" RepeatDirection="Horizontal" AutoPostBack="true" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si"  />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_alergias">
                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="alergias_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_alergias">
                                            <Columns>
                                                <asp:BoundField DataField="id_alergias" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Alérgeno">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("alergeno_alergia")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reacción alergia">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("reaccion_alergia")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_alergia")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_alergias.aspx?aler=<%# Eval("id_alergias")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="alergias_db" SelectCommand="select * from alergias where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar otra alergia</p>
                                    <br />
                                    <asp:TextBox ID="alergeno_alergia" CssClass=" form-control" placeholder="Alérgeno" runat="server" />
                                    <br />
                                    <asp:TextBox ID="reaccion_alergia" CssClass=" form-control" placeholder="Reacción" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_alergia" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_alergia" Text="Agregar alergia" runat="server" />
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingOcho">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOcho">Antecedentes patológicos y tratamiento</button>
                            </h2>
                        </div>
                        <div id="collapseOcho" class="collapse" aria-labelledby="headingOcho" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="antecedentes_patologicos_checkbox" AutoPostBack="true" RepeatDirection="Horizontal" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_antecedentes_patologicos">

                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="antecedentes_patologicos_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_antecedente_patologico">
                                            <Columns>
                                                <asp:BoundField DataField="id_antecedente_patologico" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Antecedente patológico">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("antecedente_patologico")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tratamiento">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("tratamiento")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_antecedentes_patologicos")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_antecedente_patologico.aspx?ant_pat=<%# Eval("id_antecedente_patologico")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="antecedentes_patologicos_db" SelectCommand="select * from antecedentes_patologicos where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar tratamiento</p>
                                    <br />
                                    <asp:TextBox ID="tratamiento_antecedentes_patologicos" CssClass=" form-control" placeholder="Tratamiento" runat="server" />
                                    <br />
                                    <asp:DropDownList ID="dropdown_antecedentes" DataTextField="antecedente_patologico" DataValueField="antecedente_patologico" DataSourceID="antecedente_dropdown_db" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_tratamiento_patologico" Text="Agregar tratamiento" runat="server" />
                                    <asp:SqlDataSource ID="antecedente_dropdown_db" SelectCommand="select antecedente_patologico from antecedentes_patologicos where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    <br />

                                    <p>Agregar otro antecedente</p>
                                    <br />

                                    <asp:TextBox ID="nuevo_antecedente_patologico" CssClass=" form-control" placeholder="Antecedente patológico" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_antecedentes_patologicos" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_antecedente_patologico" Text="Agregar antecedente" runat="server" />
                                    
                                    

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingNueve">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseNueve">Alteración neuroconductual</button>
                            </h2>
                        </div>
                        <div id="collapseNueve" class="collapse" aria-labelledby="headingNueve" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="alteracion_checkbox" AutoPostBack="true" RepeatDirection="Horizontal" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_alteracion_neuroconductual">

                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="alteracion_neuroconductual_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_alteracion">
                                            <Columns>
                                                <asp:BoundField DataField="id_alteracion" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Alteración">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("alteracion")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tratamiento">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("tratamiento")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_alteracion")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_antecedente_patologico.aspx?ant_pat=<%# Eval("id_alteracion")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="alteracion_neuroconductual_db" SelectCommand="select * from alteracion_neuroconductual where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar tratamiento</p>
                                    <br />
                                    <asp:TextBox ID="tratamiento_neuroconductual" CssClass=" form-control" placeholder="Tratamiento" runat="server" />
                                    <br />
                                    <asp:DropDownList ID="dropdown_neuroconductual" DataSourceID="alteracion_dropdown_db" DataTextField="alteracion" DataValueField="alteracion" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="alteracion_dropdown_db" SelectCommand="select alteracion from alteracion_neuroconductual where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    <br />
                                    <asp:TextBox ID="notas_neuroconductual" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_tratamiento_neuroconductual" Text="Agregar tratamiento" runat="server" />

                                    

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingDiez">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseDiez">Alteración neurológica</button>
                            </h2>
                        </div>
                        <div id="collapseDiez" class="collapse" aria-labelledby="headingDiez" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="alteracion_neurologica_checkbox" AutoPostBack="true" RepeatDirection="Horizontal" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_neurologica">

                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="alteracion_neurologica_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_alteracion">
                                            <Columns>
                                                <asp:BoundField DataField="id_alteracion" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Alteración">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("alteracion")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tratamiento">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("tratamiento")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_alteracion")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_antecedente_patologico.aspx?ant_pat=<%# Eval("id_alteracion")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="alteracion_neurologica_db" SelectCommand="select * from alteracion_neurologica where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar tratamiento</p>
                                    <br />
                                    <asp:TextBox ID="tratamiento_neurologico" CssClass=" form-control" placeholder="Tratamiento" runat="server" />
                                    <br />
                                    <asp:DropDownList ID="dropdown_neurologico" DataSourceID="dropdown_neurologica_db" DataTextField="alteracion" DataValueField="alteracion" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dropdown_neurologica_db" SelectCommand="select alteracion from alteracion_neurologica where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    <br />
                                    <asp:TextBox ID="notas_neurologico" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_tratamiento_neurologico" Text="Agregar tratamiento" runat="server" />

                                    

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingOnce">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOnce">Antecedentes familiares patológicos</button>
                            </h2>
                        </div>
                        <div id="collapseOnce" class="collapse" aria-labelledby="headingOnce" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="antecedentes_familiares_checkbox" AutoPostBack="true" RepeatDirection="Horizontal" class="" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_antecedes_familiares">

                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="antecedentes_familiares_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_antecedente_familiar">
                                            <Columns>
                                               <asp:BoundField DataField="id_antecedente_familiar" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Antecedente">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("antecedente")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Familiar">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("familiar")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_antecedente")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_antecedente_patologico.aspx?ant_pat=<%# Eval("id_antecedente_familiar")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                         <asp:SqlDataSource ID="antecedentes_familiares_db" SelectCommand="select * from antecedentes_familiares where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar familiar</p>
                                    <br />
                                    <asp:TextBox ID="familiar_padecimiento" CssClass=" form-control" placeholder="Familiares que lo padecen" runat="server" />
                                    <br />
                                    <asp:DropDownList ID="dropdown_padecimiento_familiar" DataSourceID="dropdown_antecedentes_familiares_db" DataTextField="antecedente" DataValueField="antecedente" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dropdown_antecedentes_familiares_db" SelectCommand="select antecedente from antecedentes_familiares where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_familiar" Text="Agregar familiar" runat="server" />

                                    <br />

                                    <p>Agregar otro antecedente</p>
                                    <br />

                                    <asp:TextBox ID="antecedente_familiar" CssClass=" form-control" placeholder="Antecedente familiar" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_antecedentes_familiar" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_antecedente_familiar" Text="Agregar antecedente" runat="server" />
                                    

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingDoce">
                            <h2 class="mb-0">
                                <button type="button" class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseDoce">Lesiones o accidentes</button>
                            </h2>
                        </div>
                        <div id="collapseDoce" class="collapse" aria-labelledby="headingDoce" data-parent="#accordionExample">
                            <div class="card-body">
                                <asp:RadioButtonList ID="lesiones_checkbox" AutoPostBack="true"  RepeatDirection="Horizontal" runat="server">
                                    <asp:ListItem Value="1" style="margin-right:10px" Text="Si" />
                                    <asp:ListItem Value="0" Text="No" />
                                </asp:RadioButtonList>
                                <asp:Panel runat="server" ID="panel_lesiones">

                                    <div class="table-responsive">
                                        <asp:GridView DataSourceID="lesiones_db" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered" CellSpacing="0" DataKeyNames="id_lesion">
                                            <Columns>
                                                <asp:BoundField DataField="id_lesion" ItemStyle-Width="10%" HeaderText="No."></asp:BoundField>

                                                <asp:TemplateField HeaderText="Lesión">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("lesion")%> </a>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha de lesión">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("fecha_lesion")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Complicación">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("complicacion")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Notas">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a><%# Eval("notas_lesion")%> </a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="col-sm-12">
                                                            <a href="del_antecedente_patologico.aspx?ant_pat=<%# Eval("id_lesion")%>&a=<%# Eval("id_antecedente")%> "><i class="fas fa-trash" style="color: #dc3545!important"></i></a>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="lesiones_db" SelectCommand="select * from lesiones where id_antecedente = @id_antecedente" runat="server" ConnectionString="Server=SQL5101.site4now.net;Database=DB_A6EDFB_maindb;uid=DB_A6EDFB_maindb_admin;pwd=aznara13;">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_antecedente"
                                                    QueryStringField="a" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <br />
                                    <p>Agregar lesión</p>
                                    <br />
                                    <asp:TextBox ID="lesion" CssClass=" form-control" placeholder="Qué" runat="server" />
                                    <br />
                                    <asp:TextBox ID="lesion_fecha" CssClass=" form-control" placeholder="Cuando" runat="server" />
                                    <br />
                                    <asp:TextBox ID="lesion_complicacion" CssClass=" form-control" placeholder="Complicación" runat="server" />
                                    <br />
                                    <asp:TextBox ID="notas_lesion" CssClass=" form-control" placeholder="Notas" runat="server" />
                                    <br />
                                    <asp:Button class="btn btn-info my-4 btn-block" ID="agregar_lesion" Text="Agregar lesión" runat="server" />

                                    

                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button class="btn btn-success my-4 btn-block" ID="actualizar_cambios" Text="Actualizar cambios" runat="server" />
        </div>


    </div>

</asp:Content>

