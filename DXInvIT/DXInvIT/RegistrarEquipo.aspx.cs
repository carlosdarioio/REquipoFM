using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXInvIT
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable xDT = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            xDT = MainClass.xGetFromSQL("select * from [blog].[dbo].[CFInvEquipoIT_td]");
            tienda.DataSource = xDT;
            tienda.DataTextField = "name";
            tienda.DataValueField = "id";
            tienda.DataBind();




        }
        [WebMethod]
        public static string InserttData(string xtienda, string xdepartamento, string xequipo, string xlugar, string xestado, string xmacadrres, string xserie, string xmarca, string xmodelo)
        {
            string sql = @"INSERT INTO [blog].[dbo].[CFInvEquipoIT]
                       ([tienda]
                       ,[departamento]
                       ,[equipo]
                       ,[estado]                       
                       ,[lugar]
                       ,[macadrres]
                       ,[serie]
                       ,[marca]
                       ,[modelo]
                        ,[fecha])
                 VALUES
                       ('{0}',
                       '{1}',
                       '{2}',
                       '{3}',
                       '{4}',
                       '{5}',
                       '{6}',
                       '{7}',
                       '{8}',
                       '{9}')";//select 'Listo'[r]


            string mac= "";
            try
            {
                mac = MainClass.xGetFromSQL(string.Format("SELECT  [macadrres]  FROM [blog].[dbo].[CFInvEquipoIT]  where macadrres='{0}'", xmacadrres)).Rows[0][0].ToString();
            }
            catch
            {
                mac = "";
            }
            Dictionary<string, string> name = new Dictionary<string, string>();
            if (mac == "")
            {
                MainClass.xPOSTToSQL(string.Format(sql, xtienda, xdepartamento, xequipo, xestado, xlugar, xmacadrres, xserie, xmarca, xmodelo, DateTime.Now.ToString("yyyyMMdd")));
                name.Add("1", "Datos Actualizados");

            }
            else
            { name.Add("1", "Ya existe"); }
            
                        
            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;

        }
    }
}