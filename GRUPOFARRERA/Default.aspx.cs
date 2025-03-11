using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ConexionBD conexion = new ConexionBD();
    protected void Page_Load(object sender, EventArgs e)
    {
        string cadena3 = "SELECT nombre from Cat_APP order by nombre";
        conexion.AutocompletarLT(lstBoxTest, cadena3);
    }
    protected void btnGetSelectedValues_Click(object sender, EventArgs e)
    {
        string message = "";
        foreach (ListItem item in lstBoxTest.Items)
        {
            if (item.Selected)
            {
                message += "Student Name : " + item.Text + ", Enrollment No : " + item.Value + "\\n";
            }
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }
}