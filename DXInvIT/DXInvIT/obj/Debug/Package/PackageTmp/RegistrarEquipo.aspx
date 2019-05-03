<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="RegistrarEquipo.aspx.cs" Inherits="DXInvIT.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 


<input type='text' id='textbox' />
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
                    <select id="tienda" class="form-control">
                        <option value="025">025</option>
                        <option value="002">002</option>
                        <option value="053">053</option>
                        <option value="081">081</option>
                        <option value="038">038</option>
                        <option value="045">045</option>
                    </select>
                  </div> 

                     <!-- select -->
                  <div class="form-group">
                    <label>Departamento.</label>
                    <select id="departamento" class="form-control">
                      <option value="Vendedor">Vendedor</option> 
                        <option value="Creditos">Creditos</option>   
                        <option value="Caja">Caja</option>   
                        <option value="Recepcion">Recepcion</option> 
                        <option value="Contabilidad">Contabilidad</option> 
                        <option value="Compras">Compras</option>   
                        <option value="Mercadeo">Mercadeo</option>                             
                        <option value="DistribucionLogistica ">Distribucion y Logistica </option>   
                        <option value="Financiero">Financiero</option>   
                        <option value="Mayoreo">Mayoreo</option>   
                        <option value="RRHH">Gestion Humana </option>   
                        <option value="Legal">Legal</option>   
                        <option value="Multimaderas">Multimaderas</option>   
                        <option value="Informatica">Informatica</option>   
                        <option value="GG">GG</option>   
                    </select>
                  </div> 

                     <!-- select 
                         PC
                         -->
                  <div class="form-group">
                    <label>Equipo</label>
                    <select id="equipo" class="form-control">
                      <option value="PC">PC</option>                     
                        <option value="Monitor">Monitor</option>                     
                        <option value="Mouse">Mouse</option>                     
                        <option value="Teclado">Teclado</option>                     
                        <option value="Impresora">Impresora</option>                     
                    </select>
                  </div> 

               

                     <!-- select 
                         Oficina
Tienda
Bodega-->
                  <div class="form-group">
                    <label>Lugar</label>
                    <select id="lugar" class="form-control">
                      <option value="Tienda">Tienda</option>                     
                       <option value="Bodega">Bodega</option>                     
                         <option value="Oficina">Oficina</option>                     
                    </select>
                  </div> 

                    <!--
                        .
Nuevo
Recien Usado
Usado
Viejo
Mal Estado-->
                    <div class="form-group">
                    <label>Estado</label>
                    <select  id="estado" class="form-control">
                      <option>Nuevo</option>                     
                        <option value="RecienUsado">Recien Usado</option>                     
                        <option value="Usado">Usado</option>
                        <option value="Viejo">Viejo</option>
                        <option value="MalEstado">Mal Estado</option>
                    </select>
                  </div> 



                   <div class="form-group">
                    <label>MACAdrres</label>
                    <input class="form-control cep" id="macadrres" type="text">
                  </div> 

                    <div class="form-group">
                    <label>Serie</label>
                    <input class="form-control" id="serie" type="text" placeholder="xx-xx-xx-xx" required>
                  </div> 

                    <div class="form-group">
                    <label>Marca</label>
                    <input class="form-control" id="marca" type="text" placeholder="xx-xx-xx-xx" required>
                  </div> 

                    <div class="form-group">
                    <label>Modelo</label>
                    <input class="form-control" id="modelo" type="text" placeholder="xx-xx-xx-xx" required>
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
            
            var tienda = $("#tienda option:selected").val();
            var departamento = $("#departamento option:selected").val();
            var equipo = $("#equipo option:selected").val();
            var lugar = $("#lugar option:selected").val();
            var estado = $("#estado option:selected").val();
           
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
            

            $.ajax({
                type: 'POST',
                cache: 'false',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: 'RegistrarEquipo.aspx/InserttData',
                data: JSON.stringify({ xtienda: tienda, xdepartamento: departamento, xequipo: equipo, xlugar: lugar, xestado: estado, xmacadrres: macadrres, xserie: serie, xmarca: marca, xmodelo: modelo }),
                success: function (response) {
                    var result = JSON.parse(response.d);                                   
                    
                    alert('Datos Actualizados');
                    window.location.reload();                    
                },
                error: function (response) {
                    alert("error2 " + response.d);
                    window.location.reload();
                }
            });/**/
        }






    </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="Scripts/jquery.mask.js"></script>
<script type="text/javascript">

   

    
    $(document).ready(function () {
        var options = {
            onKeyPress: function (cep, e, field, options) {
                var masks = ['00000-000', '0-00-00-00'];
                var mask = (cep.length > 7) ? masks[1] : masks[0];
                $('#macadrres').mask(mask, options);
            }
        };

        $('#macadrres').mask('00000-000', options);
    });
</script>


    
</asp:Content>
