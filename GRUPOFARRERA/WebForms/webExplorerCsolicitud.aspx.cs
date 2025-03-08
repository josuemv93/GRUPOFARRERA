using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_webExplorerCsolicitud : System.Web.UI.Page
{

    ConexionBD conexion = new ConexionBD();

    DataTable dtPrueba;

    readonly PagedDataSource _pgsource = new PagedDataSource();
    int _firstIndex, _lastIndex;
    private int _pageSize = 10;

    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            return ((int)ViewState["CurrentPage"]);
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Button34.Disabled = true;
            CargarDatos();
        }
    }

    protected void GridView1_DataBound1(object sender, EventArgs e)
    {
        //GridView1.HeaderRow.Cells[0].Text = "ID_DMS";
        //GridView1.HeaderRow.Cells[1].Text = "ID_MARCA";


    }





    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                row.ToolTip = string.Empty;


            }
            else
            {
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                row.ToolTip = "Haga clic para seleccionar esta fila";
            }
        }
    }

    private double ParsearDouble(string valor)
    {
        double result;
        return double.TryParse(valor, out result) ? result : 0;
    }

    private void HandlePaging()
    {
        var dt = new DataTable();
        dt.Columns.Add("PageIndex"); //Start from 0
        dt.Columns.Add("PageText"); //Start from 1

        _firstIndex = CurrentPage - 5;
        if (CurrentPage > 5)
            _lastIndex = CurrentPage + 5;
        else
            _lastIndex = 10;

        // Check last page is greater than total page then reduced it 
        // to total no. of page is last index
        if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
        {
            _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
            _firstIndex = _lastIndex - 10;
        }

        if (_firstIndex < 0)
            _firstIndex = 0;

        // Now creating page number based on above first and last page index
        for (var i = _firstIndex; i < _lastIndex; i++)
        {
            var dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }

        rptPaging.DataSource = dt;
        rptPaging.DataBind();


    }
    public void CargarDatos()
    {
        string cadenav = "SELECT dbo.GF_SolicitudPersonal.fechaCreacion as 'Fecha Solicitud' ,dbo.GF_SolicitudPersonal.idSPerson AS Solicitud, dbo.GF_Personal.fullname AS 'Creada por', dbo.Cat_Solicitud.Concepto + ' USUARIO' AS [Tipo de Solicitud], dbo.GF_SolicitudPersonal.fullname AS Usuario, dbo.Cat_Empresas.Razon AS [Razon Social], dbo.Cat_Estatus.nombre AS [Status de Solicitud] FROM dbo.GF_SolicitudPersonal INNER JOIN dbo.Cat_Solicitud ON dbo.GF_SolicitudPersonal.idSolicitud = dbo.Cat_Solicitud.idSolicitud INNER JOIN dbo.GF_Personal ON dbo.GF_SolicitudPersonal.idSolicitante = dbo.GF_Personal.idPerson INNER JOIN dbo.Cat_Empresas ON dbo.GF_SolicitudPersonal.idUsuarioCreacion = dbo.Cat_Empresas.idMarca INNER JOIN  dbo.Cat_Estatus ON dbo.GF_SolicitudPersonal.estatus = dbo.Cat_Estatus.idEstatus";

        DataTable dtPrueba = conexion.datos(cadenav);
        _pgsource.DataSource = dtPrueba.DefaultView;
        _pgsource.AllowPaging = true;
        _pgsource.PageSize = _pageSize;
        _pgsource.CurrentPageIndex = CurrentPage;
        ViewState["TotalPages"] = _pgsource.PageCount;
        lbPrevious.Enabled = !_pgsource.IsFirstPage;
        lbNext.Enabled = !_pgsource.IsLastPage;
        lbFirst.Enabled = !_pgsource.IsFirstPage;
        lbLast.Enabled = !_pgsource.IsLastPage;
        GridView1.DataSource = _pgsource;
        GridView1.DataBind();
        HandlePaging();
    }

    protected void lbFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        CargarDatos();
    }
    protected void lbLast_Click(object sender, EventArgs e)
    {
        CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
        CargarDatos();
    }
    protected void lbPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        CargarDatos();
    }
    protected void lbNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        CargarDatos();
    }

    protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (!e.CommandName.Equals("newPage")) return;
        CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
        CargarDatos();
    }

    protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
        if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
        lnkPage.Enabled = false;
        lnkPage.BackColor = Color.FromName("#18a0cb");
        lnkPage.ForeColor = Color.FromName("#fdfdfd");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Right;
            e.Row.Cells[0].Width = 70;
            e.Row.Cells[1].Width = 300;

            e.Row.ToolTip = "Haga clic para seleccionar esta fila";
        }
    }



    protected void btnSalida_ServerClick(object sender, EventArgs e)
    {

    }

    protected void btLogin_ServerClick(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                row.ToolTip = string.Empty;

                Button34.Disabled = false;

                string Valor1 = "select RFC from GF_SolicitudPersonal where idSPerson = '" + row.Cells[1].Text.Trim() + "'";
                conexion.cargaridSuc(Valor1, txtRfca);


                string cadena2 = "SELECT concepto from Cat_Solicitud order by concepto";
                conexion.Autocompletar(ddlLtipoSolicitud, cadena2);

                string cntX021 = "SELECT dbo.Cat_Solicitud.Concepto AS [Tipo de Solicitud] FROM dbo.GF_SolicitudPersonal INNER JOIN dbo.Cat_Solicitud ON dbo.GF_SolicitudPersonal.idSolicitud = dbo.Cat_Solicitud.idSolicitud INNER JOIN dbo.GF_Personal ON dbo.GF_SolicitudPersonal.idSolicitante = dbo.GF_Personal.idPerson INNER JOIN dbo.Cat_Empresas ON dbo.GF_SolicitudPersonal.idUsuarioCreacion = dbo.Cat_Empresas.idMarca INNER JOIN  dbo.Cat_Estatus ON dbo.GF_SolicitudPersonal.estatus = dbo.Cat_Estatus.idEstatus  WHERE idSPerson = '" + row.Cells[1].Text.Trim() + "'";
                string legal = conexion.LEERCADENA(cntX021);

                if (legal.Length > 1)
                {
                    ddlLtipoSolicitud.ClearSelection(); //making sure the previous selection has been cleared
                    ddlLtipoSolicitud.Items.FindByValue(legal).Selected = true;
                }



                #region consulta STRING
                Valor1 = "select fullname from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtNombres);
                //Valor1 = "select nombre from GF_Personal where RFC = '" + txtRfca.Text + "'";
                //conexion.cargaridSuc(Valor1, txtNombre);
                //Valor1 = "select apaterno from GF_Personal where RFC = '" + txtRfca.Text + "'";
                //conexion.cargaridSuc(Valor1, txtApaterno);
                //Valor1 = "select amaterno from GF_Personal where RFC = '" + txtRfca.Text + "'";
                //conexion.cargaridSuc(Valor1, txtAmaterno);

                Valor1 = "select CURP from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, curp_input);
                Valor1 = "select NSS from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtNSS);

                Valor1 = "select fecNacim from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtFechaN);
                if (txtFechaN.Text.Length > 1)
                {
                    txtFechaN.Text = Convert.ToDateTime(txtFechaN.Text).ToString("yyyy-MM-dd");
                }
                else
                {
                    string fecha = txtRfca.Text;
                    string anio = fecha.Substring(4, 2);
                    string mes = fecha.Substring(6, 2);
                    string dia = fecha.Substring(8, 2);


                    string fecha_n = dia + "/" + mes + "/19" + anio;
                    txtFechaN.Text = Convert.ToDateTime(fecha_n).ToString("yyyy-MM-dd");
                }




                Valor1 = "select CASE WHEN genero = 'M' THEN 'HOMBRE' when genero = 'F' THEN 'MUJER' END from GF_Personal where RFC = '" + txtRfca.Text + "'";
                string legalX = conexion.LEERCADENA(Valor1);

                if (legal.Length > 1)
                {
                    txtCSexo.ClearSelection(); //making sure the previous selection has been cleared
                    txtCSexo.Items.FindByValue(legalX).Selected = true;
                }
                Valor1 = "select emailCorp from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtEmail);
                Valor1 = "select emailPerson from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtEmail2);
                Valor1 = "select telefonoCorp from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtTel);
                Valor1 = "select telefonoPerson from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtTel2);
                Valor1 = "select CP from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtCP);
                Valor1 = "select estado from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtEstado);
                Valor1 = "select direccion from GF_Personal where RFC = '" + txtRfca.Text + "'";
                conexion.cargaridSuc(Valor1, txtDireccion);


                #endregion
            }
            else
            {
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                row.ToolTip = "Haga clic para seleccionar esta fila";
            }
        }
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            //e.Row.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            //e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            //e.Row.Cells[6].HorizontalAlign = HorizontalAlign.Center;
            //e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Center;
            //e.Row.Cells[8].HorizontalAlign = HorizontalAlign.Right;
            //e.Row.Cells[0].Width = 70;
            //e.Row.Cells[1].Width = 70;
            //e.Row.Cells[2].Width = 350;
            //e.Row.Cells[3].Width = 160;
            //e.Row.Cells[4].Width = 110;
            //e.Row.Cells[5].Width = 50;
            //e.Row.Cells[6].Width = 50;
            //e.Row.Cells[7].Width = 60;
            //e.Row.Cells[8].Width = 120;
            //e.Row.Cells[8].Text = double.Parse(e.Row.Cells[8].Text).ToString("N2");
            e.Row.ToolTip = "Haga clic para seleccionar esta fila";
        }
    }

    protected void btnSolicitud_ServerClick(object sender, EventArgs e)
    {

    }
}