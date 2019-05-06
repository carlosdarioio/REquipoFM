<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="RegistrarEquipo.aspx.cs" Inherits="DXInvIT.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--INICIO-->
    <div class="jumbotron">
      <div class="container">
        <h1>Registrar Equipos</h1>
        <!--<p>Rellenar Tienda. Departamento. Equipo. Lugar. Estado.. </p>-->
        
            
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-12">
            <!--________________________________________________-->
             <!-- general form elements disabled -->
            <div class="card card-warning">
              <div class="card-header">
                <h3 class="card-title">Rellenar Datos</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div role="form">             
                    <!-- select -->   
                  <div class="form-group">
                    <label>Tienda</label>
                    <select id="tienda" class="form-control" runat="server">
                        <option></option>                        
                    </select>
                  </div> 

                     <!-- select -->
                  <div class="form-group">
                    <label>Departamento.</label>
                    <select id="departamento" class="form-control" runat="server">
                      <option></option>        
                    </select>
                  </div> 

                     <!-- select 
                         PC
                         -->
                  <div class="form-group">
                    <label>Equipo</label>
                    <select id="equipo" class="form-control" runat="server">
                        <option></option>                                              
                    </select>
                  </div> 
         
                  <div class="form-group">
                    <label>Lugar</label>
                    <select id="lugar" class="form-control" runat="server">
                    <option></option>                    
                    </select>
                  </div> 

                    <div class="form-group">
                    <label>Estado</label>
                    <select  id="estado" class="form-control" runat="server">
                      <option></option>                    
                    </select>
                  </div> 



                   <div class="form-group">
                    <label>MACAdrres</label>
                    <input class="form-control simple-field-data-mask" id="macadrres" type="text" data-mask="AA-AA-AA-AA-AA-AA-AA-AA-AA-AA-AA-AA" placeholder="00-09-0f-1F-E0-09">
                  </div> 

                    <div class="form-group">
                    <label>Serie</label>
                    <input class="form-control" id="serie" type="text" placeholder="Serie" required>
                  </div> 

                    <div class="form-group">
                    <label>Marca</label>
                    <input class="form-control" id="marca" type="text" placeholder="Marca" required>
                  </div> 

                    <div class="form-group">
                    <label>Modelo</label>
                    <input class="form-control" id="modelo" type="text" placeholder="Modelo" required>
                  </div> 


                     <button type="button" class="btn btn-primary dxbs-button" id="btnBuscar" onclick="updateChange()">
                        Guardar
                     </button>

                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            <!--__________________________________________________-->
          
        </div>
       
      </div>
     </div>

    <!--FIN-->

    <script type="text/javascript">
        function updateChange() {
            
            //var tienda = $("#tienda option:selected").val();
            var tienda = $("#<%= tienda.ClientID %>").val();
            var departamento = $("#<%= departamento.ClientID %>").val();
            var equipo = $("#<%= equipo.ClientID %>").val();
            var lugar = $("#<%= lugar.ClientID %>").val();
            var estado = $("#<%= estado.ClientID %>").val();
           
            var macadrres = $("#macadrres").val();
            var serie = $("#serie").val();
            var marca = $("#marca").val();
            var modelo = $("#modelo").val();

            /*alert('tienda ' + tienda);
            alert('departamento ' + departamento);
            alert('equipo '+  equipo);
            alert('lugar ' + lugar);
            alert('estado ' + estado);

            alert('macadrres ' + macadrres);
            alert('serie ' + serie);
            alert('marca ' + marca);
            alert('modelo' + modelo);*/
            //tienda, departamento, equipo, lugar, estado, macadrres, serie, marca, modelo
            
            if (macadrres != "" && serie != "" && marca != "" && modelo != "") {
                $.ajax({
                    type: 'POST',
                    cache: 'false',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: 'RegistrarEquipo.aspx/InserttData',
                    data: JSON.stringify({ xtienda: tienda, xdepartamento: departamento, xequipo: equipo, xlugar: lugar, xestado: estado, xmacadrres: macadrres, xserie: serie, xmarca: marca, xmodelo: modelo }),
                    success: function (response) {
                        var result = JSON.parse(response.d);

                        alert(result['1']);
                        window.location.reload();
                    },
                    error: function (response) {
                        alert("error2 " + response.d);
                        window.location.reload();
                    }
                });/**/
            } else { alert('Error');}
        }






    </script>


<script type="text/javascript">

   

    
</script>
    


    <script type="text/javascript" src="http://code.jquery.com/jquery-3.0.0.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/qunit/qunit-1.11.0.js"></script>
  
  <script type="text/javascript" src="./sinon-1.10.3.js"></script>
  <script type="text/javascript" src="./sinon-qunit-1.0.0.js"></script>

  <script type="text/javascript" src="./jquery.mask.js"></script>
  <script type="text/javascript" src="jquery.mask.test.js"></script>
    
</asp:Content>
