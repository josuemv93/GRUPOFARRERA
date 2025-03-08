using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Security;
using System.Security.Permissions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_MasterPage : System.Web.UI.MasterPage
{
    public enum MessageType { Success, Error, Info, Warning };


    ConexionBD conexion = new ConexionBD();
    protected void ShowMessage(string Message, MessageType type)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Usuario = Server.HtmlEncode(Request.Cookies["Config"]["Token"].ToUpper());
            string IdEMpresa = Server.HtmlEncode(Request.Cookies["Config"]["id_Empresa"].ToUpper());

            #region Consultas

            string Consulta1 = "select fullname from GF_Credenciales where usuario = '" + Usuario + "' and idMarca = " + IdEMpresa + "";
            string Resulta1 = conexion.LEERCADENA(Consulta1);
            lblUser2.Text = Resulta1;


            lblUser.Text = Usuario;

            string Consulta2 = "select departamento from GF_Credenciales where usuario = '" + Usuario + "' ";
            string Resulta2 = conexion.LEERCADENA(Consulta2);
            lbldepartamento.Text = Resulta2;

            string Consulta3 = "select puesto from GF_Credenciales where usuario = '" + Usuario + "' ";
            string Resulta3 = conexion.LEERCADENA(Consulta3);
            lblPuesto.Text = Resulta3;


        
            string Consulta4 = "select razon from Cat_Empresas where idMarca = " + IdEMpresa + "";
            string Resulta4 = conexion.LEERCADENA(Consulta4);
            lblEmpresa.Text = Resulta4;

            string Consulta5 = "select nombreComercial from Cat_Empresas where idMarca = " + IdEMpresa + "";
            string Resulta5 = conexion.LEERCADENA(Consulta5);
            lblComercial.Text = Resulta5;
            #endregion

        }
    }
    protected void btnSalida_ServerClick(object sender, EventArgs e)
    {
        Response.Cookies["Config"].Expires = DateTime.Now.AddDays(-1);


        Response.Redirect("../webLogin.aspx");
    }
    //public void verImagen2()
    //{
    //    nEmpresa = 101;
    //    if (Request.Cookies["TDA"] != null)
    //    {
    //        nEmpresa = Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TDA"]["maeL"]));

    //    }
    //    string cadena = "Select maeX054 from arcimae WHERE maeLlave = '" + nEmpresa + "'";
    //    string nombreImg = conexion.LEERCADENA(cadena);
    //    Image2.ImageUrl = "../images/" + nombreImg.ToString();
    //    Image1.ImageUrl = "../images/" + nombreImg.ToString();
    //    Image3.ImageUrl = "../images/" + nombreImg.ToString();
    //}

}