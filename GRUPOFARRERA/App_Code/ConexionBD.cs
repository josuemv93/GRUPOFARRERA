using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;
using System;

/// <summary>
/// Descripción breve de ConexionBD
/// </summary>
public class ConexionBD
{
    SqlConnection cnn; //Conexion
    SqlCommand cmd; //
    SqlDataReader dr; //Leer
    SqlDataAdapter da; //Sql para grid view
    DataTable dt; //Para ver en gridview
    DataSet ds;
    DataRow drs;
    private static string error;
    public string micadenaaa { get; set; }
    Encriptar_Deencriptar encri = new Encriptar_Deencriptar();

    public ConexionBD()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //

        //localhost
        //
       


        cnn = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=UserAutoCorp;Integrated Security=True");

        //server CALIMAN   
        //192.168.1.114 ip local
        // cnn = new SqlConnection(@"server=masgas.dyndns.tv\MASGAS,1433;User Id=SecsaApp;password=Secsatgz2020;Persist Security Info=True;database=ArkasisMicrocred19");

    }

    #region DESCARGAR ARCHIVOS EN EXCEL
    public DataTable datos(string cadena)
    {
        DataTable dtxx = new DataTable();

        using (SqlCommand cmd = new SqlCommand(cadena))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = cnn;
                sda.SelectCommand = cmd;
                sda.Fill(dtxx);
            }
        }


        return dtxx;
    }

    #endregion

    #region VALIDAR USUARIO

    public DataSet dsConsultar(string stLogin, string stPassword)
    {
        try
        {

            DataSet dsConsulta = new DataSet();
            cnn.Open();

            cmd = new SqlCommand("spConsultarUsuario", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cLogin", stLogin));
            cmd.Parameters.Add(new SqlParameter("@cPasword", stPassword));

            cmd.ExecuteNonQuery();
            da = new SqlDataAdapter(cmd);
            da.Fill(dsConsulta);
            return dsConsulta;


        }
        catch (Exception ex)
        {
            throw ex;
        }

        finally
        {
            cnn.Close();
        }
    }
    #endregion

    #region VALIDAR IDENT CLIENTE

    public DataSet dsConsultaIdCte(string stLogin, string stPassword)
    {
        try
        {

            DataSet dsConsulta = new DataSet();
            cnn.Open();

            cmd = new SqlCommand("spConsultarIdentity", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@talbla", stLogin));
            cmd.Parameters.Add(new SqlParameter("@ident", stPassword));

            cmd.ExecuteNonQuery();
            da = new SqlDataAdapter(cmd);
            da.Fill(dsConsulta);
            return dsConsulta;


        }
        catch (Exception ex)
        {
            throw ex;
        }

        finally
        {
            cnn.Close();
        }
    }
    #endregion

    

    

    #region INSERTAR, ACTUALIZAR Y ELIMINAR CADENAS
    public void Alta_Baja_eliminacion(string cadena)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo llevar acabo el proceso: " + ex.Message + "');</script>");

        }
        finally
        {
            cnn.Close();
        }
    }

    #endregion

    #region ACTUALIZAR SOLAMENTE SI EJECUTO EL PROCESO
    public int actualizarQueryRespuesta(string cadena, string valor)
    {
        int respuesta = 0; //0falso, 1 exitoso
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            cmd.ExecuteNonQuery();
            if (valor != "falso")
            {

                respuesta = 1;
            }
        }
        catch (Exception ex)
        {
            respuesta = 0;
            HttpContext.Current.Response.Write("<script>alert('No se pudo Actualizar: " + ex.Message + "');</script>");

        }
        finally
        {
            cnn.Close();
        }
        return respuesta;
    }
    #endregion   

    #region CARGAR TEXTBOX DE SUCURSAL
    public void cargaridSuc(string cadenass, TextBox txtEmpresa)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadenass, cnn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtEmpresa.Text = dr[0].ToString();
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo Cargar la table de datos: " + ex.Message + "');</script>");
        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion   

    #region CARGAR LABEL DE SUCURSAL
    public void CargaGridLabel(string cadenass, Label txtEmpresa)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadenass, cnn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtEmpresa.Text = dr[0].ToString();
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo Cargar la table de datos: " + ex.Message + "');</script>");
        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion

    #region AUTOCOMPLETAR DropDownList
    public void Autocompletar(DropDownList cbBox, string cadena)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            dr = cmd.ExecuteReader();
            cbBox.Items.Clear();
            while (dr.Read())
            {
                cbBox.Items.Add(dr[0].ToString());
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo Cargar la table de datos: " + ex.Message + "');</script>");
        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion

    #region AUTOCOMPLETAR Listbox
    public void AutocompletarLT(ListBox cbBox, string cadena)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            dr = cmd.ExecuteReader();
            cbBox.Items.Clear();
            while (dr.Read())
            {
                cbBox.Items.Add(dr[0].ToString());
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo Cargar la table de datos: " + ex.Message + "');</script>");
        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion


    #region Verifca si el REGISTRO ya se encuentra 
    public bool verificaREGISTRO(string cadena)
    {
        bool bandera = false;
        string salida = "";

        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                bandera = true;
                //nombre.Text = dr[0].ToString();
            }

            dr.Close();
        }
        catch (Exception ex)
        {
            salida = "No se conecto: " + ex.Message;
            HttpContext.Current.Response.Write(salida);
        }
        finally
        {
            cnn.Close();
        }
        return bandera;
    }
    #endregion



    #region CARGAR EN GRIDVIEW
    public void cargardatos(GridView dgv, string codigo) //Para mostrar en el datagridview (2)
    {
        try
        {
            cnn.Open();
            da = new SqlDataAdapter(codigo, cnn);
            dt = new DataTable();
            da.Fill(dt); //Llenar data table
            dgv.DataSource = dt; //Llenar el grid view a partir del data table  
            dgv.DataBind();
            cnn.Close();
        }

        catch (Exception ex)
        {
            //  HttpContext.Current.Response.Write("<script>alert('No existen registros que generar con esos datos ... " + ex.Message + "');</script>");
        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion

    #region CARGAR EN DATALIS
    public void cargardatos2(DataList dgv, string codigo) //Para mostrar en el datagridview (2)
    {
        try
        {
            cnn.Open();
            da = new SqlDataAdapter(codigo, cnn);
            dt = new DataTable();
            da.Fill(dt); //Llenar data table
            dgv.DataSource = dt; //Llenar el grid view a partir del data table  
            dgv.DataBind();
            cnn.Close();
        }


        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("<script>alert('Tabla sin Registros de busqueda: " + ex.Message + "');</script>");

        }
        finally
        {
            cnn.Close();
        }
    }
    #endregion

    #region Consulta la imagen 
    public void verImagen2(string cadena, Image pb)
    {
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);

            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            dp.Fill(dataSet);

            if (dataSet.Tables[0].Rows.Count == 1)
            {
                byte[] bytes = (byte[])cmd.ExecuteScalar();
                string strBase64 = Convert.ToBase64String(bytes);
                pb.ImageUrl = "data:Image/png;base64," + strBase64;
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('No se pudo consultar la Imagen: " + ex.Message + "');</script>");

        }
        cnn.Close();
    }
    #endregion

    #region MOSTRAR STRING DE CONSULTA
    public string LEERCADENA(string cadena)
    {
        string valor = "";
        try
        {
            cnn.Open();
            cmd = new SqlCommand(cadena, cnn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                valor = dr[0].ToString();
            }
            dr.Close();
        }
        catch (Exception ex)
        {
            valor = "";
        }
        finally
        {
            cnn.Close();
        }
        return valor;
    }
    #endregion
}