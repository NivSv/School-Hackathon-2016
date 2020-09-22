using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient; 

public class Dal
{
    private string connectionUrl;
    private OleDbConnection con;
    private OleDbCommand cmd;
    private OleDbDataAdapter da;

    public Dal()
    {
        SetConnectionUrl();
    }

    private void SetConnectionUrl()
    {
        this.connectionUrl = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/Users.accdb");
    }

    public void InsertUpdateDelete(string sql)
    {
        this.con = new OleDbConnection(this.connectionUrl);
        this.cmd = new OleDbCommand(sql, this.con);
        this.con.Open();
        this.cmd.ExecuteNonQuery();
        this.con.Close();
    }

    public DataTable GetDataTable(string sql)
    {
        this.con = new OleDbConnection(this.connectionUrl);
        this.da = new OleDbDataAdapter(sql, this.con);
        DataSet ds = new DataSet();
        this.da.Fill(ds);
        DataTable dt = ds.Tables[0];
        return dt;
    }
}