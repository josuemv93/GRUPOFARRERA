using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_frmAccesosSuc2 : System.Web.UI.Page
{

    static string VerifUser, NombreEmpleado, NombreSuc;
    static int Suc;

    ConexionBD conexion = new ConexionBD();

    protected void Page_Load(object sender, EventArgs e)
    {
        int Priv = 1;
       

       

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#Loggear').modal();", true);
        if (!IsPostBack)
        {
            Int32 hora = DateTime.Now.Hour;
            if (hora > 0 && hora <= 11)
            {
                lblStatus.Text = "BUENOS DÍAS";
            }
            else if (hora >= 12 && hora <= 19)
            {
                lblStatus.Text = "BUENAS TARDES";
            }
            else // (hora >=20 && hora <= 24)
            {
                lblStatus.Text = "BUENAS NOCHES";
            }
            if (Request.Cookies["Config"] != null)
            {
               
                lblUsuario.Text = Server.HtmlEncode(Request.Cookies["Config"]["Token"].ToUpper());
               
                VerifUser = Server.HtmlEncode(Request.Cookies["Config"]["VrfUs"]);
                NombreEmpleado = Server.HtmlEncode(Request.Cookies["Config"]["Token"].ToUpper());



                string cadena = "SELECT dbo.Cat_Empresas.razon FROM dbo.Cat_Empresas INNER JOIN dbo.GF_Credenciales ON dbo.Cat_Empresas.idMarca = dbo.GF_Credenciales.idMarca WHERE(dbo.GF_Credenciales.usuario = '" + lblUsuario.Text + "')";
                conexion.Autocompletar(DropDownList1, cadena);
                DropDownList1.Items.Insert(0, new ListItem("--Seleccione Empresa--", "0"));


                cadena = "SELECT nombre from Cat_Acciones";
                conexion.Autocompletar(DropDownList2, cadena);
                DropDownList2.Items.Insert(0, new ListItem("--¿En que te puedo apoyar?--", "0"));




            }
            //CargaDrowp

          
        }
    }
    private double ParsearDouble(string valor)
    {
        double result;
        return double.TryParse(valor, out result) ? result : 0;
    }
  

    protected void txtSucursal_TextChanged(object sender, EventArgs e)
    {

    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {

        if (DropDownList1.Text.ToString() == ""|| DropDownList1.SelectedIndex == 0)
        {

            Response.Write("<script>alert('Verifique la sucursal a ingresar');</script>");
            return;
        }
        else
        {
            Proceso_ingresar();
        }



        //Response.Write("<script>alert('"+Program.NombreSuc+"');</script>");        
    }

    public void Proceso_ingresar()
    {
        string idMarca = "SELECT dbo.Cat_Empresas.idMarca FROM dbo.GF_Credenciales INNER JOIN dbo.Cat_Empresas ON dbo.GF_Credenciales.idMarca = dbo.Cat_Empresas.idMarca WHERE(dbo.Cat_Empresas.razon = '" + DropDownList1.SelectedValue + "')";
        string IDEmpresaX = conexion.LEERCADENA(idMarca);


        #region Nos traemos los datos para ingresar las cookies

        //NOMBRE EMPLEADO
        HttpCookie cookie = new HttpCookie("Config");
        cookie["Token"] = lblUsuario.Text.ToUpper();
        cookie["id_Empresa"] = IDEmpresaX;
        cookie.Expires = DateTime.Now.AddDays(1);
        Response.Cookies.Add(cookie);

        #endregion
        Response.Redirect("webMain.aspx");

    }
}