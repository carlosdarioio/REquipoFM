using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {

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
                                                                                                 //DataTable xDT =
            MainClass.xPOSTToSQL(string.Format(sql, xtienda, xdepartamento, xequipo, xestado, xlugar,  xmacadrres, xserie, xmarca, xmodelo,DateTime.Now.ToString("yyyyMMdd")));
            Dictionary<string, string> name = new Dictionary<string, string>();
            name.Add("1", "Listo");//            
            string myJsonString = (new JavaScriptSerializer()).Serialize(name);
            return myJsonString;

        }
    }
}