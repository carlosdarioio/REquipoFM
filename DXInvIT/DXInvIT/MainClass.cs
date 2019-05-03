using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DXInvIT
{
    public class MainClass
    {
        private static string conexion
        {
            get
            {
                return "Data Source=10.1.1.252;Initial Catalog=blog;Integrated Security=False;Persist Security Info=False;User ID=sa;Password=Server01";
            }
        }
        public static DataTable xGetFromSQL(string xSql)
        {
            try
            {
                DataTable xDT = new DataTable();
                using (SqlDataAdapter xDA = new SqlDataAdapter(xSql, conexion))
                {
                    xDA.SelectCommand.CommandTimeout = 600000;
                    xDA.Fill(xDT);
                }

                return xDT;
            }
            catch { throw; }
        }

        public static void xPOSTToSQL(string xSQL)
        {
            using (SqlCommand xCommand = new SqlCommand(xSQL, new SqlConnection(conexion)))
            {
                xCommand.Connection.Open();
                xCommand.ExecuteNonQuery();
                xCommand.Connection.Close();
            }
        }
    }
}