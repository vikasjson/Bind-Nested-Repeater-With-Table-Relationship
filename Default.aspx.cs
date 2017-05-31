using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataSet ds = bindThreetablesRelationship();
            rpMainCat.DataSource = ds.Tables["maincat"];
            Page.DataBind();            
        }
    }
    public DataSet bindThreetablesRelationship()
    {
        DataSet ds = new DataSet();
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["mySQLconn"].ConnectionString;
        MySqlConnection cnn = new MySqlConnection(conn);
        try
        {

            MySqlDataAdapter cmd1 = new MySqlDataAdapter("select * from super_category", cnn);
            //Create and fill the DataSet.           
            cmd1.Fill(ds, "maincat");
            //Create a second DataAdapter for the Titles table.
            MySqlDataAdapter cmd2 = new MySqlDataAdapter("select * from category", cnn);
            cmd2.Fill(ds, "cat");

            MySqlDataAdapter cmd3 = new MySqlDataAdapter("select * from subcategory", cnn);
            cmd3.Fill(ds, "subcat");

            // ************first relation ***************

            DataColumn dc1 = ds.Tables["maincat"].Columns["id"];
            DataColumn dc2 = ds.Tables["cat"].Columns["suprcat_id"];

            DataRelation res1 = new DataRelation("rel1", dc1, dc2);

            ds.Relations.Add(res1);
            ds.Relations[0].Nested = true;
            // ************second relation ***************

            DataColumn dc3 = ds.Tables["cat"].Columns["id"];
            DataColumn dc4 = ds.Tables["subcat"].Columns["cat_id"];

            DataRelation res2 = new DataRelation("rel2", dc3, dc4);

            ds.Relations.Add(res2);
            ds.Relations[1].Nested = true;


            //Create the relation bewtween the Category and Sub-Category tables.

            //ds.Relations.Add("myrelation",
            //ds.Tables["maincat"].Columns["id"],
            //ds.Tables["cat"].Columns["suprcat_id"]);

        }
        catch (Exception ex)
        {

        }
        return ds;
        cnn.Close();
    }
}