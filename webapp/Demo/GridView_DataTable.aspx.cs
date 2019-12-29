using DevExpress.Web;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webapp.App_Code;

namespace webapp.Demo
{
    public partial class GridView_DataTable : System.Web.UI.Page
    {

        private webapp.App_Code.Data.WebAppDataContext db = new App_Code.Data.WebAppDataContext();
        private webapp.App_Code.DataBaseHandler db_h = new DataBaseHandler("webapp_dbConnectionString");
        private DataTable dt;
        private String msg = " [start] ";

        protected void Page_Load(object sender, EventArgs e)
        {
            Literal_Msg.Text = msg;
        }

        protected void Button_Importer_Click(object sender, EventArgs e)
        {
            msg += " [Button_Importer_Click] ";

            dt = db_h.GetDataFromDataBase("SELECT * FROM FONCTION");
            dt.TableName = "FONCTION";
            dt.PrimaryKey = new DataColumn[] { dt.Columns["ID"] };

            Session["DataTable_CB"] = dt;

            ASPxGridView_Main.DataSource = dt;
            ASPxGridView_Main.DataBind();

            Literal_Msg.Text = msg;
        }

        protected void ASPxGridView_Main_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxGridView gridView = (ASPxGridView)sender;
            dt = (DataTable)Session["DataTable_CB"];
            DataRow row = dt.NewRow();
            e.NewValues["ID"] = GetNewId();
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
                if (enumerator.Key.ToString() != "Count")
                    row[enumerator.Key.ToString()] = enumerator.Value;
            gridView.CancelEdit();
            e.Cancel = true;
            dt.Rows.Add(row);
        }

        protected void ASPxGridView_Main_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            dt = (DataTable)Session["DataTable_CB"];

            ASPxGridView gridView = (ASPxGridView)sender;
            DataRow row = dt.Rows.Find(e.Keys[0]);
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
                row[enumerator.Key.ToString()] = enumerator.Value;
            gridView.CancelEdit();
            e.Cancel = true;
            //ShowData(gridView, dt);
        }

        protected void ASPxGridView_Main_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ASPxGridView gridView = (ASPxGridView)sender;
            int i = gridView.FindVisibleIndexByKeyValue(e.Keys[gridView.KeyFieldName]);
            e.Cancel = true;
            dt = (DataTable)Session["DataTable_CB"];
            dt.Rows.Remove(dt.Rows.Find(e.Keys[gridView.KeyFieldName]));
            //ShowData(gridView, dt);
        }

        protected void ShowData(ASPxGridView grid, DataTable data)
        {
            grid.DataSource = data;
            grid.DataBind();
        }

        private int GetNewId()
        {
            if (dt.Rows.Count == 0) return 0;
            int max = Convert.ToInt32(dt.Rows[0]["ID"]);
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                if (Convert.ToInt32(dt.Rows[i]["ID"]) > max)
                    max = Convert.ToInt32(dt.Rows[i]["ID"]);
            }
            return max + 1;
        }

        protected void SaveToDataBase()
        {
            try
            {
                dt = (DataTable)Session["DataTable_CB"];

            }
            catch (Exception ex)
            {
                Literal_Msg.Text = ex.ToString();
            }
        }

        protected DataTable GetDataTable()
        {
            dt = new DataTable();
            dt.Columns.Add("ID", typeof(int));
            dt.Columns.Add("LIBELLE", typeof(string));
            dt.PrimaryKey = new DataColumn[] { dt.Columns["ID"] };
            return dt;
        }

        protected void Button_Valider_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["DataTable_CB"];

            GridView_Test.DataSource = dt;
            GridView_Test.DataBind();

            Literal_Msg.Text = msg;
        }

        protected void ASPxGridView_Main_DataBinding(object sender, EventArgs e)
        {
            dt = (DataTable)Session["DataTable_CB"];
            (sender as ASPxGridView).DataSource = dt;
        }
    }
}