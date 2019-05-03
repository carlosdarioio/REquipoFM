using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DXInvIT
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DataTable xDT = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "SELECT id[#],tienda[tiend],equipo[equip],lugar[lugar]  FROM [blog].[dbo].[CFInvEquipoIT]";
            xDT = MainClass.xGetFromSQL(sql);
            GridView1.DataSource = xDT;
            GridView1.DataBind();
            
        }
    }
}