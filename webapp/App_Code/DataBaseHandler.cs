using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace webapp.App_Code
{
    public class DataBaseHandler
    {
        private string connectionStrings;
        public string result;

        public DataBaseHandler(string connectionStrings)
        {
            this.connectionStrings = connectionStrings;
        }
        public DataTable GetDataFromDataBase(string query)
        {
            DataTable dt = new DataTable();
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings[connectionStrings].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            conn.Close();
            da.Dispose();
            return dt;
        }

        public String SaveDataToDataBase(DataTable dt)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings[connectionStrings].ConnectionString;
            SqlConnection conn = new SqlConnection(connString);
            SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(conn);

            foreach (DataColumn c in dt.Columns)
                sqlBulkCopy.ColumnMappings.Add(c.ColumnName, c.ColumnName);

            sqlBulkCopy.DestinationTableName = dt.TableName;
            try
            {
                conn.Open();
                sqlBulkCopy.WriteToServer(dt, DataRowState.Added);
                conn.Close();

                result = "ok";
            }
            catch (Exception ex)
            {
                result = "error";
                //msg = ex.ToString();
            }

            return result;
        }
    }


}