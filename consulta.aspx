<%@ Page Title="" Language="VB" MasterPageFile="~/MasterDefault.master" AutoEventWireup="false" CodeFile="consulta.aspx.vb" Inherits="consulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" integrity="sha512-aEe/ZxePawj0+G2R+AaIxgrQuKT68I28qh+wgLrcAJOz3rxCP+TwrK5SPN+E5I+1IQjNtcfvb96HDagwrKRdBw==" crossorigin="anonymous" />
    <link href="css/profile_pac.css" rel="stylesheet" />
    <div class="container emp-profile">
        <div id="div_id_select_consulta" class="form-group required">
            <label for="id_select" class="control-label col-md-4  requiredField">Tipo de consulta<span class="asteriskField">*</span> </label>
            <div class="controls col-md-8 " style="margin-bottom: 10px">
                <asp:RadioButtonList ID="radio_consulta" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True" style="margin-right: 10px" Text="Inicial" />
                    <asp:ListItem Value="2" style="margin-right: 10px" Text="Seguimiento" />
                    <asp:ListItem Value="3" style="margin-right: 10px" Text="Masaje" />
                    <asp:ListItem Value="4" style="margin-right: 10px" Text="Dermatofuncional" />
                </asp:RadioButtonList>
            </div>
        </div>
        <div id="accordion">
            <asp:Panel ID="panel_consulta" runat="server">
                <div class="card">
                    <div class="card-header" id="headingregular">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapse_consulta_regular" aria-expanded="true" aria-controls="collapse_consulta_regular">
                                Consulta
                            </button>
                        </h5>
                    </div>

                    <div id="collapse_consulta_regular" class="collapse show" aria-labelledby="headingregular" data-parent="#accordion">
                        <div class="card-body">
                            <div id="signupbox" style="" class="">
                                <div class="panel panel-info">
                                    <div class="panel-body">

                                        <div id="div_fecha" class="form-group required">
                                            <label for="fecha" class="control-label col-md-4  requiredField">Fecha de consulta<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="fecha" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" AutoComplete="off"/>
                                            </div>
                                        </div>
                                        <div id="div_hora" class="form-group required">
                                            <label for="hora" class="control-label col-md-4  requiredField">Hora de consulta<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="hora" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_motivo" class="form-group required">
                                            <label for="motivo" class="control-label col-md-4  requiredField">Motivo de consulta<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="motivo" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_evolucion" class="form-group required">
                                            <label for="evolucion" class="control-label col-md-4  requiredField">Evolución<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="evolucion" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_factores" class="form-group required">
                                            <label for="factores" class="control-label col-md-4  requiredField">Factores<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="factores" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_descripcion" class="form-group required">
                                            <label for="descripcion" class="control-label col-md-4  requiredField">Descripción del dolor<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="descripcion" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_eva" class="form-group required">
                                            <label for="eva" class="control-label col-md-4  requiredField">Escala de Eva<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 " style="margin-bottom: 10px">
                                                <asp:RadioButtonList ID="eva" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="0" style="margin-right: 10px" Text="0" />
                                                    <asp:ListItem Value="1" style="margin-right: 10px" Text="1" />
                                                    <asp:ListItem Value="2" style="margin-right: 10px" Text="2" />
                                                    <asp:ListItem Value="3" style="margin-right: 10px" Text="3" />
                                                    <asp:ListItem Value="4" style="margin-right: 10px" Text="4" />
                                                    <asp:ListItem Value="5" style="margin-right: 10px" Text="5" />
                                                    <asp:ListItem Value="6" style="margin-right: 10px" Text="6" />
                                                    <asp:ListItem Value="7" style="margin-right: 10px" Text="7" />
                                                    <asp:ListItem Value="8" style="margin-right: 10px" Text="8" />
                                                    <asp:ListItem Value="9" style="margin-right: 10px" Text="9" />
                                                    <asp:ListItem Value="10" style="margin-right: 10px" Text="10" />
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                        <div id="div_frecuencia" class="form-group required">
                                            <label for="frecuencia" class="control-label col-md-4  requiredField">Frecuencia del dolor<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="frecuencia" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_actividad" class="form-group required">
                                            <label for="actividad" class="control-label col-md-4  requiredField">Actividad del dolor<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="actividad" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_exploracion" class="form-group required">
                                            <label for="exploracion" class="control-label col-md-4  requiredField">Exploración física<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="exploracion" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_impresion" class="form-group required">
                                            <label for="impresion" class="control-label col-md-4  requiredField">Impresión diagnóstica<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="impresion" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_plan" class="form-group required">
                                            <label for="plan" class="control-label col-md-4  requiredField">Plan de tratamiento<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="plan" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_observaciones" class="form-group required">
                                            <label for="observaciones" class="control-label col-md-4  requiredField">Observaciones<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="observaciones" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="panel_seguimiento" Visible="false" runat="server">
                <div class="card">
                    <div class="card-header" id="headingseguimiento">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapse_consulta_seguimiento" aria-expanded="false" aria-controls="collapse_consulta_seguimiento">
                                Consulta seguimiento
                            </button>
                        </h5>
                    </div>
                    <div id="collapse_consulta_seguimiento" class="collapse show" aria-labelledby="headingseguimiento" data-parent="#accordion">
                        <div class="card-body">
                            <div id="signupbox_2" style="" class="">
                                <div class="panel panel-info">
                                    <div class="panel-body">
                                        <div id="div_subjetivos" class="form-group required">
                                            <label for="subjetivos" class="control-label col-md-4  requiredField">Datos subjetivos<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="subjetivos" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_objetivos" class="form-group required">
                                            <label for="objetivos" class="control-label col-md-4  requiredField">Datos Objetivos<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="objetivos" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                        <div id="div_intervencion" class="form-group required">
                                            <label for="itnervencion" class="control-label col-md-4  requiredField">Intervención<span class="asteriskField">*</span> </label>
                                            <div class="controls col-md-8 ">
                                                <asp:TextBox ID="intervencion" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </asp:Panel>

            <div id="div_notas" class="form-group required" style="margin-top: 10px">
                <label for="notas" class="control-label col-md-4  requiredField">Notas<span class="asteriskField">*</span> </label>
                <div class="controls col-md-8 ">
                    <asp:TextBox ID="notas" ClientIDMode="Static" CssClass="input-md textinput textInput form-control" runat="server" Style="margin-bottom: 10px" />
                </div>
            </div>

        </div>
        <br />
        <div class="form-group">
            <div class="aab controls col-md-4 "></div>
            <div class="controls col-md-8 ">
                <asp:Button id="crear" Text="Crear consulta" class="btn btn btn-primary"  runat="server" />
            </div>
        </div>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/moment.min.js" integrity="sha512-Q1f3TS3vSt1jQ8AwP2OuenztnLU6LwxgyyYOG1jgMW/cbEMHps/3wjvnl1P3WTrF3chJUWEoxDUEjMxDV8pujg==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" integrity="sha512-GDey37RZAxFkpFeJorEUwNoIbkTwsyC736KNSYucu1WJWFK9qTdzYub8ATxktr6Dwke7nbFaioypzbDOQykoRg==" crossorigin="anonymous"></script>
    <script>
        $.noConflict();
        jQuery(document).ready(function ($) {
            $(function () {
                $('#fecha').datetimepicker({
                    format: 'YYYY/MM/DD'
                });
            });
        });
  </script>
</asp:Content>

