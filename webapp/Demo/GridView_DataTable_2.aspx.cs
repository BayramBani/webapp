using DevExpress.Web;
using DevExpress.Web.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webapp.Demo
{
    public partial class GridView_DataTable_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public DataTable CustomDataSource
        {
            get
            {
                if (Session["CustomTable"] == null)
                    Session["CustomTable"] = CreateDataSource();
                return (DataTable)Session["CustomTable"];
            }
            set
            {
                Session["CustomTable"] = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            CreateGrid();
        }

        protected void grid_DataBinding(object sender, EventArgs e)
        {
            (sender as ASPxGridView).DataSource = CustomDataSource;
        }

        protected void grid_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            int id = (int)e.Keys[0];
            DataRow dr = CustomDataSource.Rows.Find(id);
            CustomDataSource.Rows.Remove(dr);

            ASPxGridView grid = sender as ASPxGridView;
            grid.CancelEdit();
            e.Cancel = true;
        }
        protected void grid_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            int id = (int)e.OldValues["Id"];
            DataRow dr = CustomDataSource.Rows.Find(id);
            dr[0] = e.NewValues["Id"];
            dr[1] = e.NewValues["Data"];

            ASPxGridView grid = sender as ASPxGridView;
            grid.CancelEdit();
            e.Cancel = true;
        }
        protected void grid_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            CustomDataSource.Rows.Add(e.NewValues["Id"], e.NewValues["Data"]);

            ASPxGridView grid = sender as ASPxGridView;
            grid.CancelEdit();
            e.Cancel = true;
        }

        protected void grid_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridView grid = new ASPxGridView();
            e.NewValues["Id"] = grid.GetHashCode();
        }

        private void CreateGrid()
        {
            ASPxGridView grid = new ASPxGridView();
            grid.ID = "grid";
            Form.Controls.Add(grid);
            grid.KeyFieldName = "Id";

            grid.DataBinding += grid_DataBinding;
            grid.RowDeleting += grid_RowDeleting;
            grid.RowUpdating += grid_RowUpdating;
            grid.RowInserting += grid_RowInserting;
            grid.InitNewRow += grid_InitNewRow;
            grid.DataBind();

            if (!IsPostBack)
            {
                GridViewCommandColumn c = new GridViewCommandColumn();
                grid.Columns.Add(c);
                c.ShowEditButton = true;
                c.ShowNewButton = true;
                c.ShowDeleteButton = true;
            }
        }

        private DataTable CreateDataSource()
        {
            DataTable dataTable = new DataTable("DataTable");
            dataTable.Columns.Add("Id", typeof(Int32));
            dataTable.PrimaryKey = new DataColumn[] { dataTable.Columns[0] };
            dataTable.Columns.Add("Data", typeof(string));
            for (int i = 0; i < 5; i++)
            {
                dataTable.Rows.Add(i, "Data" + i.ToString());
            }
            return dataTable;
        }
    }
}