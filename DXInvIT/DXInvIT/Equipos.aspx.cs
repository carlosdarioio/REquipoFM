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
            string sql = @"SELECT t0.id[#],t1.name[tiend],t2.name[equip],t3.name[lugar]  FROM [blog].[dbo].[CFInvEquipoIT] t0
                        inner join [blog].[dbo].CFInvEquipoIT_td t1 on t0.tienda=t1.id
                        inner join [blog].[dbo].CFInvEquipoIT_Equip t2 on t0.equipo=t2.id
                        inner join [blog].[dbo].CFInvEquipoIT_Place t3 on t0.lugar=t3.id
                        order by t0.id desc";
            xDT = MainClass.xGetFromSQL(sql);
            GridView1.DataSource = xDT;
            GridView1.DataBind();
            
        }
    }
}