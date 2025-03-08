using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
   
    ConexionBD conexion = new ConexionBD();
    public static int Priv = 1;
    static int nEmpresa;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            

            this.Form.Attributes.Add("autocomplete", "off");
            if (Request.Cookies["Config"] != null)
            {
                txtUsuario.Value = Request.Cookies["Config"]["Token"];

            }
           
         

        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet dsConsulta = conexion.dsConsultar(txtUsuario.Value, txtContraseña.Value);
        if (dsConsulta.Tables[0].Rows.Count > 0)
        {
            string Consulta1 = "select top (1) idMarca from GF_Credenciales where usuario = '" + txtUsuario.Value + "'";
            string Resulta1 = conexion.LEERCADENA(Consulta1);


            #region Nos traemos los datos para ingresar las cookies

            //NOMBRE EMPLEADO
            HttpCookie cookie = new HttpCookie("Config");
            cookie["Token"] = txtUsuario.Value.ToUpper();
            cookie["id_Empresa"] = Resulta1;
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);

            #endregion
            Response.Redirect("WebForms/frmAccesosSuc.aspx");

        }
        else
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Error', 'Verifica el Usuario y/o Contraseña', 'error') </script>");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#processing-modal3').modal();", true);
        }

    }
    private double ParsearDouble(string valor)
    {
        double result;
        return double.TryParse(valor, out result) ? result : 0;
    }

    protected void btLogin_Click(object sender, EventArgs e)
    {
       
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
}