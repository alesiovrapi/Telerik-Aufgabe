using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using Telerik.Web.UI;

public partial class Default : System.Web.UI.Page
{
    // Wird beim Laden der Seite aufgerufen und initialisiert die grundlegenden Einstellungen
    protected void Page_Load(object sender, EventArgs e)
    {
        // Prüft, ob es sich um den ersten Aufruf der Seite handelt (kein Postback)
        if (!IsPostBack)
        {
            // Setzt den ersten Tab als aktiv
            RadTabStrip1.SelectedIndex = 0;
            // Zeigt die erste PageView an
            RadMultiPage1.SelectedIndex = 0;
            // Lädt die Mitarbeiterdaten in das erste Grid
            BindMitarbeiterGrid();
        }
    }

    // Event-Handler für das Klicken auf einen Tab
    protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
    {
        // Synchronisiert die angezeigte PageView mit dem ausgewählten Tab
        RadMultiPage1.SelectedIndex = RadTabStrip1.SelectedIndex;

        // Lädt die entsprechenden Daten basierend auf dem ausgewählten Tab
        if (RadTabStrip1.SelectedIndex == 0)
            BindMitarbeiterGrid();  // Lädt Mitarbeiterdaten für Tab 1
        else
            BindProjektGrid();      // Lädt Projektadaten für Tab 2
    }

    // Methode zum Laden und Binden der Mitarbeiterdaten
    private void BindMitarbeiterGrid()
    {
        // Holt die Verbindungszeichenkette aus der Web.config
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        // Verwendet using-Statement für automatisches Ressourcen-Management
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Mitarbeiter", conn))
        {
            // Erstellt eine DataTable und füllt sie mit den Mitarbeiterdaten
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Setzt die Datenquelle des Grids und bindet die Daten
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }

    // Methode zum Laden und Binden der Projektdaten
    private void BindProjektGrid()
    {
        // Holt die Verbindungszeichenkette aus der Web.config
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        // Verwendet using-Statement für automatisches Ressourcen-Management
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Projekt", conn))
        {
            // Erstellt eine DataTable und füllt sie mit den Projektdaten
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Setzt die Datenquelle des Grids und bindet die Daten
            RadGrid2.DataSource = dt;
            RadGrid2.DataBind();
        }
    }


}
