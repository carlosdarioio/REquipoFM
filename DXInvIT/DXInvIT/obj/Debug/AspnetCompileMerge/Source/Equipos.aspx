<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="DXInvIT.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--INICIO-->   
    <div class="containerZ">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-12">
            <!--________________________________________________-->
            <!--cart-->
            

             <div class="card">
            <div class="card-header">
              <h3 class="card-title">Registrados</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>              
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
            
            <!--__________________________________________________-->
          
        </div>
       
      </div>
     </div>

    <!--FIN-->

   

</asp:Content>
