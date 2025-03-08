using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webLockScreen : System.Web.UI.Page
{
    ConexionBD conexion = new ConexionBD();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#processing-modal2').modal();", true);
            this.Form.Attributes.Add("autocomplete", "off");
            if (Request.Cookies["Config"] != null)
            {
                lblUsuario.Text = "";
                string cadena2 = "Select maeX002 from arcimae WHERE maeLlave = '101'";
                conexion.CargaGridLabel(cadena2, lblNombreCE);
                verImagen2();

                string path = HttpContext.Current.Request.Url.AbsolutePath;
                string var = "update arcipsw set OnlineStatus = '1', Ubicacion = '" + path + "' where pswLlave = '" + Request.Cookies["Config"]["Token"] + "' ";
                if (conexion.actualizarQueryRespuesta(var, "true") == 1)
                {
                }
            }


        }
       
    }
    public void verImagen2()
    {
        //string cadena = "Select maeX054 from arcimae WHERE maeLlave = '101";
        //string FOTOx = conexion.LEERCADENA(cadena);
        //Image5.Src = "../imagenes/" + FOTOx.ToString();

        string cadena = "Select maeX054 from arcimae WHERE maeLlave = '" + Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TDA"]["maeL"])) + "'";
        string nombreImg = conexion.LEERCADENA(cadena);
        Image1.ImageUrl = "../images/" + nombreImg.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void txtContraseña_TextChanged(object sender, EventArgs e)
    {
        
    }
}