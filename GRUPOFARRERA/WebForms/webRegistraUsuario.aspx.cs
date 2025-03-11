using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_webRegistraUsuario : System.Web.UI.Page
{
    ConexionBD conexion = new ConexionBD();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string cadena = "SELECT nombre from Cat_Departamentos order by nombre ";
            conexion.Autocompletar(ddlDepartamento, cadena);
            ddlDepartamento.Items.Insert(0, new ListItem("--Seleccione Departamento--", "0"));

            string cadena2 = "SELECT nombre from Cat_Puesto order by nombre";
            conexion.Autocompletar(ddlPuesto, cadena2);
            ddlPuesto.Items.Insert(0, new ListItem("--Seleccione Puesto--", "0"));

            cadena2 = "SELECT concepto from Cat_Solicitud order by concepto";
            conexion.Autocompletar(ddlLtipoSolicitud, cadena2);
            ddlLtipoSolicitud.Items.Insert(0, new ListItem("--Seleccione Tipo--", "0"));

            string cadena3 = "SELECT nombre from Cat_APP order by nombre";
            conexion.AutocompletarLT(ltApps, cadena3);

            string Usuario = Server.HtmlEncode(Request.Cookies["Config"]["Token"].ToUpper());
            string IdEMpresa = Server.HtmlEncode(Request.Cookies["Config"]["id_Empresa"].ToUpper());

        }
    }

    protected void btnValida_ServerClick(object sender, EventArgs e)
    {
        //SI EL MOVIMIENTO ES TIPO ALTA......Va y consulta el correo si existe en la tabla de GF_DIRECTORIO Y EN ESTATUS A
        //
      //  System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "<script>  Swal.fire({position: 'top-end', icon: 'success', title: 'Solicitud creada Exitosamente', showConfirmButton: false, timer: 2000}) </script>", false);


    }

    protected void btnSolicitud_ServerClick(object sender, EventArgs e)
    {
        // Validamos primero los campos obligatorios


        //ingresamos a la solicitud

        int idPerson = 0;
        string fullname = txtNombre.Text.ToUpper();
        string nombre = txtNombres.Text.ToUpper();
        string apaterno = txtApaterno.Text.ToUpper();
        string amaterno = txtAmaterno.Text.ToUpper();
        string rfc = txtRfca.Value.ToUpper().Trim();
        string curp = curp_input.Text.ToUpper();
        string nss = txtNSS.Text;
        string fechaNac = Convert.ToDateTime(txtFechaN.Text).ToString("dd-MM-yyyy");
        string emailcorp = txtEmail.Text.ToLower() ;
        string emailpers = txtEmail2.Text.ToLower();
        string telefonocorp = txtTel.Text.ToLower().Replace("(","").Replace(")", "").Trim().Replace("-", "").Replace(" ", "").TrimStart();
        string telefonoperson = txtTel2.Text.ToLower().Replace("(", "").Replace(")", "").Trim().Replace("-", "").Replace(" ", "").TrimStart();
        string cp = txtCP.Text.ToLower();
        string estado = txtEstado.Text.ToLower();
        string direccion = txtDireccion.Text.ToUpper();

        #region Consulta
        string idMarca = "SELECT idsolicitud from Cat_Solicitud WHERE(concepto = '" + ddlLtipoSolicitud.SelectedValue + "')";
        string idsolicitudx = conexion.LEERCADENA(idMarca);
        #endregion
        double idsolicitud = ParsearDouble(idsolicitudx);
        #region Consulta
        string Usuario = Server.HtmlEncode(Request.Cookies["Config"]["Token"].ToUpper());
        string IdEMpresa = Server.HtmlEncode(Request.Cookies["Config"]["id_Empresa"].ToUpper());

        string cadena2 = "SELECT top(1)idPerson from GF_Credenciales where usuario ='"+ Usuario + "'";
        string resp = conexion.LEERCADENA(cadena2);
        #endregion
        double idsolicitante = ParsearDouble(resp); // idperson  GF_Credenciales
        string fecha_alta = DateTime.Now.ToShortDateString() + " " + DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString();
        string fecha_baja = "";
        int idtipomotivo = 0;
        string observa1 = txtObserva1.Text.ToUpper();
        string observa2 = "";

        string estatus = "A"; //status de solicitud
        

        string idusuariocreacion = "";
        string idusuarioactualizacion = "";
        string fechacreacion =  DateTime.Now.ToShortDateString() + " " + DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString(); 
        string fechaactualizacion = "";

     

       // Response.Write("dsada " +ltApps.Items[0].ToString());
        //return;
        string cadena = "INSERT INTO GF_SolicitudPersonal(fullname,nombre,aPaterno,aMaterno,RFC," +
            "Curp,NSS,fecNacim,emailCorp,emailPerson,telefonoCorp,telefonoPerson,CP,estado,direccion,idSolicitud," +
            "idSolicitante,fechaAlta,fechaBaja,idTipoMotivo,observa1,observa2,estatus,idUsuarioCreacion," +
            "idUsuarioActualizacion,fechaCreacion,fechaActualizacion) VALUES('"+ fullname + "','"+ nombre + "','"+ apaterno + "','"+ amaterno + "','"+ rfc + "'," +
            "'"+ curp + "','"+nss+"','"+ fechaNac + "','"+ emailcorp + "','"+ emailpers + "','"+ telefonocorp + "','"+ telefonoperson + "','"+ cp + "','"+estado+"','"+ direccion + "','"+ idsolicitud + "'," +
            "'"+ idsolicitante + "','"+ fecha_alta + "','"+ fecha_baja + "','"+ idtipomotivo + "','"+ observa1 + "','"+ observa2 + "','"+ estatus + "','"+ idusuariocreacion + "'," +
            "'"+ idusuarioactualizacion + "','"+ fechacreacion + "','"+ fechaactualizacion + "')";
        
        if (conexion.actualizarQueryRespuesta(cadena, "true") == 1)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "<script>  Swal.fire({position: 'top-end', icon: 'success', title: 'Solicitud creada Exitosamente', showConfirmButton: false, timer: 2000}) </script>", false);

            // SI NO EXISTE EL CORREO EN DIRECTORIO
            // INSERTA EN LA TABLA GF_DIRECTORIO

            //genera un pdf y envialo al correo y descargalo.




            DSSolicitud ds = new DSSolicitud();
            //dtPrueba = conexion.datos("SELECT venLlave,venX003,venX004,venX006 FROM arciven WHERE venX001 = '" + nEmpresa.ToString() + "' ORDER BY venLlave");
            //foreach (DataRow row in dtPrueba.Rows)
            //{

               DSSolicitud.Datos1Row rowDatosEncabezado = ds.Datos1.NewDatos1Row();
                //rowDatosEncabezado.Dt1 = razonsocial;
                
                ds.Datos1.AddDatos1Row(rowDatosEncabezado);
          //  }

            #region IMAGEN QR
            //string dame = "SELECT maeX686 FROM arcimae WHERE maeLlave = '" + Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TDA"]["maeL"])) + "'";
            //string imgagenEmpresa = conexion.LEERCADENA(dame);
            //if (imgagenEmpresa.Length == 0)
            //{
            //    dame = "SELECT maeX054 FROM arcimae WHERE maeLlave = '" + Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TDA"]["maeL"])) + "'";
            //    imgagenEmpresa = conexion.LEERCADENA(dame);
            //}

            //string nRutaxml = Server.MapPath(@"/images/" + imgagenEmpresa + "");
            //string nArchivoqr = nRutaxml;
            //DsPromotor.LogoRow rowDatosEncabezado5 = ds.Logo.NewLogoRow();
            //rowDatosEncabezado5.Imagen = ConversionImagen(nArchivoqr);

            //ds.Logo.AddLogoRow(rowDatosEncabezado5);

            #endregion

            ReportDocument rp = new ReportDocument();
            rp.Load(Server.MapPath("../ReportesCat/CR_CatProm.rpt"));
            rp.SetDataSource(ds);
            string fechacorta = DateTime.Now.ToString("dd-MM-yyyy");
            string folio = "" + Convert.ToInt32(Server.HtmlEncode(Request.Cookies["TDA"]["maeL"]));

            rp.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("../Papeleria/Cat-Promotores-Suc" + folio + "-" + fechacorta + ".pdf"));
            ScriptManager.RegisterClientScriptBlock(this, GetType(), "redirect2", "window.open('../Papeleria/Cat-Promotores-Suc" + folio + "-" + fechacorta + ".pdf','_blank');", true);
            System.Threading.Thread.Sleep(1000);
            rp.Close();
            rp.Dispose();

        }

         
     
	  

    }

    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        //validar si existe en la tabla de credenciales


        string Consulta = "select * from GF_Personal where RFC = '" + txtRfca.Value + "'";
        string Resp = conexion.LEERCADENA(Consulta);
        if (ParsearDouble(Resp) > 0)
        {
            #region consulta STRING
            string Valor1 = "select fullname from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtNombres);
            Valor1 = "select nombre from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtNombre);
            Valor1 = "select apaterno from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtApaterno);
            Valor1 = "select amaterno from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtAmaterno);

            Valor1 = "select CURP from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, curp_input);
            Valor1 = "select NSS from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtNSS);

            Valor1 = "select fecNacim from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtFechaN);
        if(txtFechaN.Text.Length > 1)
            {
                txtFechaN.Text = Convert.ToDateTime(txtFechaN.Text).ToString("yyyy-MM-dd");
            }
            else
            {
                string fecha = txtRfca.Value;
                string anio = fecha.Substring(4, 2);
                string mes = fecha.Substring(6, 2);
                string dia = fecha.Substring(8, 2);


                string fecha_n = dia +"/"+ mes+"/19" +anio ;                
                txtFechaN.Text = Convert.ToDateTime(fecha_n).ToString("yyyy-MM-dd");
            }
            



            Valor1 = "select CASE WHEN genero = 'M' THEN 'HOMBRE' when genero = 'F' THEN 'MUJER' END from GF_Personal where RFC = '" + txtRfca.Value + "'";
            string legal = conexion.LEERCADENA(Valor1);
           
            if (legal.Length > 1)
            {
                txtCSexo.ClearSelection(); //making sure the previous selection has been cleared
                txtCSexo.Items.FindByValue(legal).Selected = true;
            }
            Valor1 = "select emailCorp from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtEmail);
            Valor1 = "select emailPerson from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtEmail2);
            Valor1 = "select telefonoCorp from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtTel);
            Valor1 = "select telefonoPerson from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtTel2);
            Valor1 = "select CP from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtCP);
            Valor1 = "select estado from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtEstado);
            Valor1 = "select direccion from GF_Personal where RFC = '" + txtRfca.Value + "'";
            conexion.cargaridSuc(Valor1, txtDireccion);
            
           
            #endregion


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#R_RP').modal();", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Verifique!', 'Este RFC no se encuentra en la BD CORPORATIVA', 'warning') </script>");

           // System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "mensaje", "<script>  Swal.fire({position: 'top-end', icon: 'success', title: 'Solicitud creada Exitosamente', showConfirmButton: false, timer: 2000}) </script>", false);

        }
    }
    private double ParsearDouble(string valor)
    {
        double result;
        return double.TryParse(valor, out result) ? result : 0;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string selectedValues = string.Empty;
        foreach (ListItem item in ltApps.Items)
        {

            if (item.Selected)
            {

                selectedValues += item.Text + "<br />";

            }

        }

        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal('Verifique!', '" + selectedValues + "', 'warning') </script>");

    }

   
}